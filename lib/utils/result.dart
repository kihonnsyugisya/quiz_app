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
  static final List<String> _cullingGameQuotes = [
    '大丈夫。僕最強だから',
    '生き様で後悔したくない',
    '俺は正義の味方（ヒーロー）じゃない、呪術師なんだ',
    '死ぬときは独りだよ',
    '愛ほど歪んだ呪いはないよ',
    '「死んで勝つ」と「死んでも勝つ」は全然違うよ',
    '僕にとっては町でアンケート取らされた位のハプニングさ',
    '俺が選ばれてる？ふざけんじゃねえ！',
    '俺はいつか地獄に落ちる。姉弟たちのためにも目一杯派手に生きてやる',
    '生き方は決めた 後は自分にできることを精一杯やるさ',
    '己を知り、己を律する者だけが真の強さを手に入れる',
    '弱い者を守るのが強い者の役目だ',
    '負けることを恐れるな。挑戦することを恐れろ',
    '自分を信じろ。そして周りの人も信じろ',
    '諦めるな。最後まで戦い抜け',
    '呪術師として誇りを持て',
    '力を正しく使うことが呪術師の使命だ',
    '仲間を信じ、共に戦う',
    '今この瞬間を大切に生きる',
  ];
  
  // 死滅回遊編の名言をランダムに取得
  static String getResultQuote() {
    final random = Random();
    return _cullingGameQuotes[random.nextInt(_cullingGameQuotes.length)];
  }
}