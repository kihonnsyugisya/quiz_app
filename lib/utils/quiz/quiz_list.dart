
import 'package:quiz_app/utils/quiz/quiz.dart';

class QuizList{

  static List<dynamic> normalList = [
    firstNormalList,
    secondNormalList,
    // thirdList
  ];
  // TODO: クイズをここに追加する。第3章も追加する場合は、thirdListのコメントアウトを解除する。また、modeListも更新する。
  static List<QuizEntity> firstNormalList = [
    QuizEntity(quiz: '主人公の名前は？', answer: ['焼塩ば','ぶた','ロイド'], answerOfNum: 2),
    QuizEntity(quiz: 'ヒロインの名前は？', answer: ['猫','アーニャ','おーにゃ'], answerOfNum: 1),
    QuizEntity(quiz: '主人公の職業は', answer: ['スパイ','2個目','3個目'], answerOfNum: 0),
  ];
  static List<QuizEntity> secondNormalList = [
    QuizEntity(quiz: '唐揚げといえば？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
    QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
    QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  ];
  // static List<QuizEntity> thirdList = [
  //   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
  //   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
  //   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  // ];

  static List<dynamic> hardList = [
    firstHardList,
    // secondHardList,
    // thirdList
  ];
  // TODO: クイズをここに追加する。第3章も追加する場合は、thirdListのコメントアウトを解除する。また、modeListも更新する。
  static List<QuizEntity> firstHardList = [
    QuizEntity(quiz: '主人公の髪型は？', answer: ['坊主','ツーブロック','ノーマルヘア'], answerOfNum: 1),
    QuizEntity(quiz: 'hardヒロインの好物は？', answer: ['ナッツ','アーニャ','おーにゃ'], answerOfNum: 0),
    QuizEntity(quiz: 'hard主人公の年齢は？', answer: ['100','200','30'], answerOfNum: 2),
  ];
  static List<QuizEntity> secondHardList = [
    QuizEntity(quiz: '主人公の髪型は？', answer: ['坊主','ツーブロック','ノーマルヘア'], answerOfNum: 1),
    QuizEntity(quiz: 'hardヒロインの好物は？', answer: ['ナッツ','アーニャ','おーにゃ'], answerOfNum: 0),
    QuizEntity(quiz: 'hard主人公の年齢は？', answer: ['100','200','30'], answerOfNum: 2),
    QuizEntity(quiz: 'hardヒロインの髪型は？', answer: ['ナッツ','アーニャ','モヒカン'], answerOfNum: 2),
    QuizEntity(quiz: 'hardヒロインの顔は？', answer: ['ナッツ','アーニャ','おーにゃ'], answerOfNum: 0),
    QuizEntity(quiz: 'hardヒロインの年齢は？', answer: ['ナッツ','4','おーにゃ'], answerOfNum: 1),
    QuizEntity(quiz: 'hardヒロインの好きな歌は？', answer: ['ナッツ','アーニャ','みんなんお歌'], answerOfNum: 2),

  ];
// static List<QuizEntity> thirdHardList = [
//   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
//   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
//   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
// ];

}