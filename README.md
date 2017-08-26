# Sample Application

第9回hojiroLTでの発表に使用した、Laravel 5.4 + Vue.jsのサンプルWebアプリケーションです。

# Requirements

* `git`
* `docker`
* `composer`
* `npm` or `yarn`

# Setup Flow

composer projectの作成
```
// この場合、sampleというディレクトリの中にファイルが作られます
composer create-project --prefer-dist laravel/laravel sample
```

以降はsampleディレクトリ内での操作です。
```
cd sample
```

Laradockのclone
```
// projectをgitで管理する場合
git init
git submodule add https://github.com/Laradock/laradock.git
// projectをgitで管理しない場合
git clone add https://github.com/Laradock/laradock.git
```

バックエンドのセットアップ
```
composer update
 
// config/app.php を編集
- 'timezone' => 'UTC',
+ 'timezone' => 'Asia/Tokyo',
- 'locale' => 'en',
+ 'locale' => 'ja',
 
// .env を編集
// 値は自分の好きなように
- DB_DATABASE=homestead
- DB_USERNAME=homestead
- DB_PASSWORD=secret
+ DB_DATABASE=sample_db
+ DB_USERNAME=sample_user
+ DB_PASSWORD=sample_passwd
```

フロントエンドのセットアップ
```
npm install // デフォルトでVue.jsが入る
npm run dev // jsとsassのコンパイル
```

Laradockのセットアップ  
MySQLのバージョンは間違えないように気をつけてください。  
間違えた人へ → [LaradockでMySQLがどうしても立ち上がらない人あつまれー！ - Qiita](http://qiita.com/lala_fell/items/d4bd1340a5cc7dfcfcb4)
```
cd laradock
cp env-example .env
// .env を編集
- DATA_SAVE_PATH=~/.laradock/data
+ DATA_SAVE_PATH=.laradock/data
 
- WORKSPACE_COMPOSER_GLOBAL_INSTALL=false
- WORKSPACE_TIMEZONE=UTC
+ WORKSPACE_COMPOSER_GLOBAL_INSTALL=true
+ WORKSPACE_TIMEZONE=Asia/Tokyo
 
- PHP_FPM_INSTALL_MYSQLI=false
- PHP_FPM_INSTALL_TOKENIZER=false
- PHP_FPM_INSTALL_INTL=false
+ PHP_FPM_INSTALL_MYSQLI=true
+ PHP_FPM_INSTALL_TOKENIZER=true
+ PHP_FPM_INSTALL_INTL=true
 
- NGINX_HOST_HTTP_PORT=80
+ NGINX_HOST_HTTP_PORT=8080
 
- MYSQL_VERSION=8.0
- MYSQL_DATABASE=default
- MYSQL_USER=default
- MYSQL_PASSWORD=secret
+ MYSQL_VERSION=5.7
+ MYSQL_DATABASE=sample_db
+ MYSQL_USER=sample_user
+ MYSQL_PASSWORD=sample_passwd

```

docker-syncのセットアップ(macOSのみ)  
詳しくはこちらを参考にしてください。 → [Improove speed on macOS - Laradock Documentation](http://laradock.io/documentation/#improve-speed-on-macos)  
この設定以降は`docker-compose`ではなく`./sync.sh`でコンテナを起動します。
```
cd laradock
./sync.sh install // sudo 必要かもしれない
// ./sync.sh clean 以前にdocker-syncを使ったことがある時
./sync.sh up nginx mysql // 初回は時間がかかります
// ./sync.sh down コンテナを停止する時
```

コンテナを作る
```
WIP
```
