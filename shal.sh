#! /bin/bash
# file='/dpd/home/ercview/ercviewapp/utils/new.csv'
# if [ -f "$file" ];
# then
#         rm "$file"
# fi
# export path="/dpd/home/ercview/ercviewapp/utils"
x=$(date +%s)
dif='7'
x=$((x - $dif * 24 * 60 * 60))
fdate=$(date --date @$x +%Y/%m/%d)
ftime="-00:00:00"
FromDate="$fdate"
echo $FromDate
#*****************Date difference**********
y=$(date +%s)
dif2='0'
y=$((y - $dif2 * 24 * 60 * 60))
tdate=$(date --date @$y +%Y/%m/%d)
ttime="-23:59:59"
ToDate="$tdate"
echo $ToDate
start=$FromDate
end=$ToDate

start=$(date -d $start +%Y%m%d)
end=$(date -d $end +%Y%m%d)

while [[ $start -le $end ]]
do
    # echo "Start : $start"
    temp=$(date -d $start +%Y/%m/%d)
    # echo "Temp : $temp"
    # use start varible as date in you command
    cat Creo_Exception.csv |grep $temp

    start=$(date -d"$start + 1 day" +"%Y%m%d")
done>>data.csv
