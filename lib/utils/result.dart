
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
    required int quizCount,
    required int quizLength}){
    if(quizCount == quizLength -1){
      return true;
    }else{
      return false;
    }
  }
}