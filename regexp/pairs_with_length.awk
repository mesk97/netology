function calc(pair, len) {
	if (pair in stats) {
		stats[pair] = stats[pair] + len
		count[pair] ++
	} else {
		count[pair] = 1
		stats[pair] = 0
	}
}

{
	ip1 = gensub("\.[a-z0-9]+$","","g",$3);
	ip2 = gensub("\.[a-z0-9:]+$","","g",$5); 
	direction = $4

	pair = ip1 direction ip2

        # Найти поле в котором длина
	i=1
	while ($i != "length") {
		i++
	}
	len = $(i+1)

	calc(pair, len)
}

END {
	print "Пара", "Переслано(Байт)", "Пакеты"
	for (pair in stats) {
		print pair, stats[pair], count[pair] 
	}	
}
