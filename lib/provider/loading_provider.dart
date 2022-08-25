import 'package:ecommerce_mvvm/provider/state/loading_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingProvider extends StateNotifier<LoadingState> {
  LoadingProvider() : super(Finished());

  Future<void> update() async {
    state = (state is Waiting) ? Finished() : Waiting();
  }
}

final loadingProvider = StateNotifierProvider((_) => LoadingProvider());
