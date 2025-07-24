import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  late final dio.Dio _dio;
  String? _token; // auth‑token (optional)

  ApiClient._internal() {
    _dio = dio.Dio(
      dio.BaseOptions(
        baseUrl: 'https://api.example.com', // ⬅️ Change this!
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (opt, handler) {
          if (_token != null) opt.headers['Authorization'] = 'Bearer $_token';
          log('➡️ ${opt.method.toUpperCase()} ${opt.path}');
          return handler.next(opt);
        },
        onResponse: (res, handler) {
          log('✅ ${res.statusCode} ${res.requestOptions.path}');
          return handler.next(res);
        },
        onError: (e, handler) {
          final msg = _extractMessage(e);
          if (msg.isNotEmpty) {
            Get.snackbar(
              'Error',
              msg,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
            );
          }
          return handler.next(e); // pass error forward
        },
      ),
    );
  }

  // ─────────── token setter ───────────
  void setAuthToken(String? t) => _token = t;

  // ─────────── HTTP helpers ───────────
  Future<dio.Response> get(String p, {Map<String, dynamic>? q}) =>
      _dio.get(p, queryParameters: q);

  Future<dio.Response> post(String p, {dynamic data}) =>
      _dio.post(p, data: data);

  Future<dio.Response> put(String p, {dynamic data}) => _dio.put(p, data: data);

  Future<dio.Response> delete(String p) => _dio.delete(p);

  // ─────────── File upload ───────────
  Future<dio.Response> uploadImage({
    required String endpoint,
    required File file,
    String field = 'image',
    Map<String, dynamic>? body,
  }) async {
    final form = dio.FormData.fromMap({
      if (body != null) ...body,
      field: await dio.MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    return _dio.post(endpoint, data: form);
  }

  // ─────────── Message extractor ───────────
  String _extractMessage(dio.DioException e) {
    try {
      final data = e.response?.data;
      if (data is Map && data['message'] != null) return data['message'];
      if (data is String) return data;
      return e.message ?? 'Unexpected error';
    } catch (_) {
      return 'Something went wrong';
    }
  }
}
