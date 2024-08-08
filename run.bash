#!/usr/bin/env bash

set -euo pipefail

for filename in *.tengo; do
	testcase="${filename%.*}"

	echo -n "${testcase}		"
	tengo_time=$( (time ./tengo "${testcase}.tengo") 2>&1 > /dev/null | grep "real" | cut -f 2)
	echo -n "tengo: ${tengo_time}		"
	risor_time=$( (time ./risor "${testcase}.risor") 2>&1 > /dev/null | grep "real" | cut -f 2)
	echo "risor: ${risor_time}"
done
