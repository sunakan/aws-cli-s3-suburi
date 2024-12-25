#!/usr/bin/env bash
set -eu -o pipefail
#set -x
# -e: エラーが発生した時点でスクリプトを終了
# -u: 未定義の変数を使用した場合にエラーを発生
# -x: スクリプトの実行内容を表示(debugで利用)

echo '> aws s3 ls'
aws-vault exec main -- aws s3 ls
echo ''

echo "> aws s3 ls ${S3_BUCKET_NAME}"
aws-vault exec main -- aws s3 ls --recursive "${S3_BUCKET_NAME}"
echo ''

echo "> aws s3 sync --size-only local-files "s3://${S3_BUCKET_NAME}" --exclude '*' --include '*.csv'"
aws-vault exec main -- aws s3 sync --size-only local-files "s3://${S3_BUCKET_NAME}" --exclude '*' --include '*.csv'
echo ''

echo "> aws s3 ls ${S3_BUCKET_NAME}"
aws-vault exec main -- aws s3 ls --recursive "${S3_BUCKET_NAME}"
echo ''

echo "> aws s3 rm --recursive ${S3_BUCKET_NAME}"
aws-vault exec main -- aws s3 rm --recursive "s3://${S3_BUCKET_NAME}"
