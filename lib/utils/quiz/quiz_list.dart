import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz.dart';

class QuizList{

  static List<dynamic> normalList = [
    firstNormalList,
    secondNormalList,
    // thirdList
  ];
  // TODO: クイズをここに追加する。前編・後編のクイズを追加する場合は、リストを追加する。また、modeListも更新する。
  // 前編（138話～181話）のクイズ：死滅回遊の基本設定、ルール説明、前編で登場するキャラクターなど
  static List<QuizEntity> firstNormalList = [
    QuizEntity(quiz: '死滅回游の主催者は誰？', answer: ['五条悟','羂索','夏油傑'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の目的は何？', answer: ['呪術師の強化','天元と日本人の同化','呪霊の殲滅'], answerOfNum: 1),
    QuizEntity(quiz: '虎杖悠仁が死滅回游に参加した理由は？', answer: ['宿儺の指を集めるため','伏黒恵の姉を救うため','五条悟を解放するため'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者が他者を殺害すると得られるポイントは？', answer: ['1点','5点','10点'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の結界（コロニー）は日本全国にいくつ存在する？', answer: ['5つ','10つ','15つ'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、新たなルールを追加するために必要なポイントは？', answer: ['50点','100点','150点'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游に参加するための条件は？', answer: ['呪術高専の卒業生であること','呪力を持つ者であること','特級呪術師であること'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の参加者で、過去の術師が受肉した者を何と呼ぶ？', answer: ['受肉者','転生者','受肉呪霊'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が19日間ポイントの変動がない場合の処置は？', answer: ['強制的にポイントが加算される','ゲームからの除名','死の執行'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游のルールで、参加者がゲームから離脱する方法は？', answer: ['100ポイントを獲得する','新ルールを追加する','他の参加者全員を倒す'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを失う条件は？', answer: ['他者に殺害された場合','19日間ポイント変動がない場合','ゲームから離脱した場合'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを獲得する主な方法は？', answer: ['他者を殺害する','呪霊を倒す','他の参加者から譲渡される'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際に必要な条件は？', answer: ['100ポイントを所持していること','他の参加者の同意を得ること','主催者の承認を得ること'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際の制約は？', answer: ['既存のルールと矛盾しないこと','主催者の承認が必要','他の参加者の同意が必要'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加できる回数に制限はある？', answer: ['1回まで','3回まで','制限なし'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游の参加者はどのような方法で結界（コロニー）に入る？', answer: ['自らの意思で入る','強制的に転送される','呪術高専からの指示で入る'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールでは、参加者は他の参加者を倒すことで何を獲得する？', answer: ['呪力','ポイント','新たな術式'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、五条悟はどのような状態で登場する？', answer: ['封印されている','自由に活動している','死亡している'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游は誰が仕組んだ呪術師同士の殺し合い？', answer: ['五条悟','加茂憲倫','夏油傑'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、虎杖悠仁が最初に目指す目標は？', answer: ['宿儺の指を集める','伏黒恵の姉を救う','五条悟を解放する'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、虎杖悠仁と共に行動する主な仲間は？', answer: ['伏黒恵','釘崎野薔薇','両方'], answerOfNum: 2),
    QuizEntity(quiz: '伏黒恵の姉の名前は？', answer: ['津美紀','美紀','恵美'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉が参加者になった理由は？', answer: ['自ら志願した','呪霊に操られた','目覚めたら既に参加者になっていた'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で登場する新キャラクター「秤金次」の術式は？', answer: ['無限列車','座殺博徒','領域展開'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、秤金次の術式「座殺博徒」の特徴は？', answer: ['パチンコのような確率の術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で登場する新キャラクター「日車寛見」の職業は？', answer: ['弁護士','検察官','裁判官'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で登場する新キャラクター「高羽史彦」の職業は？', answer: ['お笑い芸人','俳優','歌手'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵が結界内で最初に対峙した強敵の名前は？', answer: ['日車寛見','レジィ・スター','烏鷺亨子'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、乙骨憂太は何級呪術師として登場する？', answer: ['一級','特級','準特級'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、天元の計画に関連する重要な要素は？', answer: ['呪霊の殲滅','日本人との同化','呪術師の強化'], answerOfNum: 1),
  ];
  // 後編（182話～222話）のクイズ：ルール追加、後編で展開される戦闘、詳細な内容など
  static List<QuizEntity> secondNormalList = [
    QuizEntity(quiz: '死滅回游のルール追加により、参加者が他者にポイントを譲渡できるようになった際、最初にポイントを譲渡したキャラクターは？', answer: ['虎杖悠仁','乙骨憂太','秤金次'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者が他者を殺害する以外でポイントを得る方法は？', answer: ['呪霊の討伐','他の参加者からのポイント譲渡','特定のミッションの達成'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の結界内で、乙骨憂太が戦った特級呪霊の名前は？', answer: ['黒沐死','裏梅','羂索'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、乙骨憂太の術式は？', answer: ['十種呪法','裏香','無量空処'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、乙骨憂太が登場する理由は？', answer: ['虎杖悠仁を助けるため','五条悟を解放するため','死滅回游を終わらせるため'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、天元の計画の最終目的は？', answer: ['呪霊の殲滅','日本人全員との同化','呪術師の強化'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、日車寛見の術式の特徴は？', answer: ['裁判に関連する術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、高羽史彦の術式の特徴は？', answer: ['お笑いに関連する術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、秤金次の術式「座殺博徒」の効果は？', answer: ['確率で攻撃力を上げる','時間を止める','空間を歪める'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、秤金次の術式は何をモチーフにしている？', answer: ['パチンコ','スロットマシン','ルーレット'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉が目覚めた時の状態は？', answer: ['普通の人間','呪術師','死滅回游の参加者'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編の原作漫画での開始巻数は？', answer: ['第14巻','第16巻','第18巻'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編のアニメ第3期の放送開始時期は？', answer: ['2025年1月','2026年1月','2027年1月'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游において、100ポイントを消費することで何が可能になる？', answer: ['新たなルールの追加','結界からの脱出','他の参加者の呪力を奪う'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游の結界内で、参加者が一定期間ポイントを獲得しない場合の処置は？', answer: ['呪力の減少','術式の封印','死亡'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉の名前は？', answer: ['津美紀','美紀','恵美'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、天元の計画に関連する重要な要素は？', answer: ['呪霊の殲滅','日本人との同化','呪術師の強化'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを獲得する主な方法は？', answer: ['他者を殺害する','呪霊を倒す','他の参加者から譲渡される'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がゲームから離脱する方法は？', answer: ['100ポイントを獲得する','新ルールを追加する','他の参加者全員を倒す'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が19日間ポイントの変動がない場合の処置は？', answer: ['強制的にポイントが加算される','ゲームからの除名','死の執行'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加できる回数は？', answer: ['1回まで','3回まで','制限なし'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際の制約は？', answer: ['既存のルールと矛盾しないこと','主催者の承認が必要','他の参加者の同意が必要'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際に必要な条件は？', answer: ['100ポイントを所持していること','他の参加者の同意を得ること','主催者の承認を得ること'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを失う主な条件は？', answer: ['他者に殺害された場合','19日間ポイント変動がない場合','ゲームから離脱した場合'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、五条悟はどのような状態で登場する？', answer: ['封印されている','自由に活動している','死亡している'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉が参加者になった理由は？', answer: ['自ら志願した','呪霊に操られた','目覚めたら既に参加者になっていた'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、虎杖悠仁が最初に目指す目標は？', answer: ['宿儺の指を集める','伏黒恵の姉を救う','五条悟を解放する'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者が他者を殺害すると得られるポイントは？', answer: ['1点','5点','10点'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の結界（コロニー）は日本全国にいくつ存在する？', answer: ['5つ','10つ','15つ'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游に参加するための条件は？', answer: ['呪術高専の卒業生であること','呪力を持つ者であること','特級呪術師であること'], answerOfNum: 1),
  ];
  // static List<QuizEntity> thirdList = [
  //   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
  //   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
  //   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  // ];

  static List<dynamic> hardList = [
    firstHardList,
    // secondHardList,
    // thirdList
  ];
  // TODO: クイズをここに追加する。ハードモードのクイズを追加する場合は、リストに追加する。また、modeListも更新する。
  // ハードモードクイズ：前編・後編を問わず、死滅回遊編全体の詳細な内容
  static List<QuizEntity> firstHardList = [
    QuizEntity(quiz: '死滅回游のルールで、参加者が100ポイントを獲得すると可能になる行動は？', answer: ['ゲームからの離脱','新たなルールの追加','他の参加者の救済'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の参加者で、過去の術師が受肉した者を何と呼ぶ？', answer: ['受肉者','転生者','受肉呪霊'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新たなルールを追加する際に必要なポイントは？', answer: ['50点','75点','100点'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、秤金次の術式「座殺博徒」は何をモチーフにしている？', answer: ['パチンコ','スロットマシン','ルーレット'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵が結界内で最初に対峙した強敵の名前は？', answer: ['日車寛見','レジィ・スター','烏鷺亨子'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、日車寛見の術式の特徴は？', answer: ['裁判に関連する術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、高羽史彦の術式の特徴は？', answer: ['お笑いに関連する術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際の制約で最も重要なのは？', answer: ['既存のルールと矛盾しないこと','主催者の承認が必要','他の参加者の同意が必要'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉が目覚めた時の具体的な状態は？', answer: ['普通の人間','呪術師','死滅回游の参加者'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを失う主な条件は？', answer: ['他者に殺害された場合','19日間ポイント変動がない場合','ゲームから離脱した場合'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、五条悟はどのような状態で登場する？', answer: ['封印されている','自由に活動している','死亡している'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉が参加者になった理由は？', answer: ['自ら志願した','呪霊に操られた','目覚めたら既に参加者になっていた'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、天元の計画に関連する重要な要素は？', answer: ['呪霊の殲滅','日本人との同化','呪術師の強化'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者が19日間ポイントの変動がない場合の処置は？', answer: ['強制的にポイントが加算される','ゲームからの除名','死の執行'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、伏黒恵の姉の名前は？', answer: ['津美紀','美紀','恵美'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際の制約は？', answer: ['既存のルールと矛盾しないこと','主催者の承認が必要','他の参加者の同意が必要'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加する際に必要な条件は？', answer: ['100ポイントを所持していること','他の参加者の同意を得ること','主催者の承認を得ること'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がポイントを獲得する主な方法は？', answer: ['他者を殺害する','呪霊を倒す','他の参加者から譲渡される'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者がゲームから離脱する方法は？', answer: ['100ポイントを獲得する','新ルールを追加する','他の参加者全員を倒す'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游のルールで、参加者が新ルールを追加できる回数の制限は？', answer: ['1回まで','3回まで','制限なし'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游編で、虎杖悠仁が最初に目指す目標は？', answer: ['宿儺の指を集める','伏黒恵の姉を救う','五条悟を解放する'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、秤金次の術式「座殺博徒」の特徴は？', answer: ['パチンコのような確率の術式','時間を操る術式','空間を操る術式'], answerOfNum: 0),
    QuizEntity(quiz: '死滅回游の参加者はどのような方法で結界（コロニー）に入る？', answer: ['自らの意思で入る','強制的に転送される','呪術高専からの指示で入る'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールでは、参加者は他の参加者を倒すことで何を獲得する？', answer: ['呪力','ポイント','新たな術式'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游は誰が仕組んだ呪術師同士の殺し合い？', answer: ['五条悟','加茂憲倫','夏油傑'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、乙骨憂太は何級呪術師として登場する？', answer: ['一級','特級','準特級'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游編で、虎杖悠仁と共に行動する主な仲間は？', answer: ['伏黒恵','釘崎野薔薇','両方'], answerOfNum: 2),
    QuizEntity(quiz: '死滅回游の主催者は誰？', answer: ['五条悟','羂索','夏油傑'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游の目的は何？', answer: ['呪術師の強化','天元と日本人の同化','呪霊の殲滅'], answerOfNum: 1),
    QuizEntity(quiz: '死滅回游のルールで、参加者が他者を殺害すると得られるポイントは？', answer: ['1点','5点','10点'], answerOfNum: 1),
  ];
// static List<QuizEntity> thirdHardList = [
//   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
//   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
//   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
// ];

}
