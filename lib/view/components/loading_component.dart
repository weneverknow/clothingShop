import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: SpinKitCubeGrid(
          color: Color.fromARGB(255, 233, 232, 232).withOpacity(0.5),
        ),
      ),
    );
  }
}

final loadingComponentProvider = Provider((_) => LoadingComponent());
