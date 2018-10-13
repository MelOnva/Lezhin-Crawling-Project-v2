#!/bin/bash

if [ ! $1 ] || [ ! $2 ] || [ ! $3 ]
	then
		echo '$1 command is not found. <COMIC NAME>
$2 command is not found.<scrolls|pages>
$3 command is not found.<Y/n>'
		exit 1
fi

name=$1

source ./access_token

if [ ! "$as" ]
then
echo 'Edit this file. (./access_token) Input your access token.
access token is find lezhin comics site in F12 Debug mode in ?ACCESS_TOKEN=???????????????
'
exit 1
fi

if [ ! "$4" = 'sigle' ]

then

if [ ! $5 ]
then
cash=true
else
cash=false
fi

if [ "$3" = 'n' ]
	then
	
	echo 'Cleaning old-config files...'
	rm id*
	rm name*

  rm -r ${name}
  rm -r download

		grep "\"name\":" ./${1}.json | cut -d ':' -f 2 | cut -d ',' -f 1 | cut -d '"' -f 2 | cut -d '"' -f 1 > ./name

		grep "\"id\"" ./${1}.json | cut -d ':' -f 2 > ./id #TAG _base Error.
		
##Double string is SOLVED##

		while [ -s './name' ]
			do

				name=`sed -n 1p ./name`

				id=`sed -n 1p ./id`

				for i in {1..500}
					do

						wget -P './download' "https://cdn.lezhin.com/v2/comics/${comic_number}/episodes/$id/contents/${2}/${i}?access_token=${as}&purchased=$cash"

						if [ ! "$?" = '0' ]
							then
							echo 'Stoped.'
								break
						fi

					done

				find ./download -size 0 -exec rm -rf {} \;

				sed 1d ./name > ./name.tmp
				cat ./name.tmp > ./name

				sed 1d ./id > ./id.tmp
				cat ./id.tmp > ./id

				rename "s/access_token=${as}&purchased=${cash}/char/" ./download/*

       rename 's/\?char/.jpg/' ./download/*

       echo "Re-Named"

				mv download/ ${name}/

				7zr a $1/${name}.7z ${name}/

				rm -r ${name}/

			done

rm name*
rm id*
rm -r ${name}
rm -r download

exit $?



fi

else

for i in {1..50}
					do

						wget -P './download' "https://cdn.lezhin.com/v2/comics/${comic_number}/episodes/${4}/contents/${2}/${i}?access_token=${as}&purchased=true"

						if [ ! "$?" = '0' ]
							then
							echo 'Stoped.'
								break
						fi

					done

				rename "s/access_token=${as}&purchased=true/char/" ./download/*

       rename 's/\?char/.jpg/' ./download/*

       echo "Re-Named"

				mv download/ ${5}/

				7zr a ${1}/${5}.7z ${5}/

				rm -r ${5}/
				
	rm id*
	rm name*
				
exit $?

fi
