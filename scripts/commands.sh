#!/bin/bash
echo "yab -p:http://yab.qad.com/wsvn/yab/ee/dev/module-dev/inventory/trunk/inventory-latest.properties"
echo "yab -p:http://yab.qad.com/wsvn/yab/ee/dev/module-dev/inventory/trunk/inventory-dev.properties"
echo "yab -p:http://yab.qad.com/wsvn/yab/recipes/aux20201/2016/fin20171-core-prodorder-qmi-pc.properties"

echo ""
echo "yab reconfigure appserver-trim"
echo "yab stop database-all-restore start"
echo "yab stop database-rebuild mongodb-rebuild update"

echo ""
echo "yab -install-update:false install quality quality-api quality-proxy erp-quality-webui"

echo ""
echo "yab config dbserver.qaddb.sql.port"
echo "yab -merge-settings:recipe -p:"
echo "grep . -inre \"pattern\""
echo "find . -type f -size +100000k -exec ls -lh {} \;"
echo "dyab update -failonerror:false"
echo "devstore stop vm01106 -u devel -p 123"
echo "devstore start vm01106 -u devel -p 123 -h 100 -w -role BPM"
echo ". pset 11664"
echo "pro -p memclient.p -b"
echo "/tech/progress/dlc1173/bin/pro -p memclient-pc2.p -b"
echo "tar -cjvf archive.tar.bz2 stuff"
echo "tar -xjvf archive.tar.bz2 -C ."
echo "yab activity-feed-update"
echo "/qad/progress/dlc11464/bin/prolib *.pl -list"
echo "fwgo -l -u c4c"
echo "run devel rm ./databases/*.lk"
echo "run devel rm ./databases/mongodbs/qad-collaboration/*.lock"
echo "yab system-process-list update"
echo
echo "/qad/local/sandbox/user/devel/CATS_cronjobs/CATSScript/"

echo
echo "sudo iptables -I INPUT -p tcp -m tcp --match multiport --dports 1000:2000 -j ACCEPT"
echo "sudo service iptables save"
