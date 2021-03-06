
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'color/original_theme_color.dart';

class AdMob{
  static Container bannerAdArea({required Widget child}){
    return Container(
      color: OriginalThemeColor.gray,
      child: child);
  }
  static int interstitialAdCounter = 0;
  static bool isShowInterstitialAd(){
    if(interstitialAdCounter % 2 == 0){
      return true;
    }else{
      return false;
    }

  }
  // TODO: リリース時にfalseに変更する
  static bool isTest = false;
  // TODO: 取得したIDを下記に入力する。
  static Map<String, Map<String, String>> productionAdIds = {
    'ios': {
      'banner': 'ca-app-pub-3957084734439209/2130449099',
      'interstitial': 'ca-app-pub-3957084734439209/3251959072',
      'reward': 'ca-app-pub-3957084734439209/2014026887'
    },
    'android': {
      'banner': 'ca-app-pub-3957084734439209/1392082499',
      'interstitial': 'ca-app-pub-3957084734439209/5139755813',
      'reward': 'ca-app-pub-3957084734439209/6261265799'
    }
  };
  static Map<String, Map<String, String>> testAdIds = {
    'ios': {
      'banner': 'ca-app-pub-3940256099942544/2934735716',
      'interstitial': 'ca-app-pub-3940256099942544/4411468910',
      'reward': 'ca-app-pub-3940256099942544/1712485313'
    },
    'android': {
      'banner': 'ca-app-pub-3940256099942544/6300978111',
      'interstitial': 'ca-app-pub-3940256099942544/1033173712',
      'reward': '	ca-app-pub-3940256099942544/5224354917'
    }
  };
  static String getPlatform(){
    if(Platform.isAndroid){
      return 'android';
    }else{
      return 'ios';
    }
  }
  static String getAdId({required String deviceType, required String adType}){
    if(isTest == true){
      return testAdIds[deviceType]![adType] ?? 'error';
    }else{
      return productionAdIds[deviceType]![adType] ?? 'error';
    }
  }
  static BannerAd myBanner(){
    return BannerAd(
      adUnitId: getAdId(deviceType: getPlatform(), adType: 'banner',),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error){
          ad.dispose();
        },
      ),
    )..load();
  }

  static InterstitialAd? myInterstitialAd;

  static Future<void> loadInterstitial()async{
    await InterstitialAd.load(
      adUnitId: getAdId(deviceType: getPlatform(), adType: 'interstitial',),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            myInterstitialAd = ad;
          },
        onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('エラー：InterstitialAd failed to load: $error');
          myInterstitialAd = null;
        },
      ),
    );
  }

  static RewardedAd? myRewardAd;

  static Future<void> loadReward()async{
    await RewardedAd.load(
        adUnitId: getAdId(deviceType: getPlatform(), adType: 'reward',),
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              myRewardAd = ad;
              // ignore: avoid_print
              print('RewardAd is Loaded!');
            },
            onAdFailedToLoad: (LoadAdError error){
              // ignore: avoid_print
              myRewardAd = null;
              // ignore: avoid_print
              print('エラー：RewardAd failed to load: $error');
            }
        ),
    );
  }


  static Future<void> loadAdSize(BuildContext context)async{
    await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate()
    );
  }
}

// onRewardedAdUserEarnedReward