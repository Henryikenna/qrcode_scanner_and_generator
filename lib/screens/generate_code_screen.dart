import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCodeScreen extends StatefulWidget {
  const GenerateCodeScreen({super.key});

  @override
  State<GenerateCodeScreen> createState() => _GenerateCodeScreenState();
}

class _GenerateCodeScreenState extends State<GenerateCodeScreen> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/scan");
            },
            icon: const Icon(
              Icons.qr_code_scanner,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
            if (qrData != null)
              PrettyQrView.data(
                data: qrData!,
                decoration: const PrettyQrDecoration(
                  image: PrettyQrDecorationImage(
                    padding: EdgeInsets.all(10),
                    image: AssetImage('images/sslogo_purple3.png'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
