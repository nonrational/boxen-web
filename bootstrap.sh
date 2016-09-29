heroku config:set \
  REPOSITORY="MealPass/our-boxen" \
  GITHUB_CLIENT_ID="${GITHUB_CLIENT_ID}" \
  GITHUB_CLIENT_SECRET="${GITHUB_CLIENT_SECRET}" \
  GITHUB_ORG="MealPass" \
  GITHUB_LOGIN=my-github-login \
  SECRET_TOKEN="$(rake secret | tr -d '\n')" \
  USER_ORG="MealPass" \
  REF="master"
git push heroku master
