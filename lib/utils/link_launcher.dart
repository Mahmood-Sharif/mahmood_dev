import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);

  final didLaunch = await launchUrl(
    uri,
    mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );

  if (!didLaunch) {
    debugPrint('Could not launch $url');
  }
}

Future<void> launchEmail(String email) async {
  final uri = Uri(scheme: 'mailto', path: email);

  final didLaunch = await launchUrl(uri);

  if (!didLaunch) {
    debugPrint('Could not launch email client');
  }
}
