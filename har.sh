#! /bin/bash
x=$(date +%s)
dif='7'
x=$((x - $dif * 24 * 60 * 60))
fdate=$(date --date @$x +%Y/%m/%d)
ftime="-00:00:00"
FromDate="$fdate"
echo $FromDate
#*****************Date difference**********
y=$(date +%s)
dif2='1'
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
	echo $start
    # use start varible as date in you command 

	start=$(date -d"$start + 1 day" +"%Y/%m/%d")
done