var sum = 0;
for (var i = 0; i < 1000; i++) {
	var mymap = {
		one: 1 + i,
		two: 2 + i,
		three: 3 * i,
		four: [i, 2, 3]
	}
	JSON.stringify(mymap)
	sum += i
}

console.log(sum)
