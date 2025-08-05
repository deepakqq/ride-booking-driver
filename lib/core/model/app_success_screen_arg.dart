class AppSuccessScreenArg {
  final bool showMessage;
  final bool bgColorGreen;
  final String title;
  final String subtitle;
  final String btnText;
  final showRemindMe;

  AppSuccessScreenArg({
    this.btnText = "Done",
    this.showMessage = true,
    this.showRemindMe = false,
    this.bgColorGreen = false,
    this.title = "Your Password has changed",
    this.subtitle =
        "Don't worry, we'll let you know if there's a\nproblem with your account",
  });
}
