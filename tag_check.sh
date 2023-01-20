#!/bin/bash
last_tag=$1

all_tag=$(git tag)

tag_befor=`echo $all_tag |rev| cut -d " " -f2 | rev`

test_last=`echo $last_tag | cut -d '.' -f1`
test_befor=`echo $tag_befor | cut -d '.' -f1`

if [ "$test_last" -gt "$test_befor" ] || [ "$test_last" -eq "$test_befor" ];then
    test_last=`echo $last_tag | cut -d '.' -f2`
    test_befor=`echo $tag_befor | cut -d '.' -f2`
    if [ "$test_last" -gt "$test_befor" ] || [ "$test_last" -eq "$test_befor" ];then
    test_last=`echo $last_tag | cut -d '.' -f3`
    test_befor=`echo $tag_befor | cut -d '.' -f3`
        if [ "$test_last" -gt "$test_befor" ];then
        echo "$test_last is good" 
        else
        echo "tag not good"
        exit 1
        fi
    else
    echo "tag not good"
    exit 1 
    fi
else
echo "tag not good"
exit 1
fi