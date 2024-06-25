import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class MaterialPDFPage extends StatelessWidget {
  final String url;

  const MaterialPDFPage({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Material PDF',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: const PDF(
        swipeHorizontal: true,
      ).cachedFromUrl(url),
    );
  }
}
