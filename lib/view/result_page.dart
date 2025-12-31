import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz.dart';
import 'package:jujutsu_kaisen_quiz/utils/url_launcher.dart';
import 'package:jujutsu_kaisen_quiz/utils/color/original_theme_color.dart';
import 'package:jujutsu_kaisen_quiz/utils/original_theme_font.dart';
import 'package:jujutsu_kaisen_quiz/utils/result.dart';
import 'package:jujutsu_kaisen_quiz/view/nav_page.dart';
import 'package:jujutsu_kaisen_quiz/view/quiz_page.dart';
import '../utils/adMob.dart';
import '../utils/buttons.dart';
import '../utils/dialogs.dart';
import '../utils/quiz/quiz_list.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ResultPage extends StatefulWidget {
  int listNum;
  bool isHard;
  // ignore: use_key_in_widget_constructors
  ResultPage({required this.listNum, required this.isHard});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  @override
  void initState() {
    super.initState();
    // ステータスバーを表示するように設定
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top],
    );
    // インタースティシャル広告の読み込み（既に読み込み済みの場合は読み込まない）
    AdMob.loadInterstitial();
    // ハードモードで全問正解かどうかを判定
    final total = widget.isHard
        ? (QuizList.selectedQuizList?.length ?? QuizList.hardList[widget.listNum].length)
        : (QuizList.selectedQuizList?.length ?? QuizList.normalList[widget.listNum].length);
    if (Result.resultCount == total && widget.isHard == true) {
      isPerfect = true;
    }
    // 名言を一度取得して保存（Twitter投稿で同じ名言を使用するため）
    displayedQuote = Result.getResultQuote();
  }

  @override
  void dispose() {
    // ResultPageでは広告を破棄しない
    // 広告は表示された後、コールバック内で自動的に破棄される
    // また、次の画面で再利用されない
    super.dispose();
  }

  int secondChallengeLife = 0;
  bool isPerfect = false;
  String? displayedQuote; // 表示されている名言を保存
  
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        // 結果ページでは戻る操作を無効化（スワイプジェスチャーも含む）
        return false;
      },
      child: Scaffold(
        backgroundColor: OriginalThemeColor.secondColor,
        body: SafeArea(
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight * 0.7, // 0.6から0.65に増やして余裕を持たせる
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: deviceHeight * 0.05,), // 0.08から0.05に減らしてスペースを確保
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.isHard
                      ? Buttons.hardModeList[widget.listNum].buttonText
                      : Buttons.normalModeList[widget.listNum].buttonText,
                    style: widget.isHard
                        ? OriginalThemeFont.modeFont
                        : OriginalThemeFont.basicFont,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('結果',style: OriginalThemeFont.basicFont,),
                  ),
                  // 死滅回遊編の名言を表示
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Text(
                      displayedQuote ?? Result.getResultQuote(),
                      style: OriginalThemeFont.basicFont,
                      textAlign: TextAlign.center,
                      maxLines: 4, // 最大4行まで
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${
                      widget.isHard
                      ? (QuizList.selectedQuizList?.length ?? QuizList.hardList[widget.listNum].length)
                      : (QuizList.selectedQuizList?.length ?? QuizList.normalList[widget.listNum].length)}問中',
                    style: OriginalThemeFont.basicFont,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FadeInLeft(child: Text(Result.resultCount.toString(),style: OriginalThemeFont.accentFont,),delay: const Duration(seconds: 1), ),
                      const SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('問',style: OriginalThemeFont.basicFont,),
                      ),
                    ],
                  ),
                  Text('正解しました',style: OriginalThemeFont.basicFont,),
                ],
              ),
              Column(
                children: [
                  Buttons.twitterButton(
                    onPressed: ()async{
                      final quizLength = widget.isHard
                          ? (QuizList.selectedQuizList?.length ?? QuizList.hardList[widget.listNum].length)
                          : (QuizList.selectedQuizList?.length ?? QuizList.normalList[widget.listNum].length);
                      final modeText = widget.isHard
                          ? Buttons.hardModeList[widget.listNum].buttonText
                          : Buttons.normalModeList[widget.listNum].buttonText;
                      final quote = displayedQuote ?? Result.getResultQuote();
                      final correctMessage = '$modeTextで${quizLength}問中${Result.resultCount}問正解しました！';
                      // TODO: iOSアプリのリンクを取得して設定
                      final iosUrl = 'iOS\nアプリのリンク';
                      // TODO: Androidアプリのリンクを取得して設定
                      final androidUrl = 'Android\nアプリのリンク';
                      final hashtag1 = '#${UrlLauncher.twitterHashTags[0]}';
                      final hashtag2 = '#${UrlLauncher.twitterHashTags[1]}';
                      
                      // メッセージを組み立て：名言 + 正解数メッセージ + iOSリンク + Androidリンク + ハッシュタグ
                      final tweetText = '$quote\n\n$correctMessage\n\n$iosUrl\n\n$androidUrl\n\n$hashtag1\n$hashtag2';
                      
                      // urlパラメータに空文字列を指定して、自動リンク追加を防ぐ
                      UrlLauncher.tweet(text: tweetText, url: '');
                    }
                  ),
                  widget.isHard == true && QuizList.hardList[widget.listNum].length != Result.resultCount
                      ? Buttons.revivalButton(onPressed: ()async{
                        if(AdMob.myRewardAd != null){
                          AdMob.myRewardAd!.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad){
                                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                                    print('ライフを復活');
                                    ad.dispose();
                                    if(secondChallengeLife > 0){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizPage(listNum: widget.listNum,isHard: true,)));
                                      secondChallengeLife = 0;
                                    }
                                  },
                                  onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){
                                    ad.dispose();
                                    AdMob.disposeRewardAd();
                                    // エラー時は再読み込みしない（ユーザーが再度ボタンを押した時に読み込まれる）
                                  }
                              );
                          await AdMob.myRewardAd!.show(
                              onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem){
                                // ignore: avoid_print
                                print('$ad with reward $RewardItem(${rewardItem.amount}, ${rewardItem.type})');
                                setState(() {
                                  secondChallengeLife += rewardItem.amount.toInt();
                                  // ignore: avoid_print
                                  print('報酬を獲得：　$secondChallengeLife');
                                });
                              }
                          );
                        }else{
                         Dialogs.netWorkErrorDialog(
                             context: context,
                             onPressed: (){
                               // リワード広告を読み込む
                               AdMob.loadReward();
                               Navigator.of(context).pop();
                             }
                         );
                        }
                      })
                      : const SizedBox(),
                  Buttons.originalTextButton(
                      text: 'HOME',
                      onPress: ()async{
                        AdMob.interstitialAdCounter ++;
                        print(AdMob.interstitialAdCounter);
                        if(AdMob.isShowInterstitialAd()){
                          if(AdMob.myInterstitialAd != null){
                            AdMob.myInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
                                onAdShowedFullScreenContent: (InterstitialAd ad) {
                                  // 広告表示時にステータスバーを非表示にする（閉じるボタンが押しやすくなる）
                                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
                                },
                                onAdDismissedFullScreenContent: (InterstitialAd ad){
                                  // 広告が閉じられたらステータスバーを表示に戻す
                                  SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.edgeToEdge,
                                    overlays: [SystemUiOverlay.top],
                                  );
                                  print('ライフを復活');
                                  ad.dispose();
                                  AdMob.loadInterstitial();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavPage(isPerfect: isPerfect)));
                                  Result.resetResultCount();
                                  QuizLogic.resetQuizCount();
                                },
                                onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error){
                                  // エラー時もステータスバーを表示に戻す
                                  SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.edgeToEdge,
                                    overlays: [SystemUiOverlay.top],
                                  );
                                  ad.dispose();
                                  AdMob.disposeInterstitialAd();
                                  // エラー時は再読み込みしない（次の画面で読み込まれる）
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavPage(isPerfect: isPerfect)));
                                  Result.resetResultCount();
                                  QuizLogic.resetQuizCount();
                                }
                            );
                            await AdMob.myInterstitialAd!.show();
                          }else{
                            // インタースティシャル広告が読み込まれていない場合
                            Dialogs.netWorkErrorDialog(
                                context: context,
                                onPressed: (){
                                  // インタースティシャル広告を読み込む
                                  AdMob.loadInterstitial();
                                  Navigator.of(context).pop();
                                }
                            );
                          }
                        }else{
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavPage(isPerfect: isPerfect)));
                          Result.resetResultCount();
                          QuizLogic.resetQuizCount();
                        }
                      }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
