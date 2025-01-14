import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 0));

  void increment() => emit(CounterState(counter: state.counter + 1));
  void decrement() => emit(CounterState(counter: state.counter - 1));
}
