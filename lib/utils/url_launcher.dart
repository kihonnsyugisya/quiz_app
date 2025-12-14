
// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher  {
  static List<String> twitterHashTags = [
    // TODO: ハッシュタグを決める。
    '題材名が入ります',
    '題材名が入ります'
  ];

  static void tweet({
    required String text,}) async {
    final Map<String, dynamic> tweetQuery = {
      "text": text,
      "url": '',
      "hashTags": twitterHashTags,
      "via": "",
      "related": "",
    };

    final Uri tweetScheme =
    Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
    Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    if (await canLaunchUrl(tweetScheme)) {
      await launchUrl(tweetScheme);
    } else {
      await launchUrl(tweetIntentUrl, mode: LaunchMode.externalApplication);
    }
  }

  // TODO: プライバシーポリシーのURLを設定（実際にアクセス可能なURLに変更すること）
  // App Store Connectでも同じURLを設定する必要があります
  static Future<bool> privacyPolicy({BuildContext? context})async{
    // TODO: ファイヤベースなど、新たに追加する場合は、下記のリンクに適宜文言を追加する
    final Uri privacyPolicyUrl = Uri.parse('https://kihonnsyugisya.github.io/privacy_policy_quiz_app/');
    try {
      if(await canLaunchUrl(privacyPolicyUrl)){
        final launched = await launchUrl(privacyPolicyUrl, mode: LaunchMode.externalApplication);
        return launched;
      }else{
        // ignore: avoid_print
        print('プライバシーポリシーのURLを開けませんでした: $privacyPolicyUrl');
        return false;
      }
    } catch (e) {
      // ignore: avoid_print
      print('プライバシーポリシーのURLを開く際にエラーが発生しました: $e');
      return false;
    }
  }

  // アプリストアページを開く
  static Future<void> launchAppStore({
    required String iOSAppId,
    String? androidPackageId,
  }) async {
    Uri url;
    
    if (Platform.isIOS) {
      // iOS App Store
      url = Uri.parse('https://apps.apple.com/app/id$iOSAppId');
    } else if (Platform.isAndroid) {
      // Android Play Store
      final packageId = androidPackageId ?? 'com.kihonsyugisya.quiz_app';
      // market://スキームを試し、失敗した場合はhttpsを使用
      final marketUrl = Uri.parse('market://details?id=$packageId');
      if (await canLaunchUrl(marketUrl)) {
        await launchUrl(marketUrl, mode: LaunchMode.externalApplication);
        return;
      } else {
        url = Uri.parse('https://play.google.com/store/apps/details?id=$packageId');
      }
    } else {
      // ignore: avoid_print
      print('Unsupported platform');
      return;
    }
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // ignore: avoid_print
      print('Failed to launch app store URL');
    }
  }

}
