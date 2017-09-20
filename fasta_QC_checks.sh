#!/bin/bash
# This is bashscript for Week 4 homework assignment 
# This script will help in exploring and applying to
# different applications tmux, ssh, and git have to offer 

#The first portion of this script should output a log of some of the 
#information pertaining to the zip files in data

# A for loop hould help accomplish the second portion of this asignment which is
# to output information about each zip file

unzip data/*.zip
rm data/*.zip
echo "Unzipping fasta files"
# This code will output a series of quality checks and information about the fasta files present in data

echo "Output from preliminary quality control checks on selected fasta files"
date +'%F %H:%M'
echo " "

#For date command could also use date +'%Y-%m-%d %H:%M'
# Note: The date that is outputted is incorrect. Can't change due to server 
#permissions

echo "Output for each fasta includes:"
echo "Filename, file size, first three lines, last three lines, the number of sequences in the file, and the sequence identifier lines, sorted alphabetically."
echo " "
echo "#######################################################"
echo " "

# This for loop should give out a set of data pertaining to each file"
# When running this script use the command 
# "bash fasta_QC_checks.sh data/*.fasta.zip
for file in $@
do
	echo "Output for $file:"
	echo " "
	echo "Size: $(du -hs ${file} |cut -f1)"
	echo " "
	echo "#######################################################"
	echo "First three lines"
	echo "-----------------"
	head -3 $file
	echo " "
	echo "-----------------"
	echo "Last three lines:"
	tail -3 $file
	echo "Number of sequences: $(grep -c "^" $file)"
done

