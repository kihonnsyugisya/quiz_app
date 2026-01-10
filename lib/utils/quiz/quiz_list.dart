import 'dart:math';
import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz.dart';

class QuizList{

  // 選択されたクイズリスト（ランダムに10問選ばれたリスト）
  static List<QuizEntity>? selectedQuizList;

  static List<dynamic> normalList = [
    firstNormalList,
    secondNormalList,
    // thirdList
  ];

  // TODO: クイズをここに追加する。前編・後編のクイズを追加する場合は、リストを追加する。また、modeListも更新する。
  static List<QuizEntity> firstNormalList = [
    QuizEntity(
      quiz: '死滅回游とは何を目的として行われている呪術儀式か？',
      answer: ['人類の呪力進化を促すため', '呪霊を全滅させるため', '五条悟を復活させるため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游を主導している黒幕の人物は誰か？',
      answer: ['羂索', '両面宿儺', '天元'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の参加者として強制的に結界へ入れられる条件は？',
      answer: ['呪術師であること', '術式を付与された一般人であること', 'どちらも該当する'],
      answerOfNum: 2,
    ),

    QuizEntity(
      quiz: '死滅回游では、参加者が他者を殺害すると何が得られる？',
      answer: ['ポイント', '呪力の強化', '術式の追加'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の結界（コロニー）は何を基準に作られている？',
      answer: ['特定の都市や地域', '呪霊の発生地点', '呪術高専の支部'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游のルールにおいて、ポイントを使ってできる行為は？',
      answer: ['新ルールの追加', '結界の破壊', '術式の交換'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太が死滅回游に参加した主な目的は何か？',
      answer: ['五条悟解放のためのルール追加', '羂索への復讐', '宿儺の討伐'],
      answerOfNum: 0,
    ),

    // 修正：原作は「得点の変動がない（19日）」が条件
    QuizEntity(
      quiz: '死滅回游において、参加または得点獲得後19日間得点に変動がないとどうなる？',
      answer: ['術式を剥奪される', '強制退場になる', '呪力を失う'],
      answerOfNum: 0,
    ),

    // 修正：断定できない設問を、確定情報に差し替え
    QuizEntity(
      quiz: '死滅回游の参加者は作中で何と呼ばれる？',
      answer: ['泳者（プレイヤー）', '観戦者', '契約者'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游は最終的に何と融合することを目的としている計画か？',
      answer: ['天元と日本人全体', '呪霊と人類', '術師と非術師'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の進行管理やポイント表示などを行う式神の名前は？',
      answer: ['コガネ', 'ジャッジマン', 'リカ'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で「術師のプレイヤー」を殺害した場合に得られるポイントは？',
      answer: ['5点', '1点', '10点'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で「非術師のプレイヤー」を殺害した場合に得られるポイントは？',
      answer: ['1点', '5点', '0点'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で新ルールを追加するために必要なポイントは？',
      answer: ['100ポイント', '50ポイント', '200ポイント'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游のルール追加やポイントの告知などは、誰（何）を通じて行われる？',
      answer: ['コガネ', '天元', '羂索'],
      answerOfNum: 0,
    ),
  ];

  // 後編（182話～222話）安全版：原作確定情報のみ
  static List<QuizEntity> secondNormalList = [

    QuizEntity(
      quiz: '死滅回游のルール追加によって可能になった行為はどれ？',
      answer: ['ポイントの譲渡','結界の破壊','参加者の復活'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で参加者がポイントを得る主な方法は？',
      answer: ['他の参加者を殺害する','呪霊を祓う','時間経過'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太が死滅回游で戦った相手として正しいものは？',
      answer: ['黒沐死','裏梅','真人'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太の術式として正しいものは？',
      answer: ['里香を介した術式の模倣','十種影法術','無量空処'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太が死滅回游に参加した目的の一つは？',
      answer: ['仲間を守るため','単独で全滅させるため','天元を倒すため'],
      answerOfNum: 0,
    ),

    // 修正：「天元の計画」ではなく「羂索の計画」
    QuizEntity(
      quiz: '羂索の計画に含まれる内容として正しいものは？',
      answer: ['日本人全員との同化','呪霊の完全消滅','呪術の否定'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '日車寛見の術式の特徴として正しいものは？',
      answer: ['裁判を模した領域展開','物理攻撃特化','呪霊操作'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '日車寛見の領域展開において重要な存在は？',
      answer: ['式神「ジャッジマン」','呪霊','補助術師'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '高羽史彦の術式の最大の特徴は？',
      answer: ['本人の「面白い」という認識が影響する','呪力量に比例する','相手の恐怖心に依存する'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '高羽史彦の術式について正しい説明は？',
      answer: ['本人が術式の全容を把握していない','一度しか使えない','領域展開を伴う'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の領域展開の名称は？',
      answer: ['坐殺博徒','伏魔御厨子','無量空処'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の術式のモチーフは？',
      answer: ['ギャンブル','裁判','武道'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の領域展開中に起こり得る状態は？',
      answer: ['呪力がほぼ無限になる','術式が使用不能になる','強制退場になる'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒恵の姉の名前は？',
      answer: ['津美紀','真希','冥冥'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒津美紀が死滅回游の参加者となった理由は？',
      answer: ['受肉によって参加者になった','自ら志願した','呪霊化した'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で100ポイントを消費して可能になる行為は？',
      answer: ['新たなルールの追加','結界の即時解除','呪力の完全回復'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游のルールで、一定期間ポイント変動がない場合の処置は？',
      answer: ['術式の剥奪','即死','強制離脱'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の運営に深く関わっている存在は？',
      answer: ['天元','五条悟','夜蛾正道'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游を実質的に主導している人物は？',
      answer: ['羂索','宿儺','真人'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游における「コロニー」とは？',
      answer: ['戦闘が行われる結界区域','修行施設','呪具'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '参加者同士の戦闘が避けられない理由は？',
      answer: ['ポイント制度があるため','強制命令があるため','呪霊が操っているため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '虎杖悠仁が死滅回游に参加した主な理由は？',
      answer: ['伏黒津美紀を救うため','名声を得るため','呪霊研究のため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '五条悟の死滅回游編での状態は？',
      answer: ['封印されている','自由に活動している','死亡している'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で新ルールを追加する際の制約は？',
      answer: ['既存ルールと矛盾しないこと','全員の同意','羂索の許可'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游において重要視されるものは？',
      answer: ['ルールの理解','血統','呪具の数'],
      answerOfNum: 0,
    ),
  ];

  static List<dynamic> hardList = [
    firstHardList,
  ];

  // ハードモードクイズ：死滅回游編 全体（原作確定情報のみ）
  static List<QuizEntity> firstHardList = [

    QuizEntity(
      quiz: '死滅回游のルールで、参加者が100ポイントを消費して可能になる行為は？',
      answer: ['新たなルールの追加','結界の破壊','ゲームからの即時離脱'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '過去の呪術師が現代の人間に受肉した存在は何と呼ばれる？',
      answer: ['受肉者','転生者','呪霊'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で新ルールを追加する際の最重要条件は？',
      answer: ['既存ルールと矛盾しないこと','主催者の承認','全参加者の同意'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の領域展開「坐殺博徒」のモチーフは？',
      answer: ['ギャンブル','裁判','格闘技'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒恵が死滅回游で対峙した敵として正しいものは？',
      answer: ['レジィ・スター','日車寛見','石流龍'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '日車寛見の術式の根幹となる要素は？',
      answer: ['裁判','契約','支配'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '日車寛見の領域展開に登場する式神の名称は？',
      answer: ['ジャッジマン','バイフー','リカ'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '高羽史彦の術式の発動に最も影響するものは？',
      answer: ['本人の「面白い」という認識','呪力量','相手の恐怖'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '高羽史彦の術式について正しい説明はどれ？',
      answer: ['術式の全容を本人が理解していない','一度きりの術式','領域展開を必要とする'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒津美紀が死滅回游の参加者となった理由は？',
      answer: ['受肉によって参加者になった','自ら志願した','呪霊化した'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒恵の姉の名前は？',
      answer: ['津美紀','真希','冥冥'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で一定期間ポイント変動がない場合の処置は？',
      answer: ['術式の剥奪','即死','強制退場'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で参加者がポイントを得る主な方法は？',
      answer: ['他の参加者を殺害する','呪霊を祓う','時間経過'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游における「コロニー」とは？',
      answer: ['戦闘が行われる結界区域','修行施設','呪具'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の運営に深く関わっている存在は？',
      answer: ['天元','五条悟','夜蛾正道'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游を実質的に主導している人物は？',
      answer: ['羂索','宿儺','真人'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太の術式の特徴として正しいものは？',
      answer: ['他者の術式を模倣できる','十種影法術を使う','無下限呪術を使う'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太が仙台結界で戦った相手として正しいものは？',
      answer: ['石流龍','漏瑚','花御'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の領域展開中に起こり得る状態は？',
      answer: ['呪力がほぼ無限になる','術式が封印される','即座に勝敗が決まる'],
      answerOfNum: 0,
    ),

    // 修正：回数の断定をやめ、確定事項に差し替え
    QuizEntity(
      quiz: '死滅回游で総則（新ルール）を1つ追加するために必要な得点は？',
      answer: ['100点','50点','200点'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '五条悟は死滅回游編でどのような状態にある？',
      answer: ['封印されている','行方不明','死亡している'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の目的に含まれる要素は？',
      answer: ['天元と日本人の同化','呪霊の完全消滅','呪術の否定'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: 'レジィ・スターの術式の元になっているものは？',
      answer: ['レシート','契約書','呪符'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '烏鷺亨子の術式の特徴として正しいものは？',
      answer: ['空間を歪めて反転させる','物体操作','時間操作'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游の結界（コロニー）の名称は何に由来している？',
      answer: ['実在する地名','古代呪術師','特級呪霊'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游でポイント譲渡が可能になったのは何によるもの？',
      answer: ['新ルールの追加','初期ルール','天元の権限'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游において「受肉者」が保持しているのは何か？',
      answer: ['過去術師の記憶と術式','現代人の人格のみ','呪霊の意識'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次が大当たり状態の間に得る最大の利点は？',
      answer: ['呪力が自動回復し続ける','術式を複数同時使用できる','相手の領域を無効化できる'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '日車寛見の領域展開で「没収」が発生する条件は？',
      answer: ['被告が有罪判決を受けた場合','呪力差が大きい場合','術式を使用した場合'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '高羽史彦の術式が成立しない状況として正しいものは？',
      answer: ['本人が面白いと感じていない場合','呪力量が不足している場合','相手が領域展開した場合'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で結界を越えた自由移動ができない理由は？',
      answer: ['ルールで厳密に制限されているため','呪力が遮断されるため','天元の意識が及ばないため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '伏黒恵がレジィ・スター戦で用いた戦闘の特徴は？',
      answer: ['環境と影を利用した即興戦術','呪具による正面突破','領域展開の連続使用'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '石流龍の攻撃における最大の特徴は？',
      answer: ['極端に高い呪力出力','遠隔操作能力','多彩な術式の切り替え'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '烏鷺亨子の術式が直接干渉する対象は？',
      answer: ['空間そのもの','呪力のみ','物理質量'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '乙骨憂太が複数の敵を同時に相手取れた理由は？',
      answer: ['呪力量と術式の汎用性が非常に高いため','結界の補助があったため','敵同士が協力していなかったため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游のルールが自動で運用されている理由は？',
      answer: ['天元の結界術が基盤になっているため','羂索が常時操作しているため','呪霊の集合意識によるため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: 'ポイント制度が参加者同士の殺し合いを促進する理由は？',
      answer: ['ルール追加にポイントが必須なため','生存人数を制限するため','呪力を吸収するため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '虎杖悠仁が日車寛見との戦闘で見せた特徴は？',
      answer: ['呪力に頼らない判断力','領域展開への対抗術','呪具の多用'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游で参加者の自由意志が制限される理由は？',
      answer: ['ルール違反が即ペナルティになるため','羂索が精神操作しているため','天元が命令しているため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '秤金次の領域展開が長期戦向きとされる理由は？',
      answer: ['大当たり中の自己回復能力が高いため','攻撃力が指数関数的に上がるため','相手の術式を封じるため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '天元が死滅回游に深く関与している理由は？',
      answer: ['結界術の根幹そのものであるため','羂索の協力者だから','呪霊化を防ぐため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游が日本全国規模で行われている理由は？',
      answer: ['日本全体を対象とした計画だから','呪霊発生地点が多いため','術師人口が多いため'],
      answerOfNum: 0,
    ),

    QuizEntity(
      quiz: '死滅回游に一般観戦者が存在しない理由は？',
      answer: ['非参加者は結界に入れないため','戦闘規模が小さいため','呪力に耐えられないため'],
      answerOfNum: 0,
    ),
  ];

  // 通常モードのリストからランダムに10問を選ぶ
  static void selectRandomQuizzes(int listNum, int count) {
    if (listNum < 0 || listNum >= normalList.length) {
      return;
    }
    final sourceList = normalList[listNum] as List<QuizEntity>;
    if (sourceList.isEmpty) {
      selectedQuizList = [];
      return;
    }

    // リストをコピーしてシャッフル
    final shuffledList = List<QuizEntity>.from(sourceList);
    shuffledList.shuffle(Random());

    // 指定された数（10問）を選ぶ
    selectedQuizList = shuffledList.take(count).toList();
  }

  // ハードモードのリストからランダムに選ぶ（必要に応じて使用）
  static void selectRandomHardQuizzes(int listNum, int count) {
    if (listNum < 0 || listNum >= hardList.length) {
      return;
    }
    final sourceList = hardList[listNum] as List<QuizEntity>;
    if (sourceList.isEmpty) {
      selectedQuizList = [];
      return;
    }

    // リストをコピーしてシャッフル
    final shuffledList = List<QuizEntity>.from(sourceList);
    shuffledList.shuffle(Random());

    // 指定された数を選ぶ
    selectedQuizList = shuffledList.take(count).toList();
  }
}
