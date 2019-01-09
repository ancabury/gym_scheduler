#!/usr/bin/env bash

subscription_id=$1
class_id=$2

book_url='https://cbc.project-trancend.com/api/group_class/book'
#todo X-Auth-Token needs generation ?

curl -i -XPOST 'https://cbc.project-trancend.com/api/group_class/book'\
        -H 'X-Auth-Token: ae69f120-13de-11e9-9ecd-f17b2265e84b'\
        -H 'Content-Type:  application/x-www-form-urlencoded; charset=UTF-8'\
        --data "class_id="$class_id"&subscription_id="$subscription_id"&place=1"
