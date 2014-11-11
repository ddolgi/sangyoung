#!/bin/bash
if [ $# -eq 0 ] ; then
	echo "Usage $0 id"
	exit 1
fi
id=$1
tsv_file="url.tsv"
json_file="url.json"
cron_html="cron.html"

# Get HTML
url="http://sports.donga.com/cartoon?cid=0100000204&sid=$id"
echo "Crowling: $url"
wget -qO"$cron_html" "$url"

# Get Image
img_src=`./pup div.cartoon_view img attr{src} < $cron_html`
if [ -z "$img_src" ] ; then
	echo "No img_src"
	rm $cron_html
	exit 1
fi
wget -O "page/$id.jpg" $img_src

# Get Date
date=`./pup div.cartoon_page_1 em text{} < $cron_html |awk '{print $2}'`
echo "Append: $id	$date	$img_src"
echo "$id	$date	$img_src" >> $tsv_file
./tsv2json.py < $tsv_file > $json_file
rm $cron_html

