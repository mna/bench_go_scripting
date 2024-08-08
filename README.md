# Benchmarks for Go scripting languages

I wanted to compare [risor](https://github.com/risor-io/risor) with [tengo](https://github.com/d5/tengo), two interesting Go-based scripting languages implemented with a stack-based, bytecode interpreter VM. They both seem fast enough for many scripting uses, the goal is not to discourage use of one or the other - execution speed is but one reason to use a language, and remember that those benchmarks cover tiny specific uses of the language.

To run the benchmarks on your machine, simply clone the repository and run `./run.bash`. You may need to tweak the `count_zeds` benchmark as it relies on the dictionary file found in "/usr/share/dict/words" on my machine.

Results on my old Lenovo T460 laptop (tengo @c461a7f, risor @b83ab51, August 2024):

```
$ ./run.bash
count_zeds		tengo: 0m0.253s		risor: 0m0.241s
fib			tengo: 0m3.037s		risor: 0m4.889s
fibt		tengo:		0m0.004s		risor: 0m0.015s
json		tengo:		0m0.008s		risor: 0m0.017s
```
