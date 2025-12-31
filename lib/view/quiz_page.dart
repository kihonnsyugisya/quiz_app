
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';
import 'package:jujutsu_kaisen_quiz/utils/dialogs.dart';
import 'package:jujutsu_kaisen_quiz/utils/original_theme_font.dart';
import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz_list.dart';
import 'package:jujutsu_kaisen_quiz/utils/result.dart';
import 'package:jujutsu_kaisen_quiz/view/result_page.dart';
import '../utils/adMob.dart';
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
  BannerAd? _bannerAd;
  // 各クイズのシャッフルされた選択肢と正解インデックスを保持
  List<Map<String, dynamic>>? _shuffledQuizzes;

  @override
  void initState() {
    super.initState();
    // クイズリストを取得してシャッフル
    _shuffleQuizAnswers();
    // インタースティシャル広告の読み込み（既に読み込み済みの場合は読み込まない）
    AdMob.loadInterstitial();
    // ハードモードの場合のみリワード広告を読み込む
    if(widget.isHard == true){
      AdMob.loadReward();
    }
    // アダプティブバナー広告を読み込む
    Future(() async {
      if (mounted) {
        _bannerAd = await AdMob.createBannerAd(context);
        setState(() {});
      }
    });
  }

  // クイズリストを取得するメソッド
  List<dynamic> quizDoc(){
    if(widget.isHard){
      // ハードモードでも、ランダムに選ばれた30問を使用
      final selectedQuizDoc = QuizList.selectedQuizList;
      if (selectedQuizDoc != null && selectedQuizDoc.isNotEmpty) {
        return selectedQuizDoc;
      }
      // フォールバック：選択されていない場合は元のリストを使用
      final hardQuizDoc = QuizList.hardList[widget.listNum];
      return hardQuizDoc;
    }else{
      // 通常モードでは、ランダムに選ばれた10問を使用
      final selectedQuizDoc = QuizList.selectedQuizList;
      if (selectedQuizDoc != null && selectedQuizDoc.isNotEmpty) {
        return selectedQuizDoc;
      }
      // フォールバック：選択されていない場合は元のリストを使用
      final normalQuizDoc = QuizList.normalList[widget.listNum];
      return normalQuizDoc;
    }
  }

  // クイズの選択肢をシャッフルする
  void _shuffleQuizAnswers() {
    final quizList = quizDoc();
    _shuffledQuizzes = [];
    
    for (var quiz in quizList) {
      // 選択肢と正解のインデックスをコピー
      final answers = List<String>.from(quiz.answer);
      final correctAnswerIndex = quiz.answerOfNum;
      final correctAnswer = answers[correctAnswerIndex];
      
      // 選択肢をシャッフル
      answers.shuffle(Random());
      
      // シャッフル後の正解のインデックスを取得
      final newCorrectIndex = answers.indexOf(correctAnswer);
      
      _shuffledQuizzes!.add({
        'quiz': quiz.quiz,
        'answers': answers,
        'correctIndex': newCorrectIndex,
      });
    }
  }

  // シャッフルされたクイズデータを取得
  Map<String, dynamic>? getCurrentShuffledQuiz() {
    if (_shuffledQuizzes == null || QuizLogic.quizCount >= _shuffledQuizzes!.length) {
      return null;
    }
    return _shuffledQuizzes![QuizLogic.quizCount];
  }

  @override
  void dispose() {
    // バナー広告を破棄
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        // クイズ画面では戻る操作を無効化（スワイプジェスチャーも含む）
        return false;
      },
      child: Scaffold(
        backgroundColor: OriginalThemeColor.themeColor,
        body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        '問題 : ${QuizLogic.quizCount+1}',
                        style: OriginalThemeFont.titleFont,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.8,
                        child: Center(
                          child: Text(
                            quizDoc()[QuizLogic.quizCount].quiz,
                            maxLines: null,
                            style: OriginalThemeFont.quizFont,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('${QuizLogic.quizCount+1} / ${quizDoc().length}', style: const TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Center(
                  child: SizedBox(
                    width: deviceWidth * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: getCurrentShuffledQuiz()?['answers'].length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final shuffledQuiz = getCurrentShuffledQuiz();
                            if (shuffledQuiz == null) return const SizedBox();
                            
                            return Buttons.ModeButton(
                                buttonText: shuffledQuiz['answers'][index],
                                color: null,
                                page: (){
                                  // ignore: avoid_print
                                  print('クイズレングス: ${quizDoc().length}');
                                  // シャッフル後の正解インデックスと比較
                                  final isCorrect = index == shuffledQuiz['correctIndex'];
                                  if(isCorrect){
                                    Result.addResultCount();
                                    return setState(() {
                                      Dialogs.successResultDialog(
                                          context: context,
                                          text: shuffledQuiz['answers'][shuffledQuiz['correctIndex']],
                                          btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(isSuccess: true,isHard: widget.isHard,quizCount: QuizLogic.quizCount, quizLength: quizDoc().length)),
                                          onTap: () async {
                                            if(Result.isMoveToResultPage(isHard: widget.isHard,quizCount: QuizLogic.quizCount, quizLength: quizDoc().length, isSuccess: true)){
                                              Navigator.of(context).pop();
                                              // 広告を明示的にdisposeしてから遷移
                                              if (mounted) {
                                                _bannerAd?.dispose();
                                                _bannerAd = null;
                                              }
                                              // 少し待ってから遷移（広告の破棄処理を確実に完了させる）
                                              await Future.delayed(const Duration(milliseconds: 100));
                                              if (mounted) {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(isHard: widget.isHard,listNum: widget.listNum)));
                                              }
                                            }else{
                                              setState(() {
                                                QuizLogic.quizCount++;
                                                // ignore: avoid_print
                                                print('クイズカウンターがリセットされました');
                                                // ignore: avoid_print
                                                print('クイズカウンター: ${QuizLogic.quizCount}になりました');
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
                                        text: shuffledQuiz['answers'][shuffledQuiz['correctIndex']],
                                        btnText: Dialogs.confirmBtnText(Result.isMoveToResultPage(quizCount: QuizLogic.quizCount, quizLength: quizDoc().length, isHard: widget.isHard, isSuccess: false)),
                                        onTap: () async {
                                            if(Result.isMoveToResultPage(quizCount: QuizLogic.quizCount, quizLength: quizDoc().length, isHard: widget.isHard, isSuccess: false)){
                                              Navigator.of(context).pop();
                                              // 広告を明示的にdisposeしてから遷移
                                              if (mounted) {
                                                _bannerAd?.dispose();
                                                _bannerAd = null;
                                              }
                                              // 少し待ってから遷移
                                              await Future.delayed(const Duration(milliseconds: 100));
                                              if (mounted) {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(listNum: widget.listNum,isHard: widget.isHard,)));
                                              }
                                            } else if(widget.isHard){
                                              Navigator.of(context).pop();
                                              // 広告を明示的にdisposeしてから遷移
                                              if (mounted) {
                                                _bannerAd?.dispose();
                                                _bannerAd = null;
                                              }
                                              // 少し待ってから遷移
                                              await Future.delayed(const Duration(milliseconds: 100));
                                              if (mounted) {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(listNum: widget.listNum,isHard: widget.isHard,)));
                                              }
                                            }else{
                                              setState(() {
                                                QuizLogic.quizCount++;
                                                // ignore: avoid_print
                                                print('クイズカウンターがリセットされました');
                                                // ignore: avoid_print
                                                print('クイズカウンター: ${QuizLogic.quizCount}になりました');
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
                      text: '離脱',
                      onPress: ()async{
                        await Dialogs.retireDialog(context);
                            Result.resetResultCount();
                            QuizLogic.resetQuizCount();
                          }
                          ),
                    ],
                    ),
                  ),
                ),
            ),
            Expanded(
              flex: 1,
              child: _bannerAd != null
                  ? AdMob.bannerAdArea(child: AdWidget(ad: _bannerAd!))
                  : AdMob.bannerAdArea(child: const SizedBox()),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
