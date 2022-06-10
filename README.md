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
  - 1 性別で新商品を見せてくれる機能
  - 2 自社の最高注文数商品
![main bame](https://user-images.githubusercontent.com/96292043/172994539-3c89dd20-4953-4121-a52d-75a9c424879a.png)


- 会員登録

![image](https://user-images.githubusercontent.com/96292043/172995009-db7c79c3-f987-429f-a27e-13d0e841b90b.png)
![image](https://user-images.githubusercontent.com/96292043/172995029-233a6404-dda7-428a-8777-3223e85d9f15.png)

- 会員登録とログインページは同じJSPにあり、簡単に会員登録とログインが可能。
  - ![image](https://user-images.githubusercontent.com/96292043/172995453-1eea3099-e436-4505-ab99-f923ce85fdf4.png)
  - ID重複検査
  - 住所APIを利用して会員登録中住所登録可能。





















