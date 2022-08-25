import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({required this.value, required this.data, Key? key})
      : super(key: key);
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: data,
        error: (err, obj) => Center(
              child: Text('Error : $err'),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
