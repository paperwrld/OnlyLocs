import 'package:bloc/bloc.dart';

class ShuffleIndexCubit extends Cubit<int> {
  ShuffleIndexCubit() : super(0); // Initial state is 0

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
