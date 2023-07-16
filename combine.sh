custom_paste() (
  IFS=$(printf '\t')
  printf '%s\n' "$*"
  paste -- "$@"
)

custom_paste *.txt > all.csv
