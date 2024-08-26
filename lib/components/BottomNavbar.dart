import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ssoattendance/BottomNavBarBloc/bottom_navbar_bloc.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavbarBloc()),
        ],
        child: BottomNavBarView(
          index: index,
        ));
  }
}

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Color.fromRGBO(228, 142, 60, 1),
      onTap: (value) {
        if (value == 0) {
          // BlocProvider.of<BottomNavbarBloc>(context)
          //     .add(UpdateBottomNavbarValue(value));
          context.go('/home');
        } else if (value == 1) {
          // BlocProvider.of<BottomNavbarBloc>(context)
          //     .add(UpdateBottomNavbarValue(value));
          context.go('/qr');
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Qr Code',
        ),
      ],
    );
  }
}
