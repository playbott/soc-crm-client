class OTPSendData {
  OTPSendData({
    required this.phoneNumber,
  });
  String phoneNumber;


  factory OTPSendData.fromMap(Map<String, dynamic> json) => OTPSendData(
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toMap() => {
    "phone_number": phoneNumber,
  };
}

class OTPSendDataResponse {
  String phoneNumber;
  bool success;
  String otpCode;

  OTPSendDataResponse({
    required this.phoneNumber,
    required this.success,
    required this.otpCode,
  });

  factory OTPSendDataResponse.fromMap(Map<String, dynamic> json) => OTPSendDataResponse(
    phoneNumber: json["phone_number"],
    success: json["success"],
    otpCode: json["otp_code"],
  );

  Map<String, dynamic> toMap() => {
    "phone_number": phoneNumber,
    "success": success,
    "otp_code": otpCode,
  };
}
