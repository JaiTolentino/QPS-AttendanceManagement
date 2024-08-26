part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent {}

class UpdateBottomNavbarValue extends BottomNavbarEvent {
  final int selected;
  UpdateBottomNavbarValue(this.selected);
}
