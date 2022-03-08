
import 'package:quiz_app/utils/package_info.dart';
import 'package:quiz_app/utils/shared_preference.dart';

class Info{
  // TODO: 起動時に表示されるPRを更新する。（アップデート時）
  static Map<String, Map<String, String>> prList = {
    '1.0.0': {'pr': '1.0.0のpr文がきます。'},
    '1.0.1': {'pr': '1.0.1のpr文がきます。'},
    '1.0.2': {'pr': '1.0.2のpr文がきます。'},
    '1.0.3': {'pr': '1.0.3のpr文がきます。'},
  };

  // TODO: TOPに表示される告知を適宜更新する。（アップデート時）
  static String information ='[次回アップデートのお知らせ] 次回アップデート予定は、アニメ第●話放送後に実装予定です。たくさんアニメを見てクイズを追加していきます！';

  static bool isShowInfoDialog(){
    // ignore: unrelated_type_equality_checks
    if(SharedPreference().status == PackageInfo.version){
      return false;
    } else{
      return true;
    }
  }

  static String getPr(){
    return prList[PackageInfo.version]!['pr'] ?? '今日も遊んでくれてありがとう！これからもみんながもっと楽しんでもらえるようにアップデートしていきますので、よろしくお願いします。';
  }

}