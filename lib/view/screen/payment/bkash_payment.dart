import 'package:bkash_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashPaymentScreen extends StatefulWidget {
  const BkashPaymentScreen({Key? key}) : super(key: key);

  @override
  State<BkashPaymentScreen> createState() => _BkashPaymentScreenState();
}

class _BkashPaymentScreenState extends State<BkashPaymentScreen> {
  String url = '';
  @override
  void initState() {
    super.initState();
    url = Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.pink100,
        elevation: 0,
        title: const Text(
          "Payment",
          style: TextStyle(
              color: AppColors.white100, fontWeight: FontWeight.bold),
        ),
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(url),
          ),
      ),
    );
  }
}
