# クイズアプリ量産用セットアップガイド

このテンプレートをベースに新しいクイズアプリを作成する際に、変更が必要な箇所をまとめています。

## 📋 変更チェックリスト

### 1. アプリ基本情報

#### 1.1 アプリ名・タイトル
- **ファイル**: `lib/main.dart`
  - 43行目: `title: 'Quiz App'` → アプリ名に変更

- **ファイル**: `lib/utils/package_info.dart`
  - 9行目: `static String version = '1.0.0';` → 初期バージョンに変更
  - 10行目: `static String title = 'アプリのタイトル';` → アプリタイトルに変更

#### 1.2 パッケージ名・アプリケーションID
- **ファイル**: `android/app/build.gradle`
  - 28行目: `namespace "com.kihonsyugisya.quiz_app"` → 独自のパッケージ名に変更
  - 45行目: `applicationId "com.kihonsyugisya.quiz_app"` → 同じパッケージ名に変更

- **ファイル**: `pubspec.yaml`
  - 1行目: `name: quiz_app` → アプリ名に変更（スネークケース推奨）

- **ファイル**: `lib/main.dart`
  - 53-54行目のTODO: iOSの`Info.plist`とAndroidの`AndroidManifest.xml`のアプリラベル名を変更

### 2. テーマカラー

#### 2.1 メインカラー（緑っぽい色）
- **ファイル**: `lib/utils/color/original_theme_color.dart`
  - 5行目: `static HexColor themeColor = HexColor('#8EA99B');` → メインカラーに変更
  - 7行目: `static HexColor themeSubColor = HexColor('#697D73');` → サブカラーに変更
  - 10行目: `static HexColor secondColor = HexColor('#FCDDAB');` → 結果画面の色に変更

#### 2.2 その他の色
必要に応じて以下も変更：
- `black`, `gray`, `white`, `blue`, `twitter`, `star` など

### 3. フォント

- **ファイル**: `lib/utils/original_theme_font.dart`
  - 9行目: `fontFamily: 'Hiragino Kaku Gothic ProN'` → 使用するフォントに変更
  - Google Fontsを使用している箇所（`GoogleFonts.oswald`）も必要に応じて変更

### 4. クイズの問題と答え

#### 4.1 ノーマルモードのクイズ
- **ファイル**: `lib/utils/quiz/quiz_list.dart`
  - 12-16行目: `firstNormalList` → 第1章のクイズを追加
  - 17-21行目: `secondNormalList` → 第2章のクイズを追加
  - 22-26行目: `thirdList`（コメントアウト）→ 第3章以降を追加する場合はコメント解除

#### 4.2 ハードモードのクイズ
- **ファイル**: `lib/utils/quiz/quiz_list.dart`
  - 34-38行目: `firstHardList` → ハードモード第1章のクイズを追加
  - 39-48行目: `secondHardList`（コメントアウト）→ ハードモード第2章を追加する場合はコメント解除

#### 4.3 クイズリストの登録
- **ファイル**: `lib/utils/quiz/quiz_list.dart`
  - 6-10行目: `normalList` → 追加したクイズリストを登録
  - 28-32行目: `hardList` → 追加したクイズリストを登録

### 5. モードボタンのテキスト

- **ファイル**: `lib/utils/buttons.dart`
  - 66-70行目: `normalModeList` → ノーマルモードのボタンテキストを変更（例：'第1章', '第2章'）
  - 72-77行目: `hardModeList` → ハードモードのボタンテキストを変更

**注意**: ボタンの数は、`quiz_list.dart`の`normalList`と`hardList`の要素数に合わせる必要があります。

### 6. ロゴ・アイコン画像

#### 6.1 ロゴ画像
- **ファイル**: `images/logo.png`
  - 既存のロゴ画像を差し替え（推奨サイズ: 600×600pxのPNG）

- **ファイル**: `lib/view/nav_page.dart`
  - 87-88行目: ロゴ画像のパス（通常は変更不要）

