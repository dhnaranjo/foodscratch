$	->
	for category in ['income', 'rent', 'hh', 'vitals', 'bills']
		window[category] = $ String('.' + category + ' li')
		key.addEventListener("click", buttonClickHandler, false) for key in window[category]

buttonClickHandler = (eventInfo) ->
	this.style.backgroundColor = 'gray'
	for category in [income, rent, hh, vitals, bills]
		category[$.inArray(this, category)] = [category[$.inArray(this, category)], yes]
	gridEval()

gridEval = (input) ->
	for category in [income, rent, hh]
		category.count = 0 if @?
		for key, index in category
			if key[1] is yes
				category.first = index if @?
				category.count++
		
		if category.count is 1
			category.value = category[category.first][0].innerHTML.replace(/[^0-9]/gi, '')
		console.log(category)
