
import 'package:quiz_app/utils/quiz/quiz_list.dart';

class QuizEntity{
  String quiz;
  List<String> answer;
  int answerOfNum;
  QuizEntity({required this.quiz,required this.answer,required this.answerOfNum});
}

class QuizLogic{
  static bool isSuccess({required int tapIndex,required int listNum,required int quizNum}){
    if(tapIndex == QuizList.list[listNum][quizNum].answerOfNum){
      return true;
    }else{
      return false;
    }
  }
}