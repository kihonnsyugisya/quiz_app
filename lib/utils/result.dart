
class Result{
  static int resultCount = 0;
  static void resetResultCount(){
    resultCount = 0;
  }
  static void addResultCount(){
    resultCount++;
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print( '正解数 : ${resultCount}' );
  }
  static double ratePoint({required int result,required int total}){
     double rate = result / total;
    return rate;
  }
  static String resultMessage({required double ratePoint}){
    if(ratePoint == 1){
      perfectResultMessages.shuffle();
      return perfectResultMessages.first;
    } else if(ratePoint >= 0.7){
      greatResultMessages.shuffle();
      return greatResultMessages.first;
    }else {
      badResultMessages.shuffle();
      return badResultMessages.first;
    }
  }
  static bool isMoveToResultPage({
    required bool isHard,
    required bool isSuccess,
    required int quizCount,
    required int quizLength}){
    if(isHard){
      if(quizCount == quizLength -1){
        return true;
      }else if(isSuccess){
        return false;
      }else{
        return true;
      }
    }else{
      if(quizCount == quizLength -1){
        return true;
      }else{
        return false;
      }
    }
  }
  static List<String> perfectResultMessages = [
    'エルルルルェ　ガンンンンンンンヌャスッ!!!',
    '100てんまんてんです',
  ];
  static List<String> greatResultMessages = [
    'エレガント!!ベリーエレガント!!',
    'スマート!!　スマート&エレガントッ!!',
  ];
  static List<String> badResultMessages = [
    'ノットエレガント!!字も汚ぇっ!!',
    'おまえはきれいさっぱりわるものをやめて\nきゃさりんをしあわせにしてやれ',
    'ぴーなつかいこんどけ',
    '貴様には\n臭い飯が妥当だ',
    'スパイにとってはまったくのお荷物だ…',
    '知らなくては…\nこの生き物について！',
  ];
}