#### 6.2 Androidアダプティブアイコン（Android 8.0以降対応）
Android 8.0以降では、丸いアイコンなどに対応するために**アダプティブアイコン**が必要です。以下の2つの画像を準備してください：

- **フォアグラウンド画像**: アイコンのメイン部分（1024×1024px推奨、中央の安全領域は432×432px）
  - `android/app/src/main/res/mipmap-*/ic_launcher_foreground.png`
  - 各密度フォルダ（mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi）に配置
  
- **バックグラウンド画像**: アイコンの背景（1024×1024px推奨）
  - `android/app/src/main/res/mipmap-*/ic_launcher_background.png`
  - 各密度フォルダ（mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi）に配置
  - 単色の背景推奨（メインカラーなど）

**注意**: 
- XMLファイル（`mipmap-anydpi-v26/ic_launcher.xml`）は既に設定済みです
- 画像ファイルを追加するだけで動作します
- 既存の`ic_launcher.png`はAndroid 7.1以前のフォールバックとして使用されます

#### 6.3 スプラッシュスクリーン
- **ファイル**: `pubspec.yaml`
  - 104-106行目: `flutter_native_splash`の設定
    - `image: "images/logo.png"` → ロゴ画像のパス
    - `color: "#8EA99B"` → スプラッシュスクリーンの背景色（メインカラーに合わせる）

### 7. 広告ID（AdMob）

AdMobの設定には、**コード内のID設定**と**マニフェストファイルへの設定**の両方が必要です。

#### 7.1 コード内の広告ユニットID設定
- **ファイル**: `lib/utils/adMob.dart`
  - 22行目: `static bool isTest = false;` → リリース時は`false`に設定
  - 30-41行目: `productionAdIds` → 本番環境の広告ユニットIDを設定
    - iOS: `banner`, `interstitial`, `reward`
    - Android: `banner`, `interstitial`, `reward`
  - 42-53行目: `testAdIds` → テスト用の広告ユニットID（開発時のみ使用）

#### 7.2 Androidマニフェストファイルへの設定
- **ファイル**: `android/app/src/main/AndroidManifest.xml`
  - 33-35行目: `com.google.android.gms.ads.APPLICATION_ID` を設定
    ```xml
    <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX"/>
    ```
  - **注意**: `~`（チルダ）の前がパブリッシャーID、後ろがアプリIDです
  - AdMobの管理画面で取得した**アプリID**（`ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX`形式）を設定

#### 7.3 iOS Info.plistへの設定
- **ファイル**: `ios/Runner/Info.plist`
  - 54-55行目: `GADApplicationIdentifier` を設定
    ```xml
    <key>GADApplicationIdentifier</key>
    <string>ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX</string>
    ```
  - AdMobの管理画面で取得した**アプリID**（`ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX`形式）を設定

