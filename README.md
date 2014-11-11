= Closer Lee-Sangyoung =

- webtoon crawler
- depends on pup(https://github.com/EricChiang/pup)

Register Crontab as:

0 * * * * cd $SANGYOUNG_DIR ; SIZE=`wc -l url.tsv |cut -f1 -d' '`; ./crawl.sh $SIZE &>> crontab.log
