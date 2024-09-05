#!/usr/bin/env bash

set -euo pipefail

# install binaries in the current directory
GOBIN=$(pwd)

# install goja (javascript interpreter)
go install github.com/dop251/goja/goja@latest
# install risor (does not work because they use replace directives in go.mod)
#go install github.com/risor-io/risor/cmd/risor@latest
# install tengo
go install github.com/d5/tengo/cmd/tengo@latest

# print the version or git commit for each binary
echo -n 'goja: '
go version -m ./goja | grep -E '\s+mod\s+' | cut -f 4
echo -n 'risor: '
go version -m ./risor | grep -F 'vcs.revision=' | cut -f3 | cut -d'=' -f2
echo -n 'tengo: '
go version -m ./tengo | grep -F 'vcs.revision=' | cut -f3 | cut -d'=' -f2
echo

for filename in *.tengo; do
	testcase="${filename%.*}"

	echo -n "${testcase}		"
	tengo_time=$( (time ./tengo "${testcase}.tengo") 2>&1 > /dev/null | grep "real" | cut -f 2)
	echo -n "tengo: ${tengo_time}		"
	risor_time=$( (time ./risor "${testcase}.risor") 2>&1 > /dev/null | grep "real" | cut -f 2)
	echo -n "risor: ${risor_time}		"
	goja_time=$( (time ./goja "${testcase}.js") 2>&1 > /dev/null | grep "real" | cut -f 2)
	echo -n "goja: ${goja_time}		"
	echo
done
