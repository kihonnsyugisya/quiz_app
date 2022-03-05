
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/dialogs.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/quiz/quiz_list.dart';
import 'package:quiz_app/utils/result.dart';
import 'package:quiz_app/view/result_page.dart';
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
    final quizCollection = QuizList.list[widget.listNum][quizCount];
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
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        Buttons.modeList[widget.listNum].buttonText,
                        style: OriginalThemeFont.basicFont,
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
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: deviceWidth * 0.8,
                        child: Center(
                          child: Text(
                            quizCollection.quiz,
                            maxLines: null,
                            style: OriginalThemeFont.quizFont,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('${quizCount+1} / ${QuizList.list[widget.listNum].length}'),
                    ),
                  ],
                )),
            Expanded(
                flex: 4,
                child: SizedBox(
                  width: deviceWidth * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: quizCollection.answer.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Buttons.ModeButton(
                                buttonText: quizCollection.answer[index],
                                color: null,
                                page: (){
                                  if(QuizLogic.isSuccess(tapIndex: index, listNum: widget.listNum, quizNum: quizCount)){
                                    Result.addResultCount();
                                    return setState(() {
                                      Dialogs.successResultDialog(
                                          context: context,
                                          text: quizCollection.answer[quizCollection.answerOfNum],
                                          btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(quizCount: quizCount, quizLength: QuizList.list[widget.listNum].length)),
                                          onTap: (){
                                            if(Result.isMoveToResultPage(quizCount: quizCount, quizLength: QuizList.list[widget.listNum].length)){
                                              Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(widget.listNum)));
                                            }else{
                                              setState(() {
                                                quizCount++;
                                                Navigator.of(context).pop();
                                              });
                                            }
                                          },
                                          );
                                    });
                                  } else{
                                    return setState(() {
                                      Dialogs.missResultDialog(
                                        context: context,
                                        text: quizCollection.answer[quizCollection.answerOfNum],
                                        btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(quizCount: quizCount, quizLength: QuizList.list[widget.listNum].length)),
                                        onTap: (){
                                            if(Result.isMoveToResultPage(quizCount: quizCount, quizLength: QuizList.list[widget.listNum].length)){
                                              Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(widget.listNum)));
                                            }else{
                                              setState(() {
                                                quizCount++;
                                                Navigator.of(context).pop();
                                              });
                                            }
                                          },
                                          );
                                    });
                                  }
                                },
                            );
                          }
                      ),
                      Buttons.originalTextButton(
                          text: 'RETIRE',
                          onPress: (){
                            Navigator.popUntil(context, (route) => route.isFirst);
                            Result.resetResultCount();
                          }
                          ),
                    ],
                  ),
                )
            ),
            Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Ad.adArea,
            )),
          ],
        ),
      ),
    );
  }
}
