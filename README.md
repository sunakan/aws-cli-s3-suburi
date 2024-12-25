# s3 sync


```shell
# ローカル → リモート
aws s3 sync --size-only local-files "s3://${S3_BUCKET_NAME}" --exclude '*' --include '*.csv'
```

- `--size-only`
  - ファイルサイズのみで更新の有無を判断
  - デフォルトはファイルサイズとタイムスタンプを見る
- `--exclude '*' --include '*.csv'`
  - `*.csv` だけを同期取りたい時、1度 exclude して include する


https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html

> A local file will require uploading if the size of the local file is different than the size of the S3 object, the last modified time of the local file is newer than the last modified time of the S3 object, or the local file does not exist under the specified bucket and prefix.
> ローカルファイルのサイズがS3オブジェクトのサイズと異なる場合、ローカルファイルの最終更新時刻がS3オブジェクトの最終更新時刻よりも新しい場合、または指定されたバケットとプレフィックスの下にローカルファイルが存在しない場合、ローカルファイルのアップロードが必要となります。
