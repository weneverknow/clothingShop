import 'package:ecommerce_mvvm/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginService {
  Future<User?> login({required String email, required String password}) async {
    await Future.delayed(Duration(seconds: 5));
    print("[LoginService] email $email pass $password");
    if (users.any((element) => element.email == email)) {
      return users.firstWhere((element) => element.email == email);
    }
  }
}

final loginServiceProvider = Provider((_) => LoginService());
