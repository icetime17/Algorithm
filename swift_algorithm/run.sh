#/usr/bin/sh

for file in ./*
do
    if test -f $file
    then
        chmod +x $file
        ./$file
    fi
done
