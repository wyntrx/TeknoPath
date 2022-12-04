import 'package:otp/otp.dart';

class OTPGeneration {
  String generateOTP() {
    String otp;

    otp = OTP.generateTOTPCodeString(
        "ORSWW3TPOBQXI2BB", DateTime.now().millisecondsSinceEpoch,
        interval: 10);

    return otp;
  }
}
