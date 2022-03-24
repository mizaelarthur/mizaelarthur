#!/bin/bash

awk -F: '{if ($7 ~ "sh"){print $1 " " $7}}' /etc/passwd

