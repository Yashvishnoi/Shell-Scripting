. /home/yash/Desktop/Scripting/utils.sh

has_root_permission && echo "You are a root user" ||   echo   "You are not a root user."

does_user_exist "Ubuntu" && echo "User exist" ||   echo "User doesn't exist"

is_valid_file "/etc/passwd" &&  echo "Valid File" ||   echo   "Invalid File"

die "Some random error here"
