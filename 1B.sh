#!/bin/bash
awk -F: '{print $3 " " $1}' /etc/passwd >> dados.txt
cat dados.txt | perl -e 'foreach $Line (<STDIN>) 
{ @Cols=($Line=~/^\s*(\d+)\s*(.*?)\s*$/); push(@{$Link{$Cols[0]}}, $Cols[1]); } 
foreach $List (values %Link) 
{ print join("\t", @{$List})."\n"; }'