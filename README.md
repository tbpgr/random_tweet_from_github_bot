# ランダムツイートボット
## 概要
GitHub の指定リポジトリの tweet.yml の内容から
1件選んでランダムにツイートするボット

## ENV
PROBABILITY は呟く確率です。
TL にメッセージが届くたびに PROBABILITY * 100 % の確率で呟きます。

|key|value|
|TWITTER_CONSUMER_KEY|your twitter consumer key|
|TWITTER_CONSUMER_SECRET|your twitter consumer secret|
|TWITTER_ACCESS_TOKEN|your twitter access token|
|TWITTER_ACCESS_TOKEN_SECRET|your twitter access token secret|
|TWITTER_ID|your twitter id|
|ARTICLE_REPOSITORY|github repository name. ex) tbpgr/qiita_favorite_articles|
|PROBABILITY|0.1|

## :cloud: Deploy
<a href="https://heroku.com/deploy">
  <img src="https://www.herokucdn.com/deploy/button.png" alt="Deploy">
</a>
