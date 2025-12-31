import 'dart:math';

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
  
  // 死滅回遊編の名言リスト
// 死滅回遊編の名言リスト（関係ないもの除外）
static final List<String> _cullingGameQuotes = [
  '生き様で後悔したくない',
  '俺は正義の味方（ヒーロー）じゃない、呪術師なんだ',
  '俺が選ばれてる？ふざけんじゃねえ！',
  '俺はいつか地獄に落ちる。姉弟たちのためにも目一杯派手に生きてやる',
  '生き方は決めた 後は自分にできることを精一杯やるさ',
];

  
  // 死滅回遊編の名言をランダムに取得
  static String getResultQuote() {
    final random = Random();
    return _cullingGameQuotes[random.nextInt(_cullingGameQuotes.length)];
  }
}