#### 7.4 広告IDの取得方法
1. [AdMob](https://admob.google.com/)にログイン
2. 「アプリ」→「アプリを追加」でアプリを登録
3. アプリID（`ca-app-pub-XXXXXXXXXXXXXXXX~XXXXXXXXXX`）をコピー
4. 「広告ユニット」で各広告タイプ（バナー、インタースティシャル、リワード）の広告ユニットID（`ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX`）を取得

**重要**: 
- **アプリID**（`~`を含む）→ マニフェストファイルに設定
- **広告ユニットID**（`/`を含む）→ `adMob.dart`の`productionAdIds`に設定

### 8. お知らせ・PRメッセージ

#### 8.1 アップデート時のPRメッセージ
- **ファイル**: `lib/utils/info.dart`
  - 7-12行目: `prList` → バージョンごとのPRメッセージを追加
    ```dart
    static Map<String, Map<String, String>> prList = {
      '1.0.0': {'pr': '1.0.0のpr文がきます。'},
      '1.0.1': {'pr': '1.0.1のpr文がきます。'},
      // ...
    };
    ```

#### 8.2 トップ告知メッセージ
- **ファイル**: `lib/utils/info.dart`
  - 15行目: `static String information = '...'` → トップに表示される告知メッセージに変更

### 9. 外部リンク

#### 9.1 Twitterシェア
- **ファイル**: `lib/utils/url_launcher.dart`
  - 9行目のTODO: ハッシュタグを設定
  - `tweet()`メソッド内のハッシュタグ部分を変更

#### 9.2 プライバシーポリシー
- **ファイル**: `lib/utils/url_launcher.dart`
  - 38行目のTODO: プライバシーポリシーのURLを設定
  - `privacyPolicy()`メソッド内のURLを変更

#### 9.3 アプリストアリンク
- **ファイル**: `lib/utils/url_launcher.dart`
  - `launchAppStore()`メソッドを使用する場合、iOS App IDとAndroidパッケージ名を設定

- **ファイル**: `lib/view/more_page.dart`
  - 49行目のTODO: iOS App IDを設定
  - Androidパッケージ名も必要に応じて設定

### 10. その他の設定

#### 10.1 ボトムナビゲーションの色
- **ファイル**: `lib/utils/navigation.dart`
  - 19行目: `backgroundColor: OriginalThemeColor.black` → 必要に応じて変更
  - 20行目: `unselectedItemColor: OriginalThemeColor.gray` → 必要に応じて変更
  - 21行目: `selectedItemColor: OriginalThemeColor.white` → 必要に応じて変更

#### 10.2 その他のページ
- **ファイル**: `lib/view/more_page.dart`
  - 60行目のTODO: PR文を記述

## 🔄 変更の優先順位

新しいアプリを作成する際の推奨順序：

1. **必須項目**
   - [ ] アプリ基本情報（名前、パッケージ名）
   - [ ] クイズの問題と答え
   - [ ] モードボタンのテキスト
   - [ ] ロゴ画像

2. **推奨項目**
   - [ ] テーマカラー
   - [ ] フォント
   - [ ] 広告ID（AdMob使用時）
     - [ ] コード内の広告ユニットID（`lib/utils/adMob.dart`）
     - [ ] Androidマニフェストファイル（`android/app/src/main/AndroidManifest.xml`）
     - [ ] iOS Info.plist（`ios/Runner/Info.plist`）

3. **任意項目**
   - [ ] お知らせ・PRメッセージ
   - [ ] 外部リンク（Twitter、プライバシーポリシー）
   - [ ] その他のカスタマイズ

## 📝 注意事項

- クイズを追加する場合は、`normalList`/`hardList`と`normalModeList`/`hardModeList`の要素数を一致させる必要があります
- **AdMobの設定は3箇所必要です**：
  - `lib/utils/adMob.dart`の広告ユニットID（`/`を含む形式）
  - `android/app/src/main/AndroidManifest.xml`のアプリID（`~`を含む形式）
  - `ios/Runner/Info.plist`のアプリID（`~`を含む形式）
- 広告IDは本番環境とテスト環境で異なるため、リリース前に必ず確認してください
- アプリIDと広告ユニットIDは異なるので注意してください（アプリIDは`~`、広告ユニットIDは`/`）
- パッケージ名は一度設定すると変更が困難なため、慎重に決定してください
- ロゴ画像は600×600pxのPNG形式を推奨します

## 🎨 カラーパレットの例

現在のテーマカラー（緑系）：
- メインカラー: `#8EA99B`（緑っぽい色）
- サブカラー: `#697D73`（濃い緑）
- 結果画面: `#FCDDAB`（ベージュ）

他のテーマに変更する場合の参考：
- 青系: `#4A90E2`, `#2E5C8A`, `#E3F2FD`
- 赤系: `#E74C3C`, `#C0392B`, `#FFE5E5`
- 紫系: `#9B59B6`, `#7D3C98`, `#F4E6FF`

