# Sample Application

第9回hojiroLTでの発表に使用した、`Laravel + Vue.js`のサンプルWebアプリケーションです。

# Requirements

* git
* docker
* composer
* npm or yarn

# Setup Flow

composer projectの作成
```
composer create-project --prefer-dist laravel/laravel sample
```

Laradockのclone
```
cd sample
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
+ DB_DATABASE=sample
+ DB_USERNAME=root
+ DB_PASSWORD=

```

フロントエンドのセットアップ
```
npm install // デフォルトでVue.jsが入る
npm run dev // jsとsassのコンパイル
```

WIP
