cd /home/yslee
$pid_player

rtmpdump -r "rtmp://ebsandroid.ebs.co.kr:1935/fmradiofamilypc/familypc1m" -o ebs-mouth.flv > /dev/null 2>&1  &
#rtmpdump -r "rtmp://ebsandroid.nefficient.com/fmradiofamilypc/familypc1m" -o ebs-mouth.flv > /dev/null 2>&1  &
pid_player=$!
sleep 1200

kill $pid_player

avconv -i ebs-mouth.flv  -acodec pcm_s16le -ac 2 -ab 128 -vn -y ebs-mouth.wav > /dev/null 2>&1
lame -h ebs-mouth.wav ebs-mouth.mp3 > /dev/null 2>&1
today=`date +%y%m%d%H%M`
mv ebs-mouth.mp3 ebs-mouth-$today.mp3
mv ebs-mouth-$today.mp3 Dropbox/EBS-mouth
