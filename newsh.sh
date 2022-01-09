#!/bin/bash

# Same line "newfile" and then name of file without .sh
# Because of parameters, the name goes after newfile to create it
# The name becomes $1 because it is the parameter 1
# Parameter $0 is "newfile"
# The IFs check that not too many and not less parameters are given
if [ $# -lt 1 ]; then
	echo "Not enough parameters."
	echo "It must be: newsh fileName"
elif [ $# -gt 1 ]; then
	echo "Too many parameters."
	echo "It must be: newsh fileName"
else
	touch $1.sh
	echo '#!/bin/bash' >> $1.sh
	echo '' >> $1.sh
	echo '' >> $1.sh
	chmod u+x $1.sh
	vim $1.sh
fi


# Another methode with input after running command
# This means first type "newfile"
# Then next line it will wait for input
# Input goes to variable and then runs for creation and stuff
#read z
#touch $z.sh
#chmod u+x $z.sh
#vim $z.sh

