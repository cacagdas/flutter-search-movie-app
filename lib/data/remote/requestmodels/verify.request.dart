class VerifyRequest {
  String smsCode;
  String phoneNumber;
  String email;
  String deviceId;

  VerifyRequest({this.smsCode, this.phoneNumber, this.email, this.deviceId});

  Map<String, dynamic> toJson() => {
        "smsCode": smsCode,
        "phoneNumber": phoneNumber,
        "email": email,
        "deviceId": deviceId,
      };
}
