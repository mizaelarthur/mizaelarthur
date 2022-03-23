#!/bin/bash

awk -F: '{if ($7 ~ "sh"){print $1}}' /etc/passwd

