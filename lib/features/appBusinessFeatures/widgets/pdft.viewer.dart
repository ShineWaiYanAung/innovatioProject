import 'package:flutter/material.dart';
import "package:syncfusion_flutter_pdfviewer/pdfviewer.dart";


class PDFViewerScreen extends StatelessWidget {
  final String title;
  final String filePath;

  const PDFViewerScreen({
    super.key,
    required this.title,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title),
      //   titleTextStyle: Theme.of(context).textTheme.titleMedium,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // ),
      body: SfPdfViewer.asset(
        filePath,
      ),
    );
  }
}

