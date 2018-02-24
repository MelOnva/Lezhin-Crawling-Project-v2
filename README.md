# Lezhin-Crawling-Project-v2
Extract automatic Lezhine comics. (Only openned comics)

# How to use
First, Download json file use this script.
※comic NAME is you can find "https://www.lezhin.com/ko/?????" << This ? is comic NAME.
./update-json.sh <comic NAME> <country>

Second, Get your ACCESS TOKEN.
This access token is you can find in lezhin comics site.
1. Connect lezhin comics site. "https://www.lezhin.com/"
2. Log in.
3. any comic come in.
4. F12 Debug mode on. (Android: use view-source: )
5. Find "?ACCESS_TOKEN="
6. If you can finned token ?ACCESS_TOKEN=????????-????-????-????-??????????? copy and input ./access_token file.
7. Ok.

Third, Execute ./start script.
./start.sh <comicNAME>

# This script is Bash Shell script.
Windwos, use bash.

# Based this project.
https://github.com/rartificia/lezhincomics_crawling_project

