
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jujutsu_kaisen_quiz/utils/original_theme_font.dart';
import 'package:jujutsu_kaisen_quiz/utils/url_launcher.dart';

import 'package:jujutsu_kaisen_quiz/utils/buttons.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';
import 'package:jujutsu_kaisen_quiz/utils/dialogs.dart';
import 'package:jujutsu_kaisen_quiz/utils/package_info.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              'その他',
              style: TextStyle(
                  fontSize: 14
              ),
            ),
          ),
          Container(
            width: deviceWidth * 0.85,
            decoration: BoxDecoration(
              color: OriginalThemeColor.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: OriginalThemeColor.gray,
                  width: 0.5
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MoreButton(
                    text: const Text('アプリを評価する'),
                    onTap: (){
                      UrlLauncher.launchAppReview(
                        iOSAppId: PackageInfo.iOSAppId,
                        androidPackageId: PackageInfo.androidPackageId,
                      );
                    },
                    icon: Icon(Icons.star,color: OriginalThemeColor.star,)),
                MoreButton.bottomLine,
                MoreButton(
                  text: const Text('シェアする'), 
                  onTap: (){
                    UrlLauncher.tweet(text: '死滅回游編を中心としたクイズを楽しめます。\n\niOS\nhttps://x.gd/rSEDH\n\nAndroid\nhttps://x.gd/47K1Y\n\n#呪術廻戦 #呪術廻戦クイズ', url: '');
                  }, 
                  icon: Icon(FontAwesomeIcons.twitter,size: 20,color: OriginalThemeColor.twitter,),),
                MoreButton.bottomLine,
                MoreButton(
                    text: const Text('ライセンス'),
                    onTap: (){
                      Dialogs.licenseDialog(context);
                    },
                    icon: const Icon(CupertinoIcons.doc)),
                MoreButton.bottomLine,
                MoreButton(
                    text: const Text('プライバシーポリシー'), onTap: ()async{
                      final success = await UrlLauncher.privacyPolicy(context: context);
                      if (!success) {
                        // URLを開けなかった場合のエラーハンドリング
                        // 通常はブラウザで開けるはずなので、ここに到達することは稀
                        if (context.mounted) {
                          Dialogs.netWorkErrorDialog(
                            context: context,
                            onPressed: () => Navigator.of(context).pop(),
                          );
                        }
                      }
                      },
                    icon: const Icon(Icons.privacy_tip_outlined)),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text('Version : ${PackageInfo.version}',style: OriginalThemeFont.miniFont,),
          ),
        ],
      ),
    );
  }
}
