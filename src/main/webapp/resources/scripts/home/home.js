function detailRest(id) {
	window.location.href = "/restaurant/"+ id;
}

$(function() {

	/* =======================  Pagination ================== */
	restaurants = {};
	currentPage = 1;
	var check = true;
	var keyword = "";

	$('#btnsearch').on("click", function(e) {

		e.preventDefault();

		check = true;
		keyword = $('#keyword').val();
		
		window.location.href ="/restaurant/q="+keyword;

		//course.courses(currentPage, keyword);
	});

	restaurants.getRestypes = function(currentPage, keyword) {
		
		$("#loader").show();
		
		if (keyword == undefined) {
			keyword = "";
		}
		$.ajax({
			url : "/rest/restype?keyword="+keyword+"&page="+currentPage+"&limit=20",
			type : 'GET',
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept",
						"application/json");
				xhr.setRequestHeader("Content-Type",
						"application/json");
			},
			success : function(data) {
				
				$("#loader").hide();
				
				if (data.STATUS != false) {
					console.log(data);
					$("#getRest").empty();
					$("#rest_tmpl").tmpl(data.DATA).appendTo(
							"#getRest");
					$('#getRest').css("cursor", "pointer");
					if (check) {
						restaurants.setPagination(
								data.PAGINATION.TOTAL_PAGES,
								currentPage);
						check = false;
					}
					$("#pagination").show()
				} else {
					$("#pagination").hide();
					$("#getRest").empty();
				}
			}
		});
	};

	restaurants.setPagination = function(totalPage, currentPage) {

		$('#pagination').bootpag({
			total : totalPage,
			page : currentPage,
			maxVisible : 10,
			leaps : true,
			firstLastUse : true,
			first : '←',
			last : '→',
			wrapClass : 'pagination',
			activeClass : 'active',
			disabledClass : 'disabled',
			nextClass : 'next',
			prevClass : 'prev',
			lastClass : 'last',
			firstClass : 'first'
		}).on("page", function(event, currentPage) {
			check = false;
			restaurants.getRestypes(currentPage);

		});

		$('#pagination .bootpag li').addClass("page-item");
		$('#pagination .bootpag li a').addClass("page-link");

	};

	restaurants.getRestypes(currentPage, "");

	// constructs the suggestion engine
	var substringMatcher = function(strs) {
		return function findMatches(q, cb) {
			var matches, substringRegex;

			// an array that will be populated with substring matches
			matches = [];

			// regex used to determine if a string contains the substring `q`
			substrRegex = new RegExp(q, 'i');

			// iterate through the pool of strings and for any string that
			// contains the substring `q`, add it to the `matches` array
			$.each(strs, function(i, str) {
				if (substrRegex.test(str)) {
					matches.push(str);
				}
			});

			cb(matches);
		};
	};

	var states;

	var bestPictures = new Bloodhound(
		{
			datumTokenizer : Bloodhound.tokenizers.obj
					.whitespace('value'),
			queryTokenizer : Bloodhound.tokenizers.whitespace,
			remote : {
				url : "/rest/restaurant/search?keyword=%QUERY%"+ "&page=" + currentPage + "&limit=20",
				//url: 'http://yourhost_ip/foo_autocomplete?query=%QUERY',
				wildcard : '%QUERY%',
				filter : function(restaurants) {
					// Map the remote source JSON array to a JavaScript array
					return $.map(restaurants.DATA, function(restaurant) {
						return {
							value : restaurant.rest_name
						};
					});
				}
			}
		});

	$('#remote .typeahead').typeahead(null, {
		name : 'best-pictures',
		display : 'value',
		source : bestPictures
	});

});