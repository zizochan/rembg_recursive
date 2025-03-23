# rembg-recursive.sh

このシェルスクリプトは、指定したフォルダ内の画像ファイルを再帰的に処理し、`rembg` コマンドを使用して背景除去を行います。
出力先は入力フォルダ名に `_output` を付与したフォルダとなり、入力と同様のディレクトリ構造が維持されます。

---

## 必要な環境

以下のツールを事前にインストールしてください。

```bash
brew install rembg shfmt
```

- `rembg`：背景除去ツール（コマンドライン版）
- `shfmt`：シェルスクリプトの整形ツール

---

## 使い方

```bash
./rembg_recursive.sh <入力フォルダ> [--model モデル名]
```

### 使用例

```bash
./rembg_recursive.sh ./images --model isnet-anime
```

---

## スクリプトの整形

スクリプトの整形には、`shfmt`を使って下さい。

```bash
shfmt -w rembg_recursive.sh
```

---

## ライセンス

このスクリプトは MIT ライセンスの下で提供されます。

---

## 補足

`rembg` はバージョンによって内部仕様が変更されることがあります。最新の情報については公式ドキュメントをご参照ください。
https://github.com/danielgatis/rembg