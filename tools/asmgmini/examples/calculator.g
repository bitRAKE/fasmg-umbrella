total = 0
payment = 28'600
display 'Payment',9,'Total',13,10
repeat 30
	total = total + payment
	repeat 1,N:payment,T:total
		display `N,9,`T,13,10
	end repeat
	; 5% increase, rounded up
	payment = (payment * 105)/100
end repeat
