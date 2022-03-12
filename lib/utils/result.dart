
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
}