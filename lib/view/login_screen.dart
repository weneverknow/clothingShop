import 'package:ecommerce_mvvm/provider/loading_provider.dart';
import 'package:ecommerce_mvvm/provider/state/loading_state.dart';
import 'package:ecommerce_mvvm/provider/state/user_state.dart';
import 'package:ecommerce_mvvm/provider/login_provider.dart';
import 'package:ecommerce_mvvm/service/login_service.dart';
import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/shared/theme.dart';
import 'package:ecommerce_mvvm/view/components/loading_component.dart';
import 'package:ecommerce_mvvm/view/components/login_button_component.dart';
import 'package:ecommerce_mvvm/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final isEmail = StateProvider<String?>((_) {
  return null;
});

final isPassword = StateProvider<String?>((_) {
  return null;
});

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultpadding, vertical: defaultpadding * 1.5),
              child: Text(
                'Hello Again!\nWelcome\nback',
                style: TextStyle(
                    fontSize: 32,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 10, 44, 124)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultpadding, vertical: defaultpadding / 4),
              child: Consumer(builder: (context, ref, child) {
                return buildInput(
                    hintText: 'Your email address here',
                    controller: _emailController,
                    onChanged: (val) {
                      ref.read(isEmail.notifier).state = val;
                    });
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultpadding, vertical: defaultpadding / 4),
              child: Consumer(builder: (context, ref, child) {
                final openpass = ref.watch(openPassword);
                return buildInput(
                    hintText: 'Your password here',
                    controller: _passwordController,
                    obscureText: !openpass,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          ref
                              .read(openPassword.notifier)
                              .update((state) => !state);
                        },
                        child: Icon(!openpass
                            ? Icons.remove_red_eye_rounded
                            : Icons.remove_rounded)),
                    onChanged: (val) {
                      ref.read(isPassword.notifier).state = val;
                    });
              }),
            ),
            Consumer(builder: (context, ref, child) {
              final userState = ref.watch(loginProvider);
              return (userState is UnauthorizedUser)
                  ? const Padding(
                      padding: EdgeInsets.fromLTRB(defaultpadding,
                          defaultpadding / 2, defaultpadding, 0),
                      child: Text(
                        "User not found",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
            const SizedBox(
              height: defaultpadding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
              child: Builder(builder: (context) {
                return LoginButtonComponent(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }),
            )
          ],
        ),
        Consumer(builder: (context, ref, child) {
          final loading = ref.watch(loadingProvider);
          return (loading is Finished)
              ? const SizedBox.shrink()
              : ref.watch(loadingComponentProvider);
        }),
      ],
    ));
  }

  Widget buildInput(
      {String? hintText,
      TextEditingController? controller,
      bool obscureText = false,
      Function(String)? onChanged,
      Widget? suffixIcon}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: '$hintText',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blueGrey.shade100)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: primarycolor))),
    );
  }
}
