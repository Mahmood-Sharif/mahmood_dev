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

Future<void> launchAsset(String assetPath) async {
  final uri = Uri.parse(assetPath);

  final didLaunch = await launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
    webOnlyWindowName: '_blank',
  );

  if (!didLaunch) {
    debugPrint('Could not launch asset: $assetPath');
  }
}

Future<void> launchWebDocument(String documentPath) async {
  final uri = Uri.base.resolve(documentPath);

  final didLaunch = await launchUrl(
    uri,
    mode: LaunchMode.platformDefault,
    webOnlyWindowName: '_blank',
  );

  if (!didLaunch) {
    debugPrint('Could not launch document: $uri');
  }
}
