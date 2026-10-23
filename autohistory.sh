## : <<'AUTOHISTORY_NOTES'
#0. このスクリプトは、2025年から1998年までフォルダと、それそれ、year/month/date.txtを自動で作ります。
## 0.5 refyear/month/date.txt ,dreamyear/month/date.txt, ventingyear/month/date.txt, factyear/month/date.txtを作成。
#1. 最後のdate.txtは、実際の日付をつけます例えばmonth == 1, 1/date なら、1/1,2,3,4 ...と31日まで続きます。
#2. それを1998~2025まで、year/month/dateと作ります。
## GHQ-12に基づく量的な観察を記録するファイルを作成すること。
#!/bin/bash

# 0. 2025年から1998年までのフォルダと、それぞれの year/month/date.txt を自動で作成する
# 0.5 refyear/month/date.txt、dreamyear/month/date.txt、ventingyear/month/date.txt、factyear/month/date.txt を作成する
# 1. 最後の date.txt は、実際の日付を付けます。例えば month == 1 なら 1/1, 2, 3, 4 ... と 31 日まで続きます。
# 2. それを 1998 ~ 2025 まで、year/month/date として作成します。

start_year=1998
end_year=2025

is_leap_year() {
  local year="$1"
  if (( year % 400 == 0 )) || (( year % 4 == 0 && year % 100 != 0 )); then
    return 0
  fi
  return 1
}

month_days() {
  local year="$1"
  local month="$2"

  case "$month" in
    1|3|5|7|8|10|12) echo 31 ;;
    4|6|9|11) echo 30 ;;
    2)
      if is_leap_year "$year"; then
        echo 29
      else
        echo 28
      fi
      ;;
    *) echo 0 ;;
  esac
}

create_history_tree() {
  local root="$1"

  for (( year = end_year; year >= start_year; year-- )); do
    for (( month = 1; month <= 12; month++ )); do
      local days
      days=$(month_days "$year" "$month")
      local month_dir="$root/${year}/${month}"
      mkdir -p "$month_dir"

      for (( day = 1; day <= days; day++ )); do
        : > "$month_dir/${day}.txt"
      done
    done
  done
}

# 0.5: 4つのカテゴリ別フォルダを作成
for category in ref dream venting fact; do
  create_history_tree "${category}year"
done

# 2: 1998〜2025 まで、year/month/date.txt を作成
create_history_tree "year"

# 末尾に現在の実日付を含む最終ファイルを作成（例: 2025/1/15.txt）
# これにより、最終的な日付ファイルには実際の日付が残る
current_year=$(date +%Y)
current_month=$(date +%m)
current_day=$(date +%d)

mkdir -p "year/${current_year}/${current_month}"
: > "year/${current_year}/${current_month}/${current_day}.txt"

for category in ref dream venting fact; do
  mkdir -p "${category}year/${current_year}/${current_month}"
  : > "${category}year/${current_year}/${current_month}/${current_day}.txt"
 done

exit 0

