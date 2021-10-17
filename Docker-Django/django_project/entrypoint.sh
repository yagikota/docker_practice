#!/bin/sh

# NetcatでTCPポートスキャンを行う場合、次のようなコマンドラインを指定する。
# nc -z -v ホスト名 ポート番号
# ここで「-z」というオプションは、「ゼロI/Oモード」を意味している。NetcatはゼロI/Oモードが指定されると、TCPの場合は相手先のポートに接続した後、すぐに接続を切断する。UDPでは相手のポートにパケットを送り、一定時間反応を待った後に処理を終了する。つまりゼロI/Oモードでは、実際のデータ通信は行われない
if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "PostgreSQL started"
fi
# 全部の引数を個別として処理
exec "$@"
