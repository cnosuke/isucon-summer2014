#!/bin/sh
set -e

#データ投入後になにかしらの作業をしたい場合はこのシェルスクリプトに書いてください

mysql isucon -P 3306 -u isucon < /home/isu-user/isucon/webapp/ruby/init_script/make_index.sql
