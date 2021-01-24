echo "First Argument $1"

if [ -z "$1" ]; then
	echo "ERROR: No argument supplied" >&2;
	exit 1;
fi

echo " Realpath $($realpath $1)"

archives_directory=$(realpath $1)

if [ ! -d "$archives_directory" ]; then 
	echo "ERROR: Archives directory does not exist" >&2;
	exit 1;
fi

echo "directory $archives_directory"

find $archives_directory -type f -name '*.tar.gz' -mmin +$((1)) -
exec rm {} \;

path_to_script=$(realpath "$0")
if ! (crontab -1 | grep -Fxq "0 0 * * $path_to_script $archives_directory");
then 
	crontab -1 | { cat; echo "0 0 * * * $path_to_script $archives_directory"; } | crontab -
	echo "Script added to Cron"
fi

exit 0

