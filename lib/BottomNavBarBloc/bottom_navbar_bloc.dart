import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navbar_state.dart';
part 'bottom_navbar_event.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  BottomNavbarBloc() : super(BottomNavbarInitState()) {
    on<UpdateBottomNavbarValue>(
      (event, emit) {
        emit(BottomNavbarLoadingState());
        try {
          emit(BottomNavbarSuccessState(event.selected));
        } catch (e) {
          emit(BottomNavbarFailedState(e.toString()));
        }
      },
    );
  }
}
