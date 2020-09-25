NEW_DIR="$1"

[ -z "$NEW_DIR" ] && echo "empty"
[ -n "$NEW_DIR" ] && { mkdir "$(pwd)/$NEW_DIR"; cd "$(pwd)/$NEW_DIR"; }