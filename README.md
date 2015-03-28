# ランダムツイートボット
## 概要
GitHub の指定リポジトリの tweet.yml の内容から
1件選んでランダムにツイートするボット

## 用途
ブログの記事、 Qiita の記事、プロダクト、誰かの名言など定期的にツイートしたいものがあるとします。
そういったものをランダムにツイートするボットを Heroku の無料枠で手軽に動かすアプリケーションです。

## 仕様
* ツイートする確率は PROBABILITY に設定する。
* bot アカウントの TL にメッセージが届くたびに PROBABILITY * 100 % の確率で呟きます。
* ARTICLE_REPOSITORY に設定したリポジトリの直下に tweet.yml を配置すること
* tweet.yml の中身はツイート内容の文字列配列

例

<pre>
---
- GitHub Flow 図解 |> http://qiita.com/tbpgr/items/4ff76ef35c4ff0ec8314
- 'Ruby | アノテーションコメント（TODO、FIXME、OPTIMIZE、HACK、REVIEW） |> http://qiita.com/tbpgr/items/1c046a877c6be4d89876
  #ruby'
- 'Ruby | Ruby の private と protected 。歴史と使い分け |> http://qiita.com/tbpgr/items/6f1c0c7b77218f74c63e
  #ruby'
</pre>

## ENV
PROBABILITY は呟く確率です。
TL にメッセージが届くたびに PROBABILITY * 100 % の確率で呟きます。

|key|value|
|:--|:--|
|TWITTER_CONSUMER_KEY|your twitter consumer key|
|TWITTER_CONSUMER_SECRET|your twitter consumer secret|
|TWITTER_ACCESS_TOKEN|your twitter access token|
|TWITTER_ACCESS_TOKEN_SECRET|your twitter access token secret|
|TWITTER_ID|your twitter id|
|ARTICLE_REPOSITORY|github repository name. ex) tbpgr/qiita_favorite_articles|
|PROBABILITY|0.1|

## :cloud: デプロイ
このプロジェクトを Fork 後、 Heroku にサインインした状態で以下からデプロイ可能です

<a href="https://heroku.com/deploy">
  <img src="https://www.herokucdn.com/deploy/button.png" alt="Deploy">
</a>

* デプロイ後に heroku コマンドで Dyno を 1 に設定してください

~~~
heroku ps:scale bot=1
~~~
