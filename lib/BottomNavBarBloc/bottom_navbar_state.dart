part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarState {}

class BottomNavbarInitState extends BottomNavbarState {
  BottomNavbarInitState();
}

class BottomNavbarLoadingState extends BottomNavbarState {
  BottomNavbarLoadingState();
}

class BottomNavbarSuccessState extends BottomNavbarState {
  final int selected;
  BottomNavbarSuccessState(this.selected);
}

class BottomNavbarFailedState extends BottomNavbarState {
  final String message;
  BottomNavbarFailedState(this.message);
}
