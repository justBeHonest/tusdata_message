class StringUtils {
  static bool emailValidation(String email) {
    var emailRegex =
        r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  static bool isNullOrEmpty(String? pdfUrl) {
    return pdfUrl == null || pdfUrl.trim() == '';
  }
}
