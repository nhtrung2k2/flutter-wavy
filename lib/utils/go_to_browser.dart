import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as devtool;

void onViewDetail(String url) async {
  Uri? uri = Uri.tryParse(url);
  if (uri != null) {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else
    // can't launch url, there is some error
    {
      devtool.log("Could not launch $url");
    }
  }
}
