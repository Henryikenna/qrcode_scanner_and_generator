import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generate");
            },
            icon: const Icon(
              Icons.qr_code,
            ),
          ),
        ],
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          returnImage: true,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            print("Barcode found! ${barcode.rawValue}");
            if (capture.image != null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(barcode.rawValue ?? ""),
                      content: Image(
                        image: MemoryImage(image!),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            }
          }
        },
        // allowDuplicates: false,
        // onDetect: (capture, returnImage) {

        // print("Barcode found! ${capture.rawValue}");
        // if(capture.rawBytes != null){
        //   showDialog(context: context, builder: (context){
        //     return AlertDialog(
        //       title:  Text(capture.rawValue ?? ""),
        //       content: Image(image: MemoryImage(capture.rawBytes!),),
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Text('OK'),
        //         ),
        //       ],
        //     );
        //   });
        // }
        // }
      ),
      // body: Container(),
    );
  }
}
