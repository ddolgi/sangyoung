#!/usr/bin/python3
import sys
import ujson

obj = {}
for line in sys.stdin: 
	tokens = line.strip().split('\t')
	if tokens[0]=="0":
		obj[tokens[0]]={"url":tokens[2]}
	else:
		obj[tokens[0]]={"date":tokens[1]}

print(ujson.dumps(obj))
