#!/bin/bash
#
# Projectname	- BASH PROGRESS BAR
# Version	- 1.0
# Author	- Radovan Janjic <hi@radovanjanjic.com>
# Link		- https://github.com/uzi88/SH_Progressbar
#
# PROGRESS BAR
# $1 - Progress text (before)
# $2 - Number of done (eg 25)
# $3 - Out of (eg 200)
# $4 - Progress text (after)
progressbar(){
	local max=100;
	local stat=0;
	local msg='';
	if [[ ! -z "$2" ]]; then
		stat=$2;
		msg=$1;
	else
		stat=$1;
		msg='';
	fi
	
	if [[ ! -z "$3" ]]; then
		max=$3
	fi
	
	if [[ $stat -gt $max ]]; then 
		# progress is bigger than max
		return;
	else
		if [ $max -ge 100 ]; then
			s=$(( $max / 100 ));
		else
			s=1;
		fi
		
		if [ $(( $stat % $s )) -eq 0 ]; then
			# step
			c=$(bc -l <<< "$stat / $max");
			# bar (move on every 5%)
			k=$(printf "%.0f" $(bc -l <<< "$c * 100 / 5"));
			# percentage
			p=$(printf "%.0f" $(bc -l <<< "$c * 100"));
			# resoult line
			r=$msg' ['$(printf -v spaces '%*s' $k ''; printf '%s\n' ${spaces// /|})$(printf -v spaces '%*s' `expr 20 - $k` ''; printf '%s\n' ${spaces// /.})'] '$p'% '$4'\r';
			echo -ne $r;
			# clear line
			if [ $stat -eq $max ]; then 
				printf ' %0.s' $(eval echo "{0..${#r}}"); printf '\r'; 
			fi
		fi
	fi
}
