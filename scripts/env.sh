dockerhub_repo="samuellihy"

function get_sanitised_branch_name() {
  local branch_name=$(git rev-parse --abbrev-ref HEAD | sed -E 's/[^0-9A-Za-z\-_]/-/g')
  echo $branch_name
}