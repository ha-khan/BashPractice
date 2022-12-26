## Expansion
# Bash performs several substitutions/expansions upon the text before it carries out (evaluates) the command.
#
# pathname expansion
# the wildcard * character means match any characters in a filename
echo *
echo /usr/*/share

# tilde expansion
# expands into the name of the home directory of the named user or, if no
# user is named, the home directory of the current user.
cd ~/Desktop

# arithmetic expansion
# $((expression))
sum=$((5+5))

# brace expansion
# useful for creating consistently named entities
echo file_{1..5}
echo file_{a..z}
echo a{A{1,2},B{3,4}}

## Substitution

# The output of a command (launched in a subshell) can be later expanded, similar to f-string evaluation in python
# Command substitution is an operation with dedicated syntax to both execute a command 
# and to have this command's output stdout (stored) by a variable for later use. 
echo $(ls)

ls -l $(which cp)

# alternative (older) syntax for command substitution
ls -l `which cp`

#
# subshell cd to this users home Desktop and print out
# all their pdf files
for i in $(cd ~/Desktop ; echo *.pdf)
do
  echo $i
done

## Quoting
Can selectively suppress unwanted expansions and take specific symbols literally.

# text inside double quotes, all the special characters used by the shell lose their special meaning and 
# are treated as ordinary characters. 
# The exceptions are 
# $ (dollar sign), \ (backslash), and ` (backtick). 
echo "hello world ~"

# single quotes suppress all expansions
# and takes in the following symbols literally 
echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'

# to quote only a single character precede a character with a backslash, 
# which in this context is called the escape character. 
# Often this is done inside double quotes to selectively prevent an expansion.
echo "The balance for user $USER is: \$5.00"

# the backslash is used as part of a notation to represent certain 
# special characters called control codes.
# The first 32 characters in the ASCII coding scheme are used to 
# transmit commands to Teletype-like devices.
sleep 2; echo -e "times up\a\nBEEP!!!"
