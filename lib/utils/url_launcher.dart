
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:url_launcher/url_launcher.dart';

class UrlLauncher  {
  static String twitterHashTags = '\n#SPY_FAMILY' '\n#スパイファミリー' '\n#QUIZ_FAMILY';

  static void tweet({
    required String text,}) async {
    final Map<String, dynamic> tweetQuery = {
      "text":text + '\n'+ twitterHashTags
    };

    final Uri tweetScheme =
    Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
    Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    await canLaunch(tweetScheme.toString())
        ? await launch(tweetScheme.toString())
        : await launch(tweetIntentUrl.toString());

    print(tweetScheme.toString());
    print(tweetIntentUrl.toString());
  }

  static void privacyPolicy()async{
    if(await canLaunch('https://kihonnsyugisya.github.io/privacy_policy_quiz_app/')){
      await launch('https://kihonnsyugisya.github.io/privacy_policy_quiz_app/');
    }else{
      // ignore: avoid_print
      print('error');
    }
  }

}
