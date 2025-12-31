
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz_list.dart';
import 'package:jujutsu_kaisen_quiz/view/quiz_page.dart';
import '../utils/buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding:EdgeInsets.only(top: 8),
          child: BlinkText(
            '▼ ステージを選択してください',
            duration: Duration(seconds: 2),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: QuizList.normalList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Buttons.ModeButton(
                      buttonText: Buttons.normalModeList[index].buttonText,
                      color: Buttons.normalModeList[index].color,
                      page: ()async{
                        // ignore: avoid_print
                        print(index);
                        // 前編・後編からランダムに10問を選ぶ
                        QuizList.selectRandomQuizzes(index, 10);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: index,isHard: false,)));
                      },
                  );
                },),
              // TODO: ハードモードを実装する場合は下記を解除
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: QuizList.hardList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Buttons.ModeButton(
                    buttonText: Buttons.hardModeList[index].buttonText,
                    color: Buttons.hardModeList[index].color,
                    page: ()async{
                      // ignore: avoid_print
                      print(index);
                      // ハードモードでは40問の中からランダムに30問を選ぶ
                      QuizList.selectRandomHardQuizzes(index, 30);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: index,isHard: true,)));
                    },
                  );
                },),
            ],
          ),
        ),
      ],
    );
  }
}
