# ベースイメージ
FROM ubuntu:20.04

# bash
SHELL ["/bin/bash", "-c"]

# 環境変数
ENV TZ Asia/Tokyo
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# 基本リポジトリを更新および、ツールインストール
RUN apt update && \
    apt-get update -qq && \
    apt-get install -y autoconf sudo wget unzip curl vim bzip2 build-essential bison git tzdata cmake

# クライアントパッケージインストール
RUN apt-get install -y \
    mysql-client libmysqlclient-dev \
    postgresql-client libpq-dev \
    sqlite3 libsqlite3-dev

# リポジトリ更新
RUN mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh

## リポジトリ更新した後のパッケージインストール
RUN apt-get update -qq && \
    apt-get install -y nodejs yarn graphviz imagemagick && \
    apt-get clean && \
    rm -rf /var/cache/apt

# ruby3.0.2
RUN mkdir -p /usr/local/ruby && \
    cd /usr/local/ruby && \
    wget https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.2.tar.gz && \
    tar zxf ruby-3.0.2.tar.gz && \
    cd ruby-3.0.2 && \
    ./configure --enable-shared && \
    make && \
    make install
