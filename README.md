BASH progressbar function
=========================

## Examples

`````bash
#!/bin/bash
source "$(dirname "$0")/progressbar.sh";

echo Example 1

for i in {0..100}
do
	#sleep 1
	progressbar $i
done
`````

`````bash
#!/bin/bash
source "$(dirname "$0")/progressbar.sh";

echo Example 2
progressbar 'Exporting...' 20 
sleep 1
progressbar 'Exporting...' 40 
sleep 1
progressbar 'Exporting...' 65 
sleep 1
progressbar 'Exporting...' 83 
sleep 1
progressbar 'Exporting...' 100 
sleep 2
`````

`````bash
#!/bin/bash
source "$(dirname "$0")/progressbar.sh";

echo Example 3

for i in {0..123}
do
	progressbar 'Exporting...' $i 123
done
`````

`````bash
#!/bin/bash
source "$(dirname "$0")/progressbar.sh";

echo Example 4

for i in {0..12345}
do
	progressbar 'Importing' $i 12345 '/somedir/somefile'$i'.ext'
done
`````

`````bash
#!/bin/bash
source "$(dirname "$0")/progressbar.sh";

echo Example 5
for j in {0..3}
do
	for i in {0..12345}
	do
		progressbar 'Exporting...' $i 12345
	done
done
`````
