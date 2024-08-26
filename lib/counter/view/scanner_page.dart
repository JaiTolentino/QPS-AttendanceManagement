import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrcode_reader_web/qrcode_reader_web.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({required this.eventId, super.key});
  final int eventId;

  @override
  Widget build(BuildContext context) {
    return ScannerView(
      eventId: eventId,
    );
  }
}

class ScannerView extends StatefulWidget {
  const ScannerView({required this.eventId, super.key});
  final int eventId;

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/home'),
        ),
        forceMaterialTransparency: true,
        title: Text('QR Scanner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QRCodeReaderSquareWidget(
            onDetect: (barcodes) {
              print('DATAAA ${barcodes.raw}');
            },
            size: MediaQuery.sizeOf(context).width * .8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sample Event'),
              Text('API Development'),
              Text('9:00 AM to 10:30 AM'),
            ],
          ),
        ],
      ),
    );
  }
}
