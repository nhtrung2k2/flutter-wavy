import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail(String toEmail) async {
  final Uri url = Uri(scheme: 'mailto', path: toEmail);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could launch email';
  }
}
