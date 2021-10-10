#!/bin/bash
set -exuo pipefail

FORMULA="symly"
BRANCH=${FORMULA}
MAIN_BRANCH="main"
FORMULA_FILE="Formula/${FORMULA}.rb"
FORMULA_SOURCE_BASE_URL="https://github.com/loicrouchon/${FORMULA}/archive/"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 VERSION"
    echo "    - VERSION: The version of ${FORMULA} to bump to"
    exit 1
fi

VERSION="$1"
LOCAL_TAR="/tmp/${FORMULA}-${VERSION}.tar.gz"

rm -f ${LOCAL_TAR}
curl -sL ${FORMULA_SOURCE_BASE_URL}/v${VERSION}.tar.gz -o ${LOCAL_TAR}

SHA256SUM=$(sha256sum ${LOCAL_TAR} | cut -d' ' -f1)

echo "Prepare branch ${BRANCH}"
git checkout main
git pull

git branch -D ${BRANCH} || true
git checkout -b ${BRANCH}

echo "Bumping ${FORMULA} to version ${VERSION} with sha256sum ${SHA256SUM}"
perl -i -pe 's/  VERSION = "[^"]+".freeze/  VERSION = "'${VERSION}'".freeze/g' ${FORMULA_FILE}
perl -i -pe 's/  sha256 "[^"]+"/  sha256 "'${SHA256SUM}'"/g' ${FORMULA_FILE}

echo "Committing changes"
git reset HEAD .
git add ${FORMULA_FILE}
git commit -m "Bumping ${FORMULA} to version ${VERSION} with sha256sum ${SHA256SUM}"
echo "Pushing to ${BRANCH}"
git push --set-upstream origin ${BRANCH} -f

echo "Creating PR from ${BRANCH} to ${MAIN_BRANCH}"
gh pr create \
  --head ${BRANCH} \
  --base ${MAIN_BRANCH} \
  --title "Bump ${FORMULA} version to ${VERSION}" \
  --body "Bump ${FORMULA} version to ${VERSION}"

echo "Pull request created. Add the 'pr-label' to it when the build is successful for automatic merge to be triggered"
