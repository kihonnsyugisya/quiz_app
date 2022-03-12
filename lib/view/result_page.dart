import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/quiz/quiz.dart';
import 'package:quiz_app/utils/url_launcher.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/result.dart';
import 'package:quiz_app/view/nav_page.dart';
import 'package:quiz_app/view/quiz_page.dart';
import '../utils/buttons.dart';
import '../utils/quiz/quiz_list.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ResultPage extends StatelessWidget {
  int listNum;
  bool isHard;
  // ignore: use_key_in_widget_constructors
  ResultPage({required this.listNum, required this.isHard});
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
                  Text(isHard
                      ? Buttons.hardModeList[listNum].buttonText
                      : Buttons.normalModeList[listNum].buttonText,
                    style: isHard
                        ? OriginalThemeFont.modeFont
                        : OriginalThemeFont.basicFont,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('結果',style: OriginalThemeFont.basicFont,),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${
                      isHard
                      ? QuizList.hardList[listNum].length
                      : QuizList.normalList[listNum].length}問中',
                    style: OriginalThemeFont.basicFont,),
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
                  isHard == true && QuizList.hardList[listNum].length != Result.resultCount
                      ? Buttons.revivalButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: listNum,isHard: true,)));})
                      : const SizedBox(),
                  Buttons.originalTextButton(
                      text: 'HOME',
                      onPress: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavPage()));
                        Result.resetResultCount();
                        QuizLogic.resetQuizCount();
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
