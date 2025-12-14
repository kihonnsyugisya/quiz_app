import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quiz_app/utils/quiz/quiz.dart';
import 'package:quiz_app/utils/url_launcher.dart';
import 'package:quiz_app/utils/color/original_theme_color.dart';
import 'package:quiz_app/utils/original_theme_font.dart';
import 'package:quiz_app/utils/result.dart';
import 'package:quiz_app/view/nav_page.dart';
import 'package:quiz_app/view/quiz_page.dart';
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
        ? QuizList.hardList[widget.listNum].length
        : QuizList.normalList[widget.listNum].length;
    if (Result.resultCount == total && widget.isHard == true) {
      isPerfect = true;
    }
  }

  @override
  void dispose() {
    // ResultPageでは広告を破棄しない
    // 広告は表示された後、コールバック内で自動的に破棄される
    // または次の画面で再利用される
    super.dispose();
  }

  int secondChallengeLife = 0;
  bool isPerfect = false;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: OriginalThemeColor.secondColor,
      body: SafeArea(
        child: SizedBox(
          width: deviceWidth,
          height: deviceHeight * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: deviceHeight * 0.08,),
              Column(
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
                ],
              ),
              Column(
                children: [
                  Text('${
                      widget.isHard
                      ? QuizList.hardList[widget.listNum].length
                      : QuizList.normalList[widget.listNum].length}問中',
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
                      UrlLauncher.tweet(text: 'text',);
                    }
                  ),
                  widget.isHard == true && QuizList.hardList[widget.listNum].length != Result.resultCount
                      ? Buttons.revivalButton(onPressed: ()async{
                        if(AdMob.myRewardAd != null){
                          AdMob.myRewardAd!.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad){
                                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
                                    print('バーを復活');
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
                                  print('バーを復活');
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
    );
  }
}

