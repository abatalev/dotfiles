#!/bin/sh

pacman -Q | awk '{ print $1; }' > packages.current
HOSTNAME="$(uname -n)"
grep -v -f "${HOSTNAME}.skip.txt" packages.txt > packages.filtered.txt
diff -U0 packages.current packages.filtered.txt | awk '
/^+/ { 
  if (substr($0,1,4) != "+++ ") {
	print substr($0,2); 
  }
}
' > "packages.delta.${HOSTNAME}"
rm packages.current
rm packages.filtered.txt
