#!/bin/bash
# Coded by SinonX
# Free to use or recode



asu(){
	checker=$(curl -s "https://leftbrainrightbrain.co.za/nhentai-api.php?code=$1" | head -1)
	if [[ $checker =~ '200' ]]; then
		echo -e "DOUJIN FOUND!! -> $1"
		echo "https://nhentai.net/g/$1" >> Doujin_Valid.txt
	elif [[ $checker =~ '404' ]]; then
		echo -e "DOUJIN NOT FOUND -> $1"
	else
		echo -e "Unknown"

	fi
}

cat << "EOF"

  ,                                __                __                     
 /|/\         _ |\ _ _,   ,_      / () _  _|  _     / ()|)   _ _ |)  _  ,_  
  |  |  |  | /  |/|// |  /  |    |    / \/ | |/    |    |/\ |//  |/)|/ /  | 
  |  |_/ \/|_\__|_|_\/|_/   |/    \___\_/\/|_|_/    \___|  ||_\__| \|_/   |/

  	 [SinonX - Tatsumi Crew]				
  	[For man of culture only]
EOF
echo ""

read -p "List of code : " codemu;

IFS=$'\r\n' GLOBIGNORE='*' command eval 'bacot=($(cat $codemu))'
waktumulai=$(date +%s)
for (( i = 0; i <"${#bacot[@]}"; i++ )); do
  WOW="${bacot[$i]}"
  IFS='' read -r -a array <<< "$WOW"
  ipx=${array[0]}
  ((cthread=cthread%5)); ((cthread++==0)) && wait
  asu ${ipx} &
done
wait