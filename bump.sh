#!/bin/sh
set -euo pipefail

FORMULA="symly"
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

SHA256SUM=$(openssl sha256 < ${LOCAL_TAR})

echo "Prepare branch"
git checkout main
git pull

git branch -D ${FORMULA}
git checkout -b ${FORMULA}

echo "Bumping ${FORMULA} to version ${VERSION} with sha256sum ${SHA256SUM}"
sed -i '' -E 's/  VERSION = "[^"]+".freeze/  VERSION = "'${VERSION}'".freeze/' ${FORMULA_FILE}
sed -i '' -E 's/  sha256 "[^"]+"/  sha256 "'${SHA256SUM}'"/' ${FORMULA_FILE}

echo "Committing changes"
git reset HEAD .
git add ${FORMULA_FILE}
git commit -m "Bumping ${FORMULA} to version ${VERSION} with sha256sum ${SHA256SUM}"
git push --set-upstream origin ${FORMULA}

echo "Changes pushed, create a PR here: https://github.com/loicrouchon/homebrew-symly/compare/main...${FORMULA}"
echo "Once build is green, add the pr-pull label to trigger the merge to main"