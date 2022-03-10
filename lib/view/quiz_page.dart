
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
  bool isHard;
  QuizPage({Key? key, required this.listNum, required this.isHard}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int quizCount = 0;

  @override
  Widget build(BuildContext context) {
    final normalQuizDoc = QuizList.normalList[widget.listNum];
    final hardQuizDoc = QuizList.hardList[widget.listNum];

    quizDoc(){
      if(widget.isHard){
        return hardQuizDoc;
      }else{
        return normalQuizDoc;
      }
    }

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
                        widget.isHard
                            ? Buttons.hardModeList[widget.listNum].buttonText
                            : Buttons.normalModeList[widget.listNum].buttonText,
                        style: widget.isHard
                            ? OriginalThemeFont.modeFont
                            : OriginalThemeFont.basicFont,
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
                            quizDoc()[quizCount].quiz,
                            maxLines: null,
                            style: OriginalThemeFont.quizFont,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('${quizCount+1} / ${quizDoc().length}'),
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
                          itemCount: quizDoc()[quizCount].answer.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Buttons.ModeButton(
                                buttonText: quizDoc()[quizCount].answer[index],
                                color: null,
                                page: (){
                                  if(QuizLogic.isSuccess(tapIndex: index, listNum: widget.listNum, quizNum: quizCount, isHard: widget.isHard)){
                                    Result.addResultCount();
                                    return setState(() {
                                      Dialogs.successResultDialog(
                                          context: context,
                                          text: quizDoc()[quizCount].answer[quizDoc()[quizCount].answerOfNum],
                                          btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(isSuccess: true,isHard: widget.isHard,quizCount: quizCount, quizLength: normalQuizDoc.length)),
                                          onTap: (){
                                            if(Result.isMoveToResultPage(isHard: widget.isHard,quizCount: quizCount, quizLength: normalQuizDoc.length, isSuccess: true)){
                                              Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(isHard: widget.isHard,listNum: widget.listNum)));
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
                                        text: quizDoc()[quizCount].answer[quizDoc()[quizCount].answerOfNum],
                                        btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(quizCount: quizCount, quizLength: quizDoc().length, isHard: widget.isHard, isSuccess: false)),
                                        onTap: (){
                                            if(Result.isMoveToResultPage(quizCount: quizCount, quizLength: quizDoc().length, isHard: widget.isHard, isSuccess: false)){
                                              Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(listNum: widget.listNum,isHard: widget.isHard,)));
                                            } else if(widget.isHard){
                                              Navigator.of(context).pop();
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(listNum: widget.listNum,isHard: widget.isHard,)));
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
