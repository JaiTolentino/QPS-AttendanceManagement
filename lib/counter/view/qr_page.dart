import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ssoattendance/components/BottomNavbar.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QrView();
  }
}

class QrView extends StatefulWidget {
  const QrView({super.key});

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: QrImageView(
          data: 'DATA',
          size: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
      bottomNavigationBar: Bottomnavbar(
        index: 1,
      ),
    );
  }
}
