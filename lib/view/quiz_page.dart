
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/quiz/quiz_list.dart';
import '../utils/ad.dart';
import '../utils/buttons.dart';
import '../utils/quiz/quiz.dart';

// ignore: must_be_immutable
class QuizPage extends StatefulWidget {
  int listNum;
  QuizPage({Key? key, required this.listNum}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int quizCount = 0;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: OriginalThemeColor.themeColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        Buttons.modeList[widget.listNum].buttonText,
                        style: OriginalThemeFont.mainFont,
                      ),
                    ),
                    Text(
                      'MISSION : ${quizCount+1}',
                      style: OriginalThemeFont.titleFont,
                    ),
                  ],
                ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: deviceWidth * 0.8,
                        child: Center(
                          child: Text(
                            QuizList.list[widget.listNum][quizCount].quiz,
                            maxLines: null,
                            style: OriginalThemeFont.mainFont,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('${quizCount+1} / 10'),
                    ),
                  ],
                )),
            Expanded(
                flex: 5,
                child: SizedBox(
                  width: deviceWidth * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: QuizList.list[widget.listNum][quizCount].answer.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Buttons.ModeButton(
                                buttonText: QuizList.list[widget.listNum][quizCount].answer[index],
                                page: (){
                                  if(QuizLogic.isSuccess(tapIndex: index, listNum: widget.listNum, quizNum: quizCount)){
                                    return setState(() {
                                      Dialogs.successResultDialog(
                                          context: context,
                                          text: QuizList.firstList[0].answer[QuizList.firstList[0].answerOfNum],
                                          onTap: (){
                                            setState(() {
                                              quizCount++;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          );
                                    });
                                  } else{
                                    return setState(() {
                                      Dialogs.missResultDialog(
                                          context: context,
                                          text: QuizList.firstList[0].answer[QuizList.firstList[0].answerOfNum],
                                          onTap: (){
                                            setState(() {
                                              quizCount++;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          );
                                    });
                                  }
                                },
                                color: null
                            );
                          }
                      ),
                      Buttons.originalTextButton(
                          text: 'RETIRE',
                          onPress: (){
                          }
                          ),
                    ],
                  ),
                )
            ),
            Expanded(flex: 1,child: Ad.adArea),
          ],
        ),
      ),
    );
  }
}
