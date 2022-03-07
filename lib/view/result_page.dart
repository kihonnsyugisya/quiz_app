import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/url_launcher.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/result.dart';
import '../utils/buttons.dart';
import '../utils/quiz/quiz_list.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ResultPage extends StatelessWidget {
  int listNum;
  // ignore: use_key_in_widget_constructors
  ResultPage(this.listNum);
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: OriginalThemeColor.secondColor,
      body: SafeArea(
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: deviceHeight * 0.08,),
              Column(
                children: [
                  Text(Buttons.modeList[listNum].buttonText,style: OriginalThemeFont.basicFont,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('結果',style: OriginalThemeFont.basicFont,),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${QuizList.list[listNum].length}問中',style: OriginalThemeFont.basicFont,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FadeInLeft(child: Text(Result.resultCount.toString(),style: OriginalThemeFont.accentFont,),delay: const Duration(seconds: 1), ),
                      const SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('問',style: OriginalThemeFont.basicFont,),
                      ),
                    ],
                  ),
                  Text('正解しました',style: OriginalThemeFont.basicFont,),
                ],
              ),
              Column(
                children: [
                  Buttons.twitterButton(
                    onPressed: ()async{
                      UrlLauncher.tweet(text: 'text',);
                    }
                  ),
                  Buttons.originalTextButton(
                      text: 'HOME',
                      onPress: (){
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Result.resetResultCount();
                      }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
