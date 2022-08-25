import 'package:ecommerce_mvvm/shared/constant.dart';
import 'package:ecommerce_mvvm/shared/theme.dart';
import 'package:ecommerce_mvvm/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmationCheckoutSuccessScreen extends StatefulWidget {
  ConfirmationCheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationCheckoutSuccessScreen> createState() =>
      _ConfirmationCheckoutSuccessScreenState();
}

class _ConfirmationCheckoutSuccessScreenState
    extends State<ConfirmationCheckoutSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(defaultpadding),
              child: Image.asset(
                'assets/images/success.png',
              ),
            ),
            Text(
              'Order Success',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primarycolor,
                  fontSize: 24),
            ),
            const SizedBox(
              height: defaultpadding / 2,
            ),
            Text(
              'your order will be processed after payment successfull',
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false);
                },
                icon: Icon(Icons.home_rounded),
                label: Text('Back To Home'))
          ]),
        ));
  }
}
