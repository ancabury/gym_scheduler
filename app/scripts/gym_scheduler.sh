#!/usr/bin/env bash

email=$1
pass=$2
class_id=$3
company_id=2

#visit login page and get session
login_page==$(curl -XGET https://cbcfitness.gymmasteronline.com/portal/)
portal_login_url=$(echo $login_page | sed -e 's/.*<a href="\(.*\)">.*/\1/')

# Login into the application
login_response=$(curl -XPOST https://cbcfitness.gymmasteronline.com$portal_login_url \
                      -d "email="$email"&password="$pass\
                      -H "Content-Type: application/x-www-form-urlencoded")

# get the session for the logged user
account_session=$(echo $login_response | sed -e 's/.*<a href="\/portal\/account\/?session=\(.*\)">.*/\1/')

# Submit a class booking
response_location=$(curl -i -XPOST "https://cbcfitness.gymmasteronline.com/portal/account/bookclass/submit?s=account.bookclass&session="$account_session\
                         -d "companyid="$company_id"&class="$class_id\
                         -H "Content-Type: application/x-www-form-urlencoded"\
                          | grep "Location")

# get booking id
booking_id=$(echo $response_location | sed -e 's/.*\/portal\/payment\/tacs\/\(.*\)?session.*/\1/')

# booking confirmation
curl -XPOST https://cbcfitness.gymmasteronline.com/portal/payment/complete/$booking_id?session=$account_session
