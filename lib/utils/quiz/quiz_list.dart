
import 'package:quiz_app/utils/quiz/quiz.dart';

class QuizList{

  static List<dynamic> normalList = [
    firstNormalList,
    secondNormalList,
    // thirdList
  ];
  static List<QuizEntity> firstNormalList = [
    QuizEntity(quiz: 'この漫画はどこで連載されている？', answer: ['J SQ','J＋','ヤンジャン'], answerOfNum: 1),
    QuizEntity(quiz: 'ロイドの表向きの職業は？', answer: ['精神科医','弁護士','教師'], answerOfNum: 0),
    QuizEntity(quiz: '黄昏はどこの国のスパイであるか', answer: ['東（オスタニア）','西（ウェスタリス）','北（ノスタリス）'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャは、年齢を何歳で偽っているか？', answer: ['4歳','5歳','6歳'], answerOfNum: 2),
    QuizEntity(quiz: '新聞に隠されていた暗号はどれ？', answer: ['C暗号','T暗号','P暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'にゃーん', answer: ['C暗号','T暗号','P暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'ロイドとアーニャはどこで出会った？', answer: ['研究所','病院','孤児院'], answerOfNum: 2),
    QuizEntity(quiz: 'ヨルの年齢は？', answer: ['25','26','27'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドとヨルが初めて出会った場所はどこ？', answer: ['ブティック','ランドリー','パーティー'], answerOfNum: 0),
    QuizEntity(quiz: 'ヨルの弟の名前は？', answer: ['ユーリ','ヘンリー','ユーゴ'], answerOfNum: 0),
    QuizEntity(quiz: 'ヨルのコードネームは？', answer: ['ローズ姫','いばら姫','ツバキ姫'], answerOfNum: 1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの性格は？', answer: ['ワイルド','エレガンス','ビューティフル'], answerOfNum: 1),
    QuizEntity(quiz: 'ウェスタリス情報局対東課', answer: ['SSS','WISE','TWICE'], answerOfNum: 1),
    QuizEntity(quiz: '酒に酔わない体質の持ち主は誰か', answer: ['ロイド','ヨル','アーニャ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャのイーデン校合格祝いは？', answer: ['ピーナツ1年分','城のレンタル','犬'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャはフランキーのことをなんと呼んでいる？', answer: ['ヒゲヅラ','モジャ','モジャモジャ'], answerOfNum: 2),
    QuizEntity(quiz: 'イーデン校において、選り抜かれた特に優秀な特待生をなんと呼ぶか', answer: ['インペリアルスカラー','ファイナンシャルスカラー','インダストリアルスカラー'], answerOfNum: 0),
    QuizEntity(quiz: 'インペリアルスカラーになるためには、ステラは何個必要か', answer: ['7個','8個','9個'], answerOfNum:1 ),
    QuizEntity(quiz: 'トニトが何個溜まると即時退学となるか', answer: ['7個','8個','9個'], answerOfNum:1 ),
    QuizEntity(quiz: 'アーニャが所属するクラスはどれか', answer: ['スペクター寮','クライン寮','セシル寮'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドが考案した、アーニャをダミアンに接触させるためのプランBのその名は', answer: ['ナカヨシ作戦','オトモダチ作戦','ダイスキ作戦'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャはダミアンのことを普段なんと呼んでいるか', answer: ['じなん','わるもの','たーげっと'], answerOfNum: 0),
    QuizEntity(quiz: 'ベッキーのフルネームは？', answer: ['ベッキー・ブラウン','ベッキー・ブラックベル','ベッキー・レイボーン'], answerOfNum:1),
    QuizEntity(quiz: '国家保安局', answer: ['AAA','DDD','SSS'], answerOfNum: 2),
    QuizEntity(quiz: '国家保安局は市民からは何と呼ばれているか', answer: ['特殊警察','秘密警察','極秘警察'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャが初めてステラを獲得した時の出来事はどれ', answer: ['優秀な成績を収めた','社会貢献','人命救助'], answerOfNum: 2),
    QuizEntity(quiz: 'ボンドはどの研究によって特殊な能力を有していたのか', answer: ['プロジェクトアップル','プロジェクト SSS','プロジェクト ジャスティス'], answerOfNum: 0),
  ];
  static List<QuizEntity> secondNormalList = [
    QuizEntity(quiz: 'この漫画の原作の更新日はどれ？', answer: ['隔週月曜','隔週火曜','隔週金曜'], answerOfNum: 0),
    QuizEntity(quiz: '原作者の名前は？', answer: ['遠藤 章造','遠藤 達哉','斉藤 宏哉'], answerOfNum: 1),
    QuizEntity(quiz: 'アニメのロイドの声優は誰？', answer: ['エグチ タツヤ','カジ ユウキ','ハナエ ナツキ'], answerOfNum: 0),
    QuizEntity(quiz: 'WISEで使用されている挨拶はどれ？', answer: ['おはよう あるいは おつかれさま','ごきげんよう あるいは さようなら','こんにちは あるいは こんばんは'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドが孤児院でアーニャを選んだ決め手となる出来事は？', answer: ['足が早かった','運動神経が良かった','クロスワードを解いた'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャが好きなアニメの名前は？', answer: ['SPY HEROS','SPY WARS','SPY FORCE'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャがとある組織の実験体であったときの被験体番号は？', answer: ['006','007','008'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャの推定年齢は？', answer: ['3、4歳','4、5歳','5、6歳'], answerOfNum: 1),
    QuizEntity(quiz: 'ロイドはどんな世界を作りたくてスパイになった', answer: ['ありのままで暮らせる世界','みんなが笑顔ですごせる世界','子ども（じぶん）が泣かない世界'], answerOfNum: 2),
    QuizEntity(quiz: 'ヨルの同僚であるカミラの彼氏の名前は？', answer: ['ドミニク','トーマス','マイケル'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイド『病める時も 悲しみの時も どんな困難が訪れようとも', answer: ['共に愛し合おう','共に分かち合おう','共に助け合おう'], answerOfNum: 2),
    QuizEntity(quiz: 'ケロ', answer: ['P暗号','C暗号','F暗号'], answerOfNum:2),
    QuizEntity(quiz: 'ヨルは昔、弟にどんなケガを負わせてしまったことがあるか', answer: ['鼻を折った','肋骨を折った','腕を折った'], answerOfNum: 1),
    QuizEntity(quiz: 'ロイドがひったくり犯を制裁するときに放ったセリフは？', answer: ['貴様には臭い飯が妥当だ','貴様に食わせる飯は無い','貴様には不味い飯が妥当だ'], answerOfNum: 0),
    QuizEntity(quiz: 'イーデン校入学試験の二次審査に向かう道中で、フォージャ一家がエレガンスをアピールするためにとった行動は？', answer: ['受験生同士の喧嘩の仲裁に入った','学長の像に敬礼した','泣いてる子にハンカチを差し出した'], answerOfNum: 1),
    QuizEntity(quiz: 'イーデン校入学試験の二次審査に向かう道中で、ヨルは脱走した動物をどのように退治した？', answer: ['護身術を使った','ヨガで学んだ秘孔をついた','料理教室で学んだ包丁捌き'], answerOfNum: 1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの担当教科は？', answer: ['国語','経済学','歴史'], answerOfNum:2),
    QuizEntity(quiz: 'イーデン校入学の二次審査で圧迫面接を仕掛けてきた教師は誰？', answer: ['スワン先生','エバンス先生','ヘンダーソン先生'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャをイーデン校の繰上げ合格とするために犠牲になった架空の人物は？　', answer: ['リチュアル書記官','リリース書記官','イケニエール書記官'], answerOfNum: 2),
    QuizEntity(quiz: '証明写真機が入り口となっている隠れ家はどれ？', answer: ['隠れ家『F』','隠れ家『G』','隠れ家『D』'], answerOfNum: 2),
    QuizEntity(quiz: '入学式でダミアンにからかわれたアーニャがとった最初の行動はどれ？', answer: ['逃げ出した','オトナの余裕を見せつけた','泣いた'], answerOfNum: 1),
    QuizEntity(quiz: '入学式の日にダミアンはアーニャをからかい続けた結果どうなった？', answer: ['停学処分になった','トニトを与えられた','顔面を殴られた'], answerOfNum: 2),
    QuizEntity(quiz: 'ユーリ・ブライアの年齢は？', answer: ['20','21','22'], answerOfNum:0 ),
    QuizEntity(quiz: 'ユーリ『ボクは姉さんのいるこの国を守る為だったら何だってする', answer: ['何だって だ','汚れ役でも だ','どうなろうとも'], answerOfNum: 0),
    QuizEntity(quiz: 'オスタニアの情報機関が使っている作り話のマニュアルで誤っているものはどれ？', answer: ['ヘジャー通り','300ダルク','フーガリア産のワイン'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャのドッジボールにおけるひっさつのしょっとはどれ？', answer: ['えくすかりばー','すたーきゃっちあろー','すーぱーすたーしょっと'], answerOfNum: 1),
    QuizEntity(quiz: 'ベッキーの愛犬の名前は？', answer: ['マックス','ビーゼル','ペャールズ'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャが初めてステラを獲得した時のあだ名は？', answer: ['しゃいにんぐすたーあーにゃ','とっぷすたーアーニャ','すたーらいとアーニャ'], answerOfNum: 2),
    QuizEntity(quiz: 'オスタニアの首都は？', answer: ['ミュンク','ニールバーグ','バーリント'], answerOfNum: 2),
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
  static List<QuizEntity> firstHardList = [
    QuizEntity(quiz: 'ロイドが初登場したときに使用していた偽名は？', answer: ['ロバート','カレン','ドミニク'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイドが第一話で使用した、部屋の鍵のパスワードは？', answer: ['ロイド','フォージャー','タソガレ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャが過去に里子に出されていた時の名前でないものはどれ？', answer: ['アーニャ・レプスキー','アーニャ・ウィリアムズ','アーニャ・ブロッサム'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャがロイドの発信機を使って東の組織に送ってしまった信号は？', answer: ['黄昏降臨','アーニャ参上','黄昏参上'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャは過去に何回里子に出されていた？（フランキー調べ）', answer: ['2回','4回','6回'], answerOfNum: 1),
    QuizEntity(quiz: 'エドガーの娘の名前は？', answer: ['カレン','エレナ','カミラ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャのイーデン校の受験番号は何番？', answer: ['E-211','K-212','C-121'], answerOfNum: 1),
    QuizEntity(quiz: 'パーティーの帰りに宝石の密輸組織の残党から反撃を受けたときにロイドがヨルにスパイと悟られぬために放った嘘はどれ？', answer: ['最近強盗が多発している','単なる人違いだ','クライアントのヒステリー'], answerOfNum: 2),
    QuizEntity(quiz: '硬貨の中に暗号が隠されていたのはどの暗号？', answer: ['F暗号','C暗号','D暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'フォージャー一家の住所は？', answer: ['バーリント公園通り128','ニールバーグ公園通り128','バーリント公園通り121'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイド『数々の任務をこなしてきたこの黄昏は今初めて挫けかけている』アーニャ', answer: ['おつかれ ちち','がんばれ ちち','どんまい ちち'], answerOfNum:2),
    QuizEntity(quiz: 'アーニャは何点でイーデン校の筆記試験を通過した？', answer: ['29点','30点','31点'], answerOfNum: 2),
    QuizEntity(quiz: 'イーデン校入学試験の二次審査に向かう道中で、フォージャ一家が組んでいたフォーメーションは？', answer: ['フォーメーション D','フォーメーション E','フォーメーション F'], answerOfNum: 0),
    QuizEntity(quiz: 'ヘンダーソン『なんかもうエレガントっていうか◯◯◯この人たち!!』　', answer: ['すごい','やばい','こわい'], answerOfNum: 2),
    QuizEntity(quiz: 'ウォルター・エバンズの担当教科は？', answer: ['国語','経済学','歴史'], answerOfNum: 0),
    QuizEntity(quiz: 'マードック・スワンの担当教科は？', answer: ['国語','経済学','歴史'], answerOfNum:1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの年齢は？', answer: ['66','76','86'], answerOfNum: 0),
    QuizEntity(quiz: 'イーデン校の校長の名は？', answer: ['ザック・シルヴァー・ゴードン','ウォルター・ディズニー・エバンズ','ベネディクト・アイヴァン・グットフェラー'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャ姫を助けた時のロイドマンのセリフは？', answer: ['た‥助けに来たよアーニャ姫','ま‥待たせたなアーニャ姫','お‥おいでアーニャ姫'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャの身長は？', answer: ['89.5','99.5','109.5'], answerOfNum:1 ),
    QuizEntity(quiz: 'イーデン校は全何学年制となっているか', answer: ['11','12','13'], answerOfNum: 2),
    QuizEntity(quiz: 'ビル・ワトキンスのドッジボールにおける奥義はどれ？', answer: ['スーパースライダーショット','スーパーライジングショット','デュークホームラン'], answerOfNum: 0),
    QuizEntity(quiz: '水族館で化学兵器のフィルムを飲み込んでいたペンギンの名前は？', answer: ['ぺスカーくん','ペーマスくん','ペャールズくん'], answerOfNum: 2),
    QuizEntity(quiz: 'イーデン校のスペクター寮は第何組？', answer: ['1','2','3'], answerOfNum:0),
    QuizEntity(quiz: 'アーニャ『おまえはきれいさっぱりわるものをやめてきゃさりんを　', answer: ['かわいがってやれ…','あいしてやれ…','しあわせにしてやれ…'], answerOfNum:2),
    QuizEntity(quiz: 'ダミアンの取り巻きでない者はどれ？', answer: ['ジョージ・グルーマン','ユーイン・エッジバーグ','エミール・エルマン'], answerOfNum: 0),
    QuizEntity(quiz: '爆弾犬を用いてブランツ外相の暗殺を企てた首謀者は？', answer: ['グエン','キース','カート'], answerOfNum: 1),
  ];
  static List<QuizEntity> secondHardList = [
  ];
// static List<QuizEntity> thirdHardList = [
//   QuizEntity(quiz: 'dddddddd？', answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
//   QuizEntity(quiz: '2-2ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
//   QuizEntity(quiz: '2-3ここにクイズの内容が入りまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
// ];

}