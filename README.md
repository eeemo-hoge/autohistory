# autohistory

> こぼれていく日々に、書き留めるための小さな場所を。

autohistory は、日々の記録を置くための空のテキストファイルを、年・月・日ごとに用意する Bash スクリプトです。記録の中身を書くのではなく、書き始めるための場所をそっと整えます。

![薄明の空に浮かぶ月を描いたイラスト](assets/quiet-morning.svg)

## 使い方

記録を作りたい場所で、スクリプトを実行します。

```bash
bash /path/to/autohistory.sh
```

リポジトリを開いた状態なら、次のように実行できます。

```bash
bash autohistory.sh
```

## 作成されるもの

1998〜2025年の各年について、次の5つのフォルダに月ごとの空の `.txt` ファイルを作成します。

```text
year/2025/1/1.txt
refyear/2025/1/1.txt
dreamyear/2025/1/1.txt
ventingyear/2025/1/1.txt
factyear/2025/1/1.txt
```

月の日数と、うるう年の2月の日数も反映します。実行した日のファイルも `year` と4つのカテゴリの各フォルダに作成されます。

## 実行前に

**既にある同名の `.txt` ファイルは空に初期化されます。** スクリプトはファイルを上書きするため、大切な記録がある場所では実行しないでください。

このスクリプトはファイルやフォルダを作成するだけです。記録の内容を読み取ったり、書き込んだりはしません。

---

*いつかの自分へ。*

[ライセンス](liscence)


# autohistory

> A little space to jot things down as the days slip by.

autohistory is a Bash script that creates blank text files for your daily entries, organised by year, month and day. Rather than dictating what you should write, it gently prepares a space for you to begin.

![Illustration of the moon floating in the twilight sky](assets/quiet-morning.svg)

## How to use

Run the script in the location where you wish to keep your records.

```bash
bash /path/to/autohistory.sh
```

If the repository is open, you can run it as follows:

```bash
bash autohistory.sh
```

## What is created

For each year from 1998 to 2025, it creates empty `.txt` files for each month in the following five folders.

```text
year/2025/1/1.txt
refyear/2025/1/1.txt
dreamyear/2025/1/1.txt
ventingyear/2025/1/1.txt
factyear/2025/1/1.txt
```

It also takes into account the number of days in each month and the number of days in February during leap years. A file for the day the script is run will also be created in the `year` folder and in each of the four category folders.

## Before running

**Any existing `.txt` files with the same name will be cleared.** As the script overwrites files, please do not run it in a location containing important records.

This script merely creates files and folders. It does not read from or write to the contents of any records.

---

*To my future self.*

[Licence](licence)

license is "[LICENSE](LICENSE)"
