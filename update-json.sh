#!/bin/bash

if [ -r $1.json ]
then
if [ ! $3 ]
then
echo 'Json file is found. Update start? (Y/n)'

read an

else

an=Y

fi

if [ ! "$an" = 'Y' ]
then

echo 'Aborted.'
exit 1

else

rm $1.json

fi

fi



if [ ! $1 ] && [ ! $2 ]
then

echo 'Usage: ./update-json.sh <COMIC_NAME> <country> [Skip qustions true]';
exit 1;

fi

wget -O ./tmp "https://www.lezhin.com/$lang/comic/${1}"

if [ ! $? = 0 ]
then

echo 'Download json ERROR, This comic is not found.';
exit 2;

fi

# Extracting json text
if [ ! $3 ]
then
echo 'Convert json? (Y/n)';

read an

else

an=Y

fi

if [ "$an" = Y ]
then

sed ':a;N;$!ba;s/\n/ /g' ./tmp > ./tmp1
sed 's/\x20//g' ./tmp1 > ./tmp2

sed 's/all\:/all\$/' ./tmp2 > ./tmp3
sed 's/}\]\,pur/}\]\$pur/' ./tmp3 > ./tmp4

sed 's/"comic","id":/"comic","id"%/' ./tmp4 > ./ctmp1
sed 's/;__LZ_ERROR_CODE__/%__LZ_ERROR_CODE__/' ./ctmp1 > ./ctmp2

#cat ./ctmp2

cat ./tmp4 | cut -d '$' -f '2' | cut -d '$' -f '1' > ./tmp5 # .${1}.json.3 Error

sed 's/]};__LZ_DATA__/]%;__LZ_DATA__/' ./tmp5 > ./tmp6

cat ./tmp6 | cut -d '%' -f '1' > ./tmp7

php7.0 -q './parse.php' > ./tmp8

sed '/^$/d' ./tmp8 > ./tmp9

sed 's/\ //g' ./tmp9 > ./${1}.json

## ""

# End of converted

rm ./tmp{1..9} # 1..5 Error
rm ./tmp
rm ./ctmp{1..2}

exit $?

fi
