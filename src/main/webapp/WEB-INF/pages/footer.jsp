<!-- ========= footer ============ -->
	<script src="${pageContext.request.contextPath}/resources/scripts/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/scripts/app.js"></script>
	<script>
		var app = angular.module("app", []);
		app.controller("mainCtrl", function($scope, $http){
			$scope.getRestype = function(){
				$http.get("${pageContext.request.contextPath}/rest/restype")
			    .then(function(response) {
			       $scope.restypes = response.data.DATA;
			       $scope.pages = response.data.PAGINATION;
			       $scope.totalPage = pages.TOTAL_PAGES;
			       $scope.limitPage = pages.LIMIT;
			       $scope.page = pages.PAGE;
			       $scope.totalCount = pages.TOTAL_COUNT;
			       $scopt.totalPage = pages.TOTAL_PAGES;
			       console.log(response);
			       console.log($scope.pages.PAGE);
			    });
			}
			$scope.getRestype();
		});
	</script>
</body>
</html>