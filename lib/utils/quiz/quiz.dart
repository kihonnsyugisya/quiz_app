
import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz_list.dart';

class QuizEntity{
  String quiz;
  List<String> answer;
  int answerOfNum;
  QuizEntity({required this.quiz,required this.answer,required this.answerOfNum});
}

class QuizLogic{
  static int quizCount = 0;
  static void resetQuizCount(){
    quizCount = 0;
  }
  static bool isSuccess({required int tapIndex,required int listNum,required int quizNum,required bool isHard}){
    if(isHard){
      if(tapIndex == QuizList.hardList[listNum][quizNum].answerOfNum){
        return true;
      }else{
        return false;
      }
    }else{
      // 通常モードでは、選択されたクイズリストを使用
      final quizList = QuizList.selectedQuizList;
      if (quizList != null && quizNum < quizList.length) {
        if(tapIndex == quizList[quizNum].answerOfNum){
          return true;
        }else{
          return false;
        }
      }else{
        // フォールバック：元のリストを使用
        if(tapIndex == QuizList.normalList[listNum][quizNum].answerOfNum){
          return true;
        }else{
          return false;
        }
      }
    }
  }
}