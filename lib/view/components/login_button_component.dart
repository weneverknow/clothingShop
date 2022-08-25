import 'package:ecommerce_mvvm/provider/state/loading_state.dart';
import 'package:ecommerce_mvvm/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/loading_provider.dart';
import '../../provider/login_provider.dart';
import '../login_screen.dart';

class LoginButtonComponent extends ConsumerWidget {
  const LoginButtonComponent(
      {required this.email, required this.password, Key? key})
      : super(key: key);
  final String email;
  final String password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isloading = ref.watch(loadingProvider);
    final isemail = ref.watch(isEmail);
    final ispassword = ref.watch(isPassword);
    return MyButton(
        text: 'SIGN IN',
        isActive: ((isloading is Finished) &&
            ((isemail ?? '').isNotEmpty && (ispassword ?? '').isNotEmpty)),
        onPressed: () async {
          //if (email.isNotEmpty && password.isNotEmpty) {
          print("login executed");
          print("email $isemail");
          print("password $ispassword");
          await ref
              .read(loginProvider.notifier)
              .login(email: isemail ?? '', password: ispassword ?? '');
          //}
        });
  }

  login(WidgetRef ref) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      await ref
          .read(loginProvider.notifier)
          .login(email: email, password: password);
    }
  }
}
