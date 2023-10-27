import 'package:apollo23_app/models/user_model.dart';

class TreasuryRepository {
  static Future<int> sendTreasury(String qrCode, UserModel userModel) async {
    print('\n\n$qrCode - ${userModel.email}\n\n');
    await Future.delayed(const Duration(seconds: 3));
    return 200;
  }
}
