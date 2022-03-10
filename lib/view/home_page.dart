
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/quiz/quiz_list.dart';
import 'package:quiz_app/view/quiz_page.dart';
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
                        await QuizList.normalList[index].shuffle();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: index,isHard: false,)));
                      },
                  );
                },),
              // TODO: コアモードを実装する場合は下記を解除
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
                      await QuizList.hardList[index].shuffle();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: index,isHard: true,)));
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
