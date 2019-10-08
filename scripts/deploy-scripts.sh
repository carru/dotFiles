#!/bin/bash

USER=mfg

if [ ${#1} -eq 1 ]
then
	TARGET=vmlc4c000$1  
elif [ ${#1} -eq 2 ]
then
	TARGET=vmlc4c00$1
else
	TARGET=$1
fi
echo $TARGET

#scp -r ~/{.kshrc,*.sh,local-pc4/,.tmux.conf} $USER@$TARGET:~/
#echo 'mv ~/local-pc4/ ~/local/ && mv ~/.kshrc ~/.bashrc' | ssh $USER@$TARGET

mkdir /tmp/pc4-copy
cp -r ~/{.*rc,*.sh,local-pc4/,.tmux.conf} /tmp/pc4-copy
mv /tmp/pc4-copy/local-pc4/ /tmp/pc4-copy/local/
cat /tmp/pc4-copy/.kshrc >> /tmp/pc4-copy/.bashrc
scp -r /tmp/pc4-copy/. $USER@$TARGET:~/
rm -rf /tmp/pc4-copy

#echo qad > ~/.pw
#rsync -vrz local-pc4/ $USER@$TARGET:~/local/ --password-file=~/.pw
