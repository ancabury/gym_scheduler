#!/usr/bin/env bash

email=""
pass=""

#visit login page and get session
login_page==$(curl -XGET https://cbcfitness.gymmasteronline.com/portal/)
portal_login_url=$(echo $login_page | sed -e 's/.*<a href="\(.*\)">.*/\1/')

# Login into the application
login_response=$(curl -D -XPOST https://cbcfitness.gymmasteronline.com$portal_login_url \
                      -d "email="$email"&password="$pass\
                      -H "Content-Type: application/x-www-form-urlencoded")

account_session=$(echo $login_response | sed -e 's/.*<a href="\/portal\/account\/?session=\(.*\)">.*/\1/')
# this will be used to make a booking

# Submit a class booking
# companyid=2&class=84465 -> blackroll
response_location=$(curl -i -XPOST "https://cbcfitness.gymmasteronline.com/portal/account/bookclass/submit?s=account.bookclass&session="$account_session\
                         -d "companyid=2&class=84465"\
                         -H "Content-Type: application/x-www-form-urlencoded"\
                          | grep "Location")

booking_id=$(echo $response_location | sed -e 's/.*\/portal\/payment\/tacs\/\(.*\)?session.*/\1/')

curl -i  https://cbcfitness.gymmasteronline.com/portal/payment/complete/$booking_id?session=$account_session
