# web_project
香水ショッピングモールウェブプロジェクトです。

![image](https://user-images.githubusercontent.com/96292043/172994635-51c0f5c7-5943-4aff-9dc0-b2ab055f8ed5.png)
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
  -　ログイン、ログアウト、会員登録、会員脱退、
  -　ID検索、パスワード検索
  -　会員登録時に住所APIを利用して住所を検索
  -　MyPage（注文リスト、使用したポイントを確認、アップデート）
 - 商品
   - 商品ページング
   - 高い、低い価格順、商品名順
   -　関連商品
   -　商品詳細検索機能
   -　商品おすすめ機能
   -　天気APIを利用してリアルタイムで現在の天気に合わせた商品をおすすめ
 - 商品の買い物かご
    -　決済APIを利用した決済機能 ( カカオペイ、カド、仮想口座　）
    -　決済中のポイントを使用
    -　買い物かごの追加、数量変更、個別注文、選択注文
- セキュリティfilter
  -　lucy-xss-filterを利用したセキュリティfilter 
# ウェブイメージ
- メイン場面
  - 1 性別で新商品を見せてくれる機能
  - 2 自社の最高注文数商品
  - 3 天気APIを利用してリアルタイム、AJAX通信で現在の天気に合わせた商品をおすすめ

![main bame](https://user-images.githubusercontent.com/96292043/172994539-3c89dd20-4953-4121-a52d-75a9c424879a.png)
![main3](https://user-images.githubusercontent.com/96292043/173009896-3db1110c-89fb-4e9e-a1e5-e59502bf5963.png)


- 会員登録
  - 会員登録とログインページは同じJSPにあり、簡単に会員登録とログインが可能。

  - ![kaiin1](https://user-images.githubusercontent.com/96292043/172998212-786b0bd5-d8c2-4ecf-bd3f-773dd1d68532.png)

  - ID重複検査
  - ![kaiin2](https://user-images.githubusercontent.com/96292043/172998226-b9cbc1d7-02c8-443d-be5c-d7da9d189e4e.png)

  - 住所APIを利用して会員登録中住所登録可能。
  - ![kaiin3](https://user-images.githubusercontent.com/96292043/172998252-5ba6dd67-9c5b-4fd4-8eaa-43c9cc3f7d53.png)


- MyPage
  - 最近購入した商品3個

![my1](https://user-images.githubusercontent.com/96292043/173007833-693138b6-8bf4-436e-9fbc-fb252b5dac2b.png)

  - すべて見るをクリックすれば購入した商品を全部観覧可能。
![mt2](https://user-images.githubusercontent.com/96292043/173007688-79455834-c611-4313-bfa6-8b4d3994d5ba.png)

  - MyPageでアカウントアップデート可能。
![image](https://user-images.githubusercontent.com/96292043/173008136-c95ce4f0-f274-496f-b87a-c92424193ac8.png)

  - 1　現在持っているポイント
  - 2　使用累積ポイント
  - 3　ポイント使用内訳

![my3](https://user-images.githubusercontent.com/96292043/173011480-aec98777-e318-4ab1-ba3e-2c943b1ea584.png)

- 商品

  - １　ブランド別商品

  - ２　高い、低い価格順、商品名順

  - ３　商品ページング

![shopping1](https://user-images.githubusercontent.com/96292043/173014184-6896c954-c6eb-462a-9b25-49f96504abef.png)





















