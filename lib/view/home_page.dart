
import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/utils/quiz/quiz_list.dart';
import 'package:quiz_app/view/quiz_page.dart';
import '../utils/buttons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: QuizList.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Buttons.ModeButton(
                  buttonText: Buttons.modeList[index].buttonText,
                  color: Buttons.modeList[index].color,
                  page: (){
                    // ignore: avoid_print
                    print(index);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: index,)));
                  },
              );
            },),
        ),
      ],
    );
  }
}
