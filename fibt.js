function fib(n, a, b) {
	if (n == 0) {
		return a;
	} else if (n == 1) {
		return b;
	}
	return fib(n-1, b, a+b);
}

fib(1000, 0, 1);
