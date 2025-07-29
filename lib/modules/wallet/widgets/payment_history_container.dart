import 'package:annale_driver/core/theme/app_gradient.dart';
import 'package:annale_driver/core/values/app_redius.dart';
import 'package:annale_driver/modules/wallet/widgets/payment_history_tile.dart';
import 'package:flutter/material.dart';

class PaymentHistoryContainer extends StatelessWidget {
  const PaymentHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.r8,
        gradient: AppGradients.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          // height: 10,
          // width: 280,
          decoration: BoxDecoration(
            borderRadius: AppRadius.r8,
            color: Color(0xffffffff),
          ),
          child: Column(
            children: [
              PaymentHistoryTile(
                bigText: '123 Main St to 456 Oak Ave',
                smallText: '12:30 PM · \$12.50',
              ),
              PaymentHistoryTile(
                bigText: '789 Pine St to 321 Elm St',
                smallText: '10:00 AM · \$8.75',
              ),
              PaymentHistoryTile(
                bigText: 'Tip Received #0123',
                smallText: '10:00 AM · \$2.00',
                iconPath: "assets/images/icons/icon-tip.png",
              ),
              PaymentHistoryTile(
                bigText: '321 Elm St to 654 Cedar St',
                smallText: '6:45 PM · \$10.00',
              ),
              PaymentHistoryTile(
                bigText: '987 Maple Ave to 123 Main St',
                smallText: '4:00 PM · \$11.30',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
