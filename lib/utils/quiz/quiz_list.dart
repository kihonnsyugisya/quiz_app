
import 'package:quiz_app/utils/quiz/quiz.dart';

class QuizList{

  static List<dynamic> list = [
    firstList,
    secondList,
    // thirdList
  ];
  // TODO: クイズをここに追加する。第3章も追加する場合は、thirdListのコメントアウトを解除する。また、modeListも更新する。
  static List<QuizEntity> firstList = [
    QuizEntity(quiz: '主人公の名前は？', answer: ['焼塩ば','ぶた','ロイド'], answerOfNum: 2),
    QuizEntity(quiz: 'ヒロインの名前は？', answer: ['猫','アーニャ','おーにゃ'], answerOfNum: 1),
    QuizEntity(quiz: '主人公の職業は', answer: ['スパイ','2個目','3個目'], answerOfNum: 0),
  ];
  static List<QuizEntity> secondList = [
    QuizEntity(quiz: '唐揚げといえば？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
    QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
    QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  ];
  // static List<QuizEntity> thirdList = [
  //   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
  //   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
  //   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  // ];
}