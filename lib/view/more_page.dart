
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/url_launcher.dart';

import '../utils/buttons.dart';
import '../utils/color/original_theme_color.dart';
import '../utils/dialogs.dart';
import '../utils/package_info.dart';

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
                      // TODO: IDを変更する。アンドロイドもやる場合は、そのIDも追加する。
                      LaunchReview.launch(
                          writeReview: false,iOSAppId: "1608191430"
                      );
                    },
                    icon: Icon(Icons.star,color: OriginalThemeColor.star,)),
                MoreButton.bottomLine,
                MoreButton(
                  text: const Text('シェアする'), 
                  onTap: (){
                    // TODO: PR文をかく。
                    UrlLauncher.tweet(text: 'text');
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
                    text: const Text('プライバシーポリシー'), onTap: (){
                      UrlLauncher.privacyPolicy();
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
