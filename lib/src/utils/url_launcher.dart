import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  const url = 'https://github.com/belelaritra/Neumorphic_Calculator';
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    // ignore: only_throw_errors
    throw 'Could not launch $url';
  }
}
