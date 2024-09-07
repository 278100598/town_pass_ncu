import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  WebViewPage({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
        onPermissionRequest: (controller, request) async {
          return Future.value(
            PermissionResponseAction.GRANT(
              resources: request.resources,
            ),
          );
        },
      ),
    );
  }
}