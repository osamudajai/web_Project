# web_project
香水ショッピングモールウェブプロジェクトです。

![image](https://user-images.githubusercontent.com/96292043/172990649-8fe15391-aa55-4bdb-88bc-8a0de7865cfb.png)
（メイン場面の一部）

# 配布環境
- AWS(費用の問題で配布中止)

# 使用した技術スタック
- JAVA 8
- Spring Boot (4.3.6)
- Tomcat (9.0)
- Oracle (18.4)
- Mybatis (3.4.1)
- lucy-xss-servlet (2.0.0)
- Maven


# 実装した機能 ( 担当機能中心 )

- アカウント関連
  - ログイン、ログアウト、会員登録、会員脱退、
  - ID検索、パスワード検索
  - 会員登録時に住所APIを利用して住所を検索
  - MyPage（注文リスト、使用したポイントを確認、アップデート）
 - 商品関連
   - 商品ページング
   -　関連商品
   -　商品詳細検索機能
   - 商品おすすめ機能
   - 天気APIを利用してリアルタイムで現在の天気に合わせた商品をおすすめ
   - 高い、低い価格順、商品名順
 - 商品の買い物かご
    - 決済APIを利用した決済機能 ( カカオペイ、カド、仮想口座　）
    - 決済中のポイントを使用
    - 買い物かごの追加、数量変更、個別注文、選択注文
- セキュリティfilter
  -　lucy-xss-filterを利用したセキュリティfilter 
# ウェブイメージ
- メイン場面
  -　性別で新商品を見せてくれる機能
  -　自社の最高注文数商品




















