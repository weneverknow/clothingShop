import 'package:ecommerce_mvvm/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProvider extends StateNotifier<User?> {
  UserProvider() : super(null);

  Future<void> init(User user) async {
    state = user;
  }
}

final userProvider = StateNotifierProvider((_) => UserProvider());
