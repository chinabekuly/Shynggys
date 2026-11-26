#!/usr/bin/env sh
# Собирает версию для GitHub Pages в папку docs/:
# оборачивает site/index.html в полный HTML-документ и копирует снимок цен.
set -e
cd "$(dirname "$0")/.."
mkdir -p docs/data
{
  printf '<!doctype html>\n<html lang="ru">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<style>[hidden]{display:none!important}img{max-width:100%%}</style>\n</head>\n<body>\n'
  cat site/index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
cp data/market-latest.json docs/data/market-latest.json
touch docs/.nojekyll
echo "docs/ собрана"
