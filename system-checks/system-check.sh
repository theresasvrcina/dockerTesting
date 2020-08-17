# Simple System Check Script

printf "\n"
printf "How much hard drive space did I use?\n"
printf "\n"

# This will display how much disk space was used in the hard drive that was mounted.
df -h

printf "\n"

printf "For the directory I'm in now, how much space am I using?\n"
printf "\n"

# Shows how much space each diretory is using
du -sh

printf "\n"
