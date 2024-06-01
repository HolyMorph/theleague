import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../style/my_colors.dart';

class MyWebView extends StatelessWidget {
  final String title;
  final String url;
  MyWebView({required this.title, required this.url, Key? key}) : super(key: key);
  late final WebViewController _webViewController;
  final ValueNotifier _isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _initWebViewController(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (BuildContext context, value, Widget? child) {
              return child ??
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      WebViewWidget(controller: _webViewController),
                      if (value) const Center(child: CircularProgressIndicator(color: MyColors.primaryColor)),
                    ],
                  );
            },
          );
        },
      ),
    );
  }

  Future<void> _initWebViewController() async {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _isLoading.value = false;
          },
          onNavigationRequest: (NavigationRequest request) async {
            var baseUri = Uri.parse(url);
            var requestUri = Uri.parse(request.url);

            bool isEqual = baseUri.scheme == requestUri.scheme && baseUri.host == requestUri.host && baseUri.query == requestUri.query;

            if (!isEqual) {
              launchUrlString(
                request.url,
                mode: LaunchMode.externalApplication,
              );
            }
            if (GetPlatform.isIOS) {
              return NavigationDecision.navigate;
            }

            return NavigationDecision.prevent;
          },
        ),
      );
    _isLoading.value = true;
    await _webViewController.loadRequest(Uri.parse(url));
  }
}
