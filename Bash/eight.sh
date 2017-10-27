# !/bin/sh
# CHALLENGE: Rename all files in a directory to be lowercase in a single command

for i in ./script-resources/uppercase-files/*; do mv $i `echo $i | tr [:upper:] [:lower:]`; done
