# media-info-proc-docker

静岡大学 メディア情報処理論 演習用の x86_64のdebian11環境をDocker composeで提供する。

x86_64用ソフトウェアが利用できる。

XQuartzを使えば、GUIも起動可能。

マイクは利用不可。

## Requirements
- Docker
- Docker compose

## Options
- make
- XQuartz


## 使い方

### 1. ダウンロード (最初の1回のみ)

```
git clone https://github.com/agtkh/media-info-proc-docker
cd media-info-proc-docker
```

### 2. Dockerイメージのビルド (最初の1回のみ)

```
docker compose build
```

または

```
make build
```

### 3. Dockerコンテナをバックグラウンドで起動

```
docker compose up -d
```

または

```
make up
```

### 4. Docker コンテナにアタッチ (シェルログイン)

```
docker compose exec media-info-proc bash
```

または

```
make attach
```

※コンテナ内では`exit`コマンドでデタッチできる。

### 5. Dockerコンテナの終了

```
docker compose down
```

または

```
make down
```

## Docker Volumeについて

ローカルの`./user_home`とコンテナ内の`/home/devuser`は同期している。

ローカルの`./user_home`にファイルを入れれば、コンテナ内で利用できる。

## ダウンロードファイル集

### SLPex-Shzu

URL: [https://lec.chi.msys.eng.shizuoka.ac.jp/SLPex-Shzu/SLPex-Shzu20240421.tar.gz](https://lec.chi.msys.eng.shizuoka.ac.jp/SLPex-Shzu/SLPex-Shzu20240421.tar.gz)

### スライド資料
URL : https://lec.chi.msys.eng.shizuoka.ac.jp/SLPex-Shzu/SLPex-ApdxSlide202205.pdf

## コマンド集

### tar.gzの解凍
```
tar -zxvf SLPex-Shzu20240421.tar.gz
```

### XQuartz に全てのホスト名を許可させる
```
xhost + >/dev/null
```
