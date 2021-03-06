#From https://github.com/ProjectHDS/Herodotus/blob/master/build.sh

#!/bin/sh -x


BUILD=Herodotus
DATE="$(TZ='Asia/Shanghai' date +%Y-%m-%d_%H-%M-%S-%N)"
#VERSION=1.0
#VERSION=$"(echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
VERSION=DevEdition #被硬编码了
COMMON_NAME="${BUILD}-${VERSION}-${DATE}"
#JAR_FILE_NAME="${COMMON_NAME}.jar"
ZIP_FILE_NAME="${COMMON_NAME}.zip"
#PROJECT_DIR="${HOME}/Projects/example"

[ -d "${GITHUB_WORKSPACE}" ] && PROJECT_DIR="${GITHUB_WORKSPACE}"
[ "${PROJECT_DIR}" != "${PWD}" ] && cd "${PROJECT_DIR}"


mv .minecraft overrides
zip -r "${ZIP_FILE_NAME}" -xi manifest.json modlist.html overrides
mv {,artifacts/}${ZIP_FILE_NAME}