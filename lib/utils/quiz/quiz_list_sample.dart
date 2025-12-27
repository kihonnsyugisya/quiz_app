// サンプルクイズリスト！EPY-FAMILY-developブランチより抽出�E�E
// こ�Eファイルは参老E��のサンプルです。実際のクイズリスト�E quiz_list.dart を使用してください、E

import 'package:jujutsu_kaisen_quiz/utils/quiz/quiz.dart';

class QuizListSample{

  static List<dynamic> normalList = [
    firstNormalList,
    secondNormalList,
    // thirdList
  ];
  static List<QuizEntity> firstNormalList = [
    QuizEntity(quiz: 'こ�E漫画はどこで連載されてぁE���E�E, answer: ['J SQ','J�E�E,'ヤンジャン'], answerOfNum: 1),
    QuizEntity(quiz: 'ロイド�E表向きの職業は�E�E, answer: ['精神科医','弁護士','教師'], answerOfNum: 0),
    QuizEntity(quiz: '黁E�Eはどこ�E国のスパイであるぁE, answer: ['東�E�オスタニア�E�E,'西�E�ウェスタリス�E�E,'北（ノスタリス�E�E], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャは、年齢を何歳で偽ってぁE��か！E, answer: ['4歳','5歳','6歳'], answerOfNum: 2),
    QuizEntity(quiz: '新聞に隠されてぁE��暗号はどれ！E, answer: ['C暗号','T暗号','P暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'にめE�EめE, answer: ['C暗号','T暗号','P暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'ロイドとアーニャはどこで出会った！E, answer: ['研究所','痁E��','孤児院'], answerOfNum: 2),
    QuizEntity(quiz: 'ヨルの年齢は�E�E, answer: ['25','26','27'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドとヨルが�Eめて出会った場所はどこ！E, answer: ['ブティチE��','ランドリー','パ�EチE��ー'], answerOfNum: 0),
    QuizEntity(quiz: 'ヨルの弟�E名前は�E�E, answer: ['ユーリ','ヘンリー','ユーゴ'], answerOfNum: 0),
    QuizEntity(quiz: 'ヨルのコードネームは�E�E, answer: ['ローズ姫','ぁE�Eら姫','チE��キ姫'], answerOfNum: 1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの性格は�E�E, answer: ['ワイルチE,'エレガンス','ビューチE��フル'], answerOfNum: 1),
    QuizEntity(quiz: 'ウェスタリス惁E��局対東課', answer: ['SSS','WISE','TWICE'], answerOfNum: 1),
    QuizEntity(quiz: '酒に酔わなぁE��質の持ち主は誰ぁE, answer: ['ロイチE,'ヨル','アーニャ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャのイーチE��校合格祝いは�E�E, answer: ['ピ�Eナツ1年刁E,'城�Eレンタル','犬'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャはフランキーのことをなんと呼んでぁE���E�E, answer: ['ヒゲチE��','モジャ','モジャモジャ'], answerOfNum: 2),
    QuizEntity(quiz: 'イーチE��校において、E��り抜かれた特に優秀な特征E��をなんと呼ぶぁE, answer: ['インペリアルスカラー','ファイナンシャルスカラー','インダストリアルスカラー'], answerOfNum: 0),
    QuizEntity(quiz: 'インペリアルスカラーになるためには、スチE��は何個忁E��か', answer: ['7倁E,'8倁E,'9倁E], answerOfNum:1 ),
    QuizEntity(quiz: 'トニトが何個溜まると即時退学となるか', answer: ['7倁E,'8倁E,'9倁E], answerOfNum:1 ),
    QuizEntity(quiz: 'アーニャが所属するクラスはどれか', answer: ['スペクター寮','クライン寮','セシル寮'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドが老E��した、アーニャをダミアンに接触させるため�EプランBのそ�E名�E', answer: ['ナカヨシ作戦','オトモダチ作戦','ダイスキ作戦'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャはダミアンのことを普段なんと呼んでぁE��ぁE, answer: ['じなめE,'わるも�E','た�Eげっと'], answerOfNum: 0),
    QuizEntity(quiz: 'ベッキーのフルネ�Eムは�E�E, answer: ['ベッキー・ブラウン','ベッキー・ブラチE��ベル','ベッキー・レイボ�Eン'], answerOfNum:1),
    QuizEntity(quiz: '国家保安局', answer: ['AAA','DDD','SSS'], answerOfNum: 2),
    QuizEntity(quiz: '国家保安局は市民から�E何と呼ばれてぁE��ぁE, answer: ['特殊警寁E,'秘寁E��寁E,'極秘警寁E], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャが�EめてスチE��を獲得した時の出来事�EどめE, answer: ['優秀な成績を収めた','社会貢献','人命救助'], answerOfNum: 2),
    QuizEntity(quiz: 'ボンド�Eどの研究によって特殊な能力を有してぁE��のぁE, answer: ['プロジェクトアチE�Eル','プロジェクチESSS','プロジェクチEジャスチE��ス'], answerOfNum: 0),
  ];
  static List<QuizEntity> secondNormalList = [
    QuizEntity(quiz: 'こ�E漫画の原作�E更新日はどれ！E, answer: ['隔週月曜','隔週火曁E,'隔週金曜'], answerOfNum: 0),
    QuizEntity(quiz: '原作老E�E名前は�E�E, answer: ['遠藤 章造','遠藤 達哉','斉藤 宏哉'], answerOfNum: 1),
    QuizEntity(quiz: 'アニメのロイド�E声優は誰�E�E, answer: ['エグチEタチE��','カジ ユウキ','ハナエ ナツキ'], answerOfNum: 0),
    QuizEntity(quiz: 'WISEで使用されてぁE��挨拶はどれ！E, answer: ['お�Eよう あるぁE�E おつかれさま','ごきげんよう あるぁE�E さよぁE��めE,'こんにちは あるぁE�E こんばん�E'], answerOfNum: 2),
    QuizEntity(quiz: 'ロイドが孤児院でアーニャを選んだ決め手となる�E来事�E�E�E, answer: ['足が早かっぁE,'運動神経が良かっぁE,'クロスワードを解ぁE��'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャが好きなアニメの名前は�E�E, answer: ['SPY HEROS','SPY WARS','SPY FORCE'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャがとある絁E���E実験体であったとき�E被験体番号は�E�E, answer: ['006','007','008'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャの推定年齢は�E�E, answer: ['3、E歳','4、E歳','5、E歳'], answerOfNum: 1),
    QuizEntity(quiz: 'ロイド�Eどんな世界を作りたくてスパイになっぁE, answer: ['ありのままで暮らせる世界','みんなが笑顔ですごせる世界','子ども（じぶん）が泣かなぁE��界'], answerOfNum: 2),
    QuizEntity(quiz: 'ヨルの同�Eであるカミラの彼氏�E名前は�E�E, answer: ['ドミニク','ト�Eマス','マイケル'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイド『病める時も 悲しみの時も どんな困難が訪れよぁE��めE, answer: ['共に愛し合おぁE,'共に刁E��ち合おぁE,'共に助け合おう'], answerOfNum: 2),
    QuizEntity(quiz: 'ケロ', answer: ['P暗号','C暗号','F暗号'], answerOfNum:2),
    QuizEntity(quiz: 'ヨルは昔、弟にどんなケガを負わせてしまったことがあるか', answer: ['鼻を折っぁE,'肋骨を折っぁE,'腕を折っぁE], answerOfNum: 1),
    QuizEntity(quiz: 'ロイドがひったくり犯を制裁するときに放ったセリフ�E�E�E, answer: ['貴様には臭ぁE��が妥当だ','貴様に食わせる飯は無ぁE,'貴様には不味ぁE��が妥当だ'], answerOfNum: 0),
    QuizEntity(quiz: 'イーチE��校入学試験�E二次審査に向かぁE��中で、フォージャ一家がエレガンスをアピ�Eルするためにとった行動は�E�E, answer: ['受験生同士の喧嘩の仲裁に入っぁE,'学長の像に敬礼した','泣ぁE��る子にハンカチを差し�Eした'], answerOfNum: 1),
    QuizEntity(quiz: 'イーチE��校入学試験�E二次審査に向かぁE��中で、ヨルは脱走した動物をどのように退治した�E�E, answer: ['護身術を使っぁE,'ヨガで学んだ秘孔をつぁE��','料理教室で学んだ匁E��捌ぁE], answerOfNum: 1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの拁E��教科�E�E�E, answer: ['国誁E,'経済学','歴史'], answerOfNum:2),
    QuizEntity(quiz: 'イーチE��校入学の二次審査で圧迫面接を仕掛けてきた教師は誰�E�E, answer: ['スワン先生','エバンス先生','ヘンダーソン先生'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャをイーチE��校の繰上げ合格とするために犠牲になった架空の人物は�E�　', answer: ['リチュアル書記宁E,'リリース書記宁E,'イケニエール書記宁E], answerOfNum: 2),
    QuizEntity(quiz: '証明�E真機が入り口となってぁE��隠れ家はどれ！E, answer: ['隠れ家『F、E,'隠れ家『G、E,'隠れ家『D、E], answerOfNum: 2),
    QuizEntity(quiz: '入学式でダミアンにからかわれたアーニャがとった最初�E行動はどれ！E, answer: ['送E��出した','オトナの余裕を見せつけた','泣ぁE��'], answerOfNum: 1),
    QuizEntity(quiz: '入学式�E日にダミアンはアーニャをからかぁE��けた結果どぁE��った！E, answer: ['停学処刁E��なっぁE,'トニトを与えられぁE,'顔面を殴られぁE], answerOfNum: 2),
    QuizEntity(quiz: 'ユーリ・ブライアの年齢は�E�E, answer: ['20','21','22'], answerOfNum:0 ),
    QuizEntity(quiz: 'ユーリ『�Eクは姉さん�EぁE��こ�E国を守る為だったら何だってする', answer: ['何だって だ','汚れ役でめEだ','どぁE��ろうとめE], answerOfNum: 0),
    QuizEntity(quiz: 'オスタニアの惁E��機関が使ってぁE��作り話のマニュアルで誤ってぁE��も�Eはどれ！E, answer: ['ヘジャー通り','300ダルク','フ�Eガリア産のワイン'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャのドッジボ�Eルにおける�Eっさつのしょっとはどれ！E, answer: ['えくすかり�Eー','すたーきゃっちあろー','す�Eぱーすたーしょっと'], answerOfNum: 1),
    QuizEntity(quiz: 'ベッキーの愛犬の名前は�E�E, answer: ['マックス','ビ�Eゼル','ペャールズ'], answerOfNum: 1),
    QuizEntity(quiz: 'アーニャが�EめてスチE��を獲得した時のあだ名�E�E�E, answer: ['しゃぁE��んぐすたーあ�EにめE,'とっぷすたーアーニャ','すたーらいとアーニャ'], answerOfNum: 2),
    QuizEntity(quiz: 'オスタニアの首�Eは�E�E, answer: ['ミュンク','ニ�Eルバ�Eグ','バ�EリンチE], answerOfNum: 2),
  ];
  // static List<QuizEntity> thirdList = [
  //   QuizEntity(quiz: 'dddddddd�E�E, answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
  //   QuizEntity(quiz: '2-2ここにクイズの冁E��が�Eりまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
  //   QuizEntity(quiz: '2-3ここにクイズの冁E��が�Eりまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
  // ];

  static List<dynamic> hardList = [
    firstHardList,
    // secondHardList,
    // thirdList
  ];
  static List<QuizEntity> firstHardList = [
    QuizEntity(quiz: 'ロイドが初登場したときに使用してぁE��偽名�E�E�E, answer: ['ロバ�EチE,'カレン','ドミニク'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイドが第一話で使用した、E��屋�E鍵のパスワード�E�E�E, answer: ['ロイチE,'フォージャー','タソガレ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャが過去に里子に出されてぁE��時�E名前でなぁE��のはどれ！E, answer: ['アーニャ・レプスキー','アーニャ・ウィリアムズ','アーニャ・ブロチE��ム'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャがロイド�E発信機を使って東の絁E��に送ってしまった信号は�E�E, answer: ['黁E�E降�E','アーニャ参丁E,'黁E�E参丁E], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャは過去に何回里子に出されてぁE���E�（フランキー調べ�E�E, answer: ['2囁E,'4囁E,'6囁E], answerOfNum: 1),
    QuizEntity(quiz: 'エドガーの娘�E名前は�E�E, answer: ['カレン','エレチE,'カミラ'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャのイーチE��校の受験番号は何番�E�E, answer: ['E-211','K-212','C-121'], answerOfNum: 1),
    QuizEntity(quiz: 'パ�EチE��ーの帰りに宝石の寁E��絁E���E残�Eから反撃を受けたときにロイドがヨルにスパイと悟られぬために放った�Eはどれ！E, answer: ['最近強盗が多発してぁE��','単なる人違いだ','クライアント�EヒスチE��ー'], answerOfNum: 2),
    QuizEntity(quiz: '硬貨の中に暗号が隠されてぁE��のはどの暗号�E�E, answer: ['F暗号','C暗号','D暗号'], answerOfNum:0 ),
    QuizEntity(quiz: 'フォージャー一家の住所は�E�E, answer: ['バ�Eリント�E園通り128','ニ�Eルバ�Eグ公園通り128','バ�Eリント�E園通り121'], answerOfNum: 0),
    QuizEntity(quiz: 'ロイド『数、E�E任務をこなしてきたこ�E黁E�Eは今�Eめて挫けかけてぁE��』アーニャ', answer: ['おつかれ ちち','がんばめEちち','どんまぁEちち'], answerOfNum:2),
    QuizEntity(quiz: 'アーニャは何点でイーチE��校の筁E��試験を通過した�E�E, answer: ['29点','30点','31点'], answerOfNum: 2),
    QuizEntity(quiz: 'イーチE��校入学試験�E二次審査に向かぁE��中で、フォージャ一家が絁E��でぁE��フォーメーションは�E�E, answer: ['フォーメーション D','フォーメーション E','フォーメーション F'], answerOfNum: 0),
    QuizEntity(quiz: 'ヘンダーソン『なんかもうエレガントってぁE��か◯◯◯こ�E人たち!!』　', answer: ['すごぁE,'めE�EぁE,'こわぁE], answerOfNum: 2),
    QuizEntity(quiz: 'ウォルター・エバンズの拁E��教科�E�E�E, answer: ['国誁E,'経済学','歴史'], answerOfNum: 0),
    QuizEntity(quiz: 'マ�Eドック・スワンの拁E��教科�E�E�E, answer: ['国誁E,'経済学','歴史'], answerOfNum:1),
    QuizEntity(quiz: 'ヘンリー・ヘンダーソンの年齢は�E�E, answer: ['66','76','86'], answerOfNum: 0),
    QuizEntity(quiz: 'イーチE��校の校長の名�E�E�E, answer: ['ザチE��・シルヴァー・ゴードン','ウォルター・チE��ズニ�E・エバンズ','ベネチE��クト�Eアイヴァン・グチE��フェラー'], answerOfNum: 2),
    QuizEntity(quiz: 'アーニャ姫を助けた時�Eロイド�Eンのセリフ�E�E�E, answer: ['た‥助けに来たよアーニャ姫','ま‥征E��せたなアーニャ姫','お‥おいでアーニャ姫'], answerOfNum: 0),
    QuizEntity(quiz: 'アーニャの身長は�E�E, answer: ['89.5','99.5','109.5'], answerOfNum:1 ),
    QuizEntity(quiz: 'イーチE��校は全何学年制となってぁE��ぁE, answer: ['11','12','13'], answerOfNum: 2),
    QuizEntity(quiz: 'ビル・ワトキンスのドッジボ�Eルにおける奥義はどれ！E, answer: ['スーパ�EスライダーショチE��','スーパ�EライジングショチE��','チE��ークホ�Eムラン'], answerOfNum: 0),
    QuizEntity(quiz: '水族館で化学兵器のフィルムを飲み込んでぁE��ペンギンの名前は�E�E, answer: ['ぺスカーくん','ペ�Eマスくん','ペャールズくん'], answerOfNum: 2),
    QuizEntity(quiz: 'イーチE��校のスペクター寮は第何絁E��E, answer: ['1','2','3'], answerOfNum:0),
    QuizEntity(quiz: 'アーニャ『おまえ�EきれぁE��っぱりわるものをやめてきゃさりんを　', answer: ['かわぁE��ってめE��…','あいしてめE��…','しあわせにしてめE��…'], answerOfNum:2),
    QuizEntity(quiz: 'ダミアンの取り巻きでなぁE��E�Eどれ！E, answer: ['ジョージ・グルーマン','ユーイン・エチE��バ�Eグ','エミ�Eル・エルマン'], answerOfNum: 0),
    QuizEntity(quiz: '爁E��犬を用ぁE��ブランチE��相の暗殺を企てた首謀老E�E�E�E, answer: ['グエン','キース','カーチE], answerOfNum: 1),
  ];
  static List<QuizEntity> secondHardList = [
  ];
// static List<QuizEntity> thirdHardList = [
//   QuizEntity(quiz: 'dddddddd�E�E, answer: ['からよし','だ','2-1-3'], answerOfNum: 0),
//   QuizEntity(quiz: '2-2ここにクイズの冁E��が�Eりまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 2),
//   QuizEntity(quiz: '2-3ここにクイズの冁E��が�Eりまーーーーーーす。俺ならできる。俺ならできる。俺は成功する', answer: ['一個目','2個目','3個目'], answerOfNum: 0),
// ];

}