class SignInPhoneRequestData {
  String phoneNumber;
  String otpCode;

  SignInPhoneRequestData({
    required this.phoneNumber,
    required this.otpCode,
  });

  factory SignInPhoneRequestData.fromMap(Map<String, dynamic> json) => SignInPhoneRequestData(
    phoneNumber: json["phone_number"],
    otpCode: json["otp_code"],
  );

  Map<String, dynamic> toMap() => {
    "phone_number": phoneNumber,
    "otp_code": otpCode,
  };
}
