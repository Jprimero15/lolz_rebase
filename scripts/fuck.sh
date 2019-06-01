function fuck {
curl -s -F 'file=@'"$1" "https://pixeldrain.com/api/file" >/dev/null 2>&1

DOWNLOAD='https://pixeldrain.com/api/file/'$(curl -s -F 'file=@'"$1" "https://pixeldrain.com/api/file" | cut -d '"' -f 4)'?download'

echo $DOWNLOAD
}