#!/bin/bash

TOOLS_DIR=/opt/java/liferay/tools
DB_UPGRADE_CLIENT_DIR=${TOOLS_DIR}/portal-tools-db-upgrade-client

cp -rv /mnt/upgradetools/* ${TOOLS_DIR}

${DB_UPGRADE_CLIENT_DIR}/db_upgrade.sh

#cd ${DB_UPGRADE_CLIENT_DIR}
#export JAVA_OPTS="-Xms4096m -Xmx4096m -XX:MaxNewSize=2048m -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled"
#java -jar "${DB_UPGRADE_CLIENT_DIR}/com.liferay.portal.tools.db.upgrade.client.jar" -j "${JAVA_OPTS}"

#echo "grepping for errors"
#grep -i error ${DB_UPGRADE_CLIENT_DIR}/upgrade.log
#echo "grepping for exceptions"
#grep -i exception ${DB_UPGRADE_CLIENT_DIR}/upgrade.log
#echo "grepping for warnings"
#grep -i WARN ${DB_UPGRADE_CLIENT_DIR}/upgrade.log
