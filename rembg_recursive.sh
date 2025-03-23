#!/bin/bash

# 引数チェック
if [ -z "$1" ]; then
	echo "使い方: $0 <入力フォルダ> [--model モデル名]"
	exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="${INPUT_DIR%/}_output"
MODEL=""
SHIFT=1

# モデルオプションのパース（任意）
while [[ "$#" -gt $SHIFT ]]; do
	case "$2" in
	--model)
		MODEL="$3"
		SHIFT=$((SHIFT + 2))
		;;
	*)
		echo "不明なオプション: $2"
		exit 1
		;;
	esac
done

# 処理開始
find "$INPUT_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read -r FILE; do
	REL_PATH="${FILE#$INPUT_DIR/}"
	OUT_PATH="$OUTPUT_DIR/$REL_PATH"
	OUT_DIR="$(dirname "$OUT_PATH")"
	mkdir -p "$OUT_DIR"

	if [ -n "$MODEL" ]; then
		rembg i --model "$MODEL" "$FILE" "$OUT_PATH"
	else
		rembg i "$FILE" "$OUT_PATH"
	fi
done
