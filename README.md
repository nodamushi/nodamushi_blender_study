# Nodamushi Blender Study

Blender のアドオン開発に必要な環境(VSCode)の勉強用プロジェクト。

## Directories

- [nodamushi_blender_study](./nodamushi_blender_study) : アドオンのプログラムが格納されている

## 初期化手順

### Blender のバージョンと Python のバージョンを調べる

まずはあなたの Blender のバージョンを調べる。私は 4.1 を使っている。

まずはあなたの Blender を開き、Scripting で `import sys; sys.version` と打ち込む。

```sh
>>> import sys;sys.version
'3.11.7 (main, Feb  5 2024, 18:45:06) [MSC v.1928 64 bit (AMD64)]'
```

以上から、私の環境は以下の様になっていた。

- Blender: 4.1
- Python: 3.11.7

これは各環境で調べること

### pyenv を入れる

各環境で Python の Pyenv を入れておく。 Windows なら [pyenv-win](https://github.com/pyenv-win/pyenv-win) を使うのが楽。

Linux 環境や MSYS などを使った Unix 環境の場合は良い感じに pyenv を入れる。

### プロジェクトの初期化

以下を実行して、Pyenv の準備とVSCodeの準備を行う。

`Blederのバージョン`, `Pythonのバージョン` は環境に合わせる

```bat
.\init_pyenv.bat Blederのバージョン Pythonのバージョン
```

私の場合は以下の様になる。

```bat
.\init_pyenv.bat 4.1 3.11.7
```

なお、同様のbashスクリプトも用意してある。

## VSCode

このフォルダを VSCode で開く。

Python の拡張機能などはお好きなように。

普通に [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) を入れればいいと思われる。

上記の初期化処理をしていれば、良い感じに venv を認識して `bpy` とかの補完が出来るようになってるはず。なってなかったら、`.venv` ディレクトリを検索パスとかにいれるとかすればよいと思われる。

### Blender Development の導入

[Blender Development](https://marketplace.visualstudio.com/items?itemName=JacquesLucke.blender-development) の拡張機能をインストールする。

一度、コマンドから 「Blender: Start」 を実行してみる。

恐らく、Windows で初めてこのコマンドを実行すると、権限がないとかのエラーが出ると思われる。（Blender のインストール場所による）

管理者権限がない理由で駄目だった場合、一度VSCode を完全に終了する。そして、管理者権限で VSCode を起動し、再度このプロジェクトを開いてから 「Blender: Start」を実行すればデバッグ用のライブラリをインストールすることが出来る。Blender が起動するのを確認したら必ず管理者権限で起動した VSCode は終了しておく。

なお、終了しても 「`%APPDATA%\Blender Foundation\Blender\バージョン\scripts\addons\nodamushi_blender_study`」 （`バージョン` 部分は例えば4.1など） にリンクが残るので手動で削除する。管理者権限で初回起動した場合は、管理者権限のファイルが残るとまずいので必ず削除しておく。

### Blender の起動

コマンドから 「Blender: Start」 を実行する。

アドオンのディレクトリ([nodamushi_blender_study](./nodamushi_blender_study/)) のシンボリックリンクが `%APPDATA%\Blender Foundation\Blender\バージョン\scripts\addons` （`バージョン` 部分は例えば4.1など） に作成され、Blender のアドオンとして [nodamushi_blender_study](./nodamushi_blender_study/) が読み込まれる。 なお、Linux の場合は知らない。

終了は「Blender: Stop」があるが、これで終了しても 「`%APPDATA%\Blender Foundation\Blender\バージョン\scripts\addons\nodamushi_blender_study`」 にリンクが残るので手動で削除する。（Blender 4.1 なら 「`%APPDATA%\Blender Foundation\Blender\4.1\scripts\addons\nodamushi_blender_study`」）

「Blender: Start」 で起動した Blender は VSCode 上でのブレークポイントなどのデバッグ機能が使える。システムコンソールも VSCode の blender-タスク ターミナルになるので、古き良き print デバッグもはかどる。

### アドオンのリロード

ファイルを上書きしてもアドオン自体はリロードされない。

「Blender: Reload Addons」を実行するとリロードされる。

## 公開用アドオンの作り方

zip ファイルにすればよいだけである。 `make_addon` で zip 化できるようにしておいた。

```bat
.\make_addon.bat
```

なお、同様のbashスクリプトも用意してある。コマンドの実行には追加で zip コマンドが必要である。
