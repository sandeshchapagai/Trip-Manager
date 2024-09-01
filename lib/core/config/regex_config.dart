class RegexConfig {
  static RegExp blockEmojis() {
    return RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  }

  static bool blockSymbol(String value) {
    //to block symbol except underscore and minus
    return !RegExp(r"^[a-zA-Z0-9_-]+$").hasMatch(value);
  }

  static bool checkEmail(String email) {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(email);
  }

  static bool checkUrl(String url) {
    return !RegExp("^(https?:\\/\\/)?"
            "((([A-Za-z\\d]([A-Za-z\\d-]*[A-Za-z\\d])*)\\.)+[A-Za-z]{2,}|"
            "((\\d{1,3}\\.){3}\\d{1,3}))"
            "(\\:\\d+)?(\\/[-A-Za-z\\d%_.~+]*)*"
            "(\\?[;&A-Za-z\\d%_.~+=-]*)?")
        .hasMatch(url);
  }

  static RegExp denySpace() {
    return RegExp(r'\s');
  }

  static RegExp digitAndDecimalOnly() {
    return RegExp(r'^\d+\.?\d{0,2}');
  }

  static RegExp digitOnly() {
    return RegExp(r'^[0-9]+');
  }

  static RegExp digitWithSpaceOnly() {
    return RegExp(r'^[\d\s]+');
  }

  static bool isOTPCodeInvalid(String otp) {
    if (otp.length != 5) {
      return true;
    }
    return false;
  }

  static bool isPhoneInvalid(String phoneNumber) {
    if (phoneNumber.length < 6 || phoneNumber.length > 20) {
      return true;
    }
    return false;
  }
}
