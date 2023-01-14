{
	ip1 = gensub("\.[a-z0-9]+$","","g",$3);
	ip2 = gensub("\.[a-z0-9:]+$","","g",$5); 
	direction = $4

	print ip1, direction, ip2
}

