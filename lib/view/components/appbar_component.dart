import 'package:flutter/material.dart';

import '../../shared/constant.dart';
import '../widgets/my_back_button.dart';

class AppbarComponent extends StatelessWidget {
  const AppbarComponent({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: defaultpadding, vertical: 30),
      child: Stack(
        children: [
          MyBackButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
