#!/bin/sh

HTTP_DOC = $ARGV[1] 

#  build_id is inherited from vRCS
DOWNLOAD_PATH = /tmp/deployment/${build_id}

wget $TARGZ --no-check-certificate --directory-prefix=$DOWNLOAD_PATH

BASEDIR=$(dirname $0)
echo $BASEDIR

echo "=====clean up from last deployment======-"
rm -rf $HTTP_DOC/*

echo "=====install new artifact======"
cd $DOWNLOAD_PATH
tar -zxvf *${build_id}.tar.gz -C ${HTTP_DOC}
chmod -r 644 ${HTTP_DOC}/*

echo "====restarting apache====="
/etc/init.d/httpd restart