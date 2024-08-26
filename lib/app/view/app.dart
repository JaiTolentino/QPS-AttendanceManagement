import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ssoattendance/counter/view/home_page.dart';
import 'package:ssoattendance/counter/view/login_page.dart';
import 'package:ssoattendance/counter/view/qr_page.dart';
import 'package:ssoattendance/counter/view/scanner_page.dart';
import 'package:ssoattendance/l10n/l10n.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (context, state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: 'scanner/:eventId',
          builder: (context, state) {
            return ScannerPage(
              eventId: int.parse(state.pathParameters['eventId']!),
            );
          },
        ),
        GoRoute(
          path: 'qr',
          builder: (context, state) {
            return QrPage();
          },
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
