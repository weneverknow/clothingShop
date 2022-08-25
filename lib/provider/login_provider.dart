import 'package:ecommerce_mvvm/model/user.dart';
import 'package:ecommerce_mvvm/provider/loading_provider.dart';
import 'package:ecommerce_mvvm/provider/state/user_state.dart';
import 'package:ecommerce_mvvm/provider/user_provider.dart';
import 'package:ecommerce_mvvm/service/login_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<UserState> {
  LoginProvider(this.ref) : super(UserInitial());

  Ref ref;

  Future<void> login({required String email, required String password}) async {
    ref.read(loadingProvider.notifier).update();
    state = UserInitial();
    var user = await ref
        .read(loginServiceProvider)
        .login(email: email, password: password);
    ref.read(loadingProvider.notifier).update();
    if (user != null) {
      state = UserLoggedIn(user);
      ref.read(userProvider.notifier).init(user);
      //return true;
    } else {
      state = UnauthorizedUser();
    }
    //return false;
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginProvider, UserState>((ref) {
  return LoginProvider(ref);
});

final openPassword = StateProvider<bool>((_) => false);
