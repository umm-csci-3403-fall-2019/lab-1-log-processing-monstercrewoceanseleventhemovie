directory=$1
cd $directory/var/log
current_direct=$(pwd)

files=$(find $current_direct -type f -printf "%f\n")

for i in $files
do
	echo $i
	sed -E '' < $i >> result.txt
done

