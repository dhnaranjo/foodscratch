$	->
	init()
	document.getElementById("calculate").addEventListener("click", calculate, false)
	document.getElementById("reset").addEventListener("click", init, false)
	document.getElementById("flip").addEventListener("click", flip, false)

init = () ->
	for category in ['income', 'rent', 'hh', 'vitals', 'bills']
		window[category] = $ String('.' + category + ' li')
		key.addEventListener("click", buttonClickHandler, false) for key in window[category]
		for each in window[category]
			$(each).addClass('colored')

flip = () ->
	document.getElementById("hey").classList.toggle("flip")
	# document.getElementById("hey").classList.toggle("flip")


buttonClickHandler = (eventInfo) ->
	$(this).removeClass('colored')
	for category in [income, rent, hh, vitals, bills]
		category[$.inArray(this, category)] = [category[$.inArray(this, category)], yes]
	

gridEval = (input) ->
	getValue = () ->
		parseInt(category[index][0].innerHTML.replace(/[^0-9]/gi, ''))
	for category in [income, rent, hh]
		category.count = 0
		category.first = null
		for key, index in category
			if key[1] is yes
				if category.first is null
					category.first = index
					category.firstvalue = getValue()
				category.last = index
				category.lastvalue = getValue()
				category.count++
		
		if category.count is 1
			category.value = category.firstvalue
		else if category.count > 3
			category.value = 'error'
		else if  category.last is category.first + (category.count - 1)
			category.value = (category.firstvalue + category.lastvalue)/2
		else
			category.value = 'error'

		console.log(category.value)

calculate = () ->
	gridEval()
	stdded = [155, 155, 155, 165, 193, 221, 221, 221]
	maxallot = [194, 357, 511, 649, 771, 925, 1022, 1169]
	hh.value = Math.ceil(hh.value)
	net = income.value * 0.8
	net -= stdded[hh.value-1]
	shelter = rent.value - net / 2
	switch true
		when bills[0][1] or bills[1][1] then shelter += 370
		when bills[2][1] and bills[3][1] then shelter += 280
		when bills[2][1] or bills[3][1] then shelter += 62
		else shelter += 32
	shelter = 490 if !(vitals[0][1] or vitals[1][1]) and shelter > 490
	shelter = 0 if shelter < 0
	net -= shelter
	net = 0 if net < 0
	benefit = maxallot[hh.value-1] - net * 0.3
	console.log(benefit)