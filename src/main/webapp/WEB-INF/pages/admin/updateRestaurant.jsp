<section class="add_restaurant"  ng-controller="restCtrl">
	<h2>Add Restaurant</h2>
	<br />
	<form name="frmAddRest" id="frmAddRest">
	<div class="row">
		<div class="col-md-12">
			
			<div class="panel panel-primary" data-collapsed="0">
			
				<div class="panel-heading">
					<div class="panel-title">
						Fill Restaurant Information
					</div>
					
					<div class="panel-options">
						<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
						<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
						<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
						<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<!--  ======== Form Add Restaurant ============= -->
				
					<div class="col-md-5">
						<div class="form-group">
							<label for="rest_name">Restaurant Name</label>
							<input type="text" class="form-control" name="rest_name" ng-model="rest_name" required>
						</div>
						<div class="form-group">
							<label for="rest_name">Restaurant Name Khmer</label>
							<input type="text" class="form-control" name="rest_name_kh" ng-model="rest_name_kh" required>
						</div>
						<div class="form-group">
							<label for="restype_id">Restaurant Category(Allow only 3 Categories)</label>
				        	<!-- <pre>Model value: {{data_Restypes}}</pre> -->
       						<multiselect ng-model="data_Restypes" options="dataRestypes" 
		       						display-prop="restype_name" id-prop="restype_id"
		                     		selection-limit="3">
		                     </multiselect>
						 </div>
						<div class="form-group">
							<label for="rest_name">Restaurant Menu</label>
							<input type="file" class="form-control file2 btn btn-orange"
							 multiple="1" data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> 
							 &nbsp;Browse Files" style="left: -8.75px; top: -1.5px;"  name="menu" id="menu" required>
						</div>
						<!-- =================   image thumbnail  ======================= -->
						
						<script type="text/javascript">
		jQuery(document).ready(function($)
		{
			$(".gallery-env").on("click", ".image-thumb .image-options a.delete", function(ev)
			{
				ev.preventDefault();
				
				
				var $image = $(this).closest('[data-tag]');
					
				var t = new TimelineLite({
					onComplete: function()
					{
						$image.slideUp(function()
						{
							$image.remove();
						});
					}
				});
				
				$image.addClass('no-animation');
				
				t.append( TweenMax.to($image, .2, {css: {scale: 0.95}}) );
				t.append( TweenMax.to($image, .5, {css: {autoAlpha: 0, transform: "translateX(100px) scale(.95)"}}) );
				
			}).on("click", ".image-thumb .image-options a.edit", function(ev)
			{
				ev.preventDefault();
				
				// This will open sample modal
				$("#album-image-options").modal('show');
				
				// Sample Crop Instance
				var image_to_crop = $("#album-image-options img"),
					img_load = new Image();
				
				img_load.src = image_to_crop.attr('src');
				img_load.onload = function()
				{
					if(image_to_crop.data('loaded'))
						return false;
						
					image_to_crop.data('loaded', true);
					
					image_to_crop.Jcrop({
						//boxWidth: $("#album-image-options").outerWidth(),
						boxWidth: 580,
						boxHeight: 385,
						onSelect: function(cords)
						{
							// you can use these vars to save cropping of the image coordinates
							var h = cords.h,
								w = cords.w,
								
								x1 = cords.x,
								x2 = cords.x2,
								
								y1 = cords.w,
								y2 = cords.y2;
							
						}
					}, function()
					{
						var jcrop = this;
						
						jcrop.animateTo([600, 400, 100, 150]);
					});
				}
			});
			
			
			// Sample Filtering
			var all_items = $("div[data-tag]"),
				categories_links = $(".image-categories a");
			
			categories_links.click(function(ev)
			{
				ev.preventDefault();
				
				var $this = $(this),
					filter = $this.data('filter');
				
				categories_links.removeClass('active');
				$this.addClass('active');
				
				all_items.addClass('not-in-filter').filter('[data-tag="' + filter + '"]').removeClass('not-in-filter');
				
				if(filter == 'all' || filter == '*')
				{
					all_items.removeClass('not-in-filter');
					return;
				}
			});
			
		});
		</script>
		
		<div class="gallery-env">
		
			<div class="row">
			
				<div class="col-sm-4 col-xs-4" data-tag="1d">
					
					<article class="image-thumb">
						
						<a href="#" class="image">
							<img src="${pageContext.request.contextPath}/resources/assets/images/album-image-1.jpg" />
						</a>
						
						<div class="image-options">
							<a href="#" class="edit"><i class="entypo-pencil"></i></a>
							<a href="#" class="delete"><i class="entypo-cancel"></i></a>
						</div>
						
					</article>
				
				</div>
			
				<div class="col-sm-4 col-xs-4" data-tag="3d">
					
					<article class="image-thumb">
						
						<a href="#" class="image">
							<img src="${pageContext.request.contextPath}/resources/assets/images/album-image-1.jpg" />
						</a>
						
						<div class="image-options">
							<a href="#" class="edit"><i class="entypo-pencil"></i></a>
							<a href="#" class="delete"><i class="entypo-cancel"></i></a>
						</div>
						
					</article>
				
				</div>
			
				<div class="col-sm-4 col-xs-4" data-tag="3d">
					
					<article class="image-thumb">
						
						<a href="#" class="image">
							<img src="${pageContext.request.contextPath}/resources/assets/images/album-image-1.jpg" />
						</a>
						
						<div class="image-options">
							<a href="#" class="edit"><i class="entypo-pencil"></i></a>
							<a href="#" class="delete"><i class="entypo-cancel"></i></a>
						</div>
						
					</article>
				
				</div>
	
			</div>
		
		</div>
		
						
	
	<!-- Album Cover Settings Modal -->
<div class="modal fade" id="album-image-options">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-body">
			
					
						<div class="row">
							<div class="col-md-12">
								
								<div class="form-group">
									<label for="field-1" class="control-label">Title</label>
									
									<input type="text" class="form-control" id="field-1" placeholder="Enter image title">
								</div>	
								
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								
								<div class="form-group">
									<label for="field-1" class="control-label">Description</label>
									
									<textarea class="form-control autogrow" id="field-2" placeholder="Enter image description" style="min-height: 80px;"></textarea>
								</div>	
								
							</div>
						</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-success btn-icon">
					<i class="entypo-check"></i>
					Apply Changes
				</button>
			</div>
		</div>
	</div>
</div>

	<!--  ============== modal image option ================= -->			
						
						<div class="form-group">
							<label for="contact">Contact</label>
							<input type="text" class="form-control" name="contact" ng-model="contact" required>
						</div>
						<div class="form-group">
							<label for="about">About</label>
							<input type="text" class="form-control" name="about" ng-model="about" required>
						</div>
						<div class="form-group">
							<label for="open_close">Open - Close</label>
							<!-- <select class="form-control">
									<option>6:00 AM - 8:00 PM</option>
									<option>6:00 AM - 8:00 PM</option>
									<option>6:00 AM - 8:00 PM</option>
								</select> -->
							<input type="text" name="open_close" class="form-control" ng-model="open_close" placeholder="6:00 AM - 8:00 PM"/>
						</div>
					</div> 
					<div class="col-md-5">
						<div class="form-group">
							<div class="form-group">
							<label for="open_close">Street Number</label>
							<input type="text" class="form-control" name="street" ng-model="street" required>
							</div>
							<div class="form-group">
								<label for="open_close">Commune / Sangkat</label>
								<input type="text" class="form-control" name="communce" ng-model="communce" required>
							</div>
							<div class="form-group">
								<label for="open_close">District / Khan</label>
								<input type="text" class="form-control" name="district" ng-model="district" required>
							</div>
							<div class="form-group">
								<label for="open_close">City / Province</label>
								<input type="text" class="form-control" name="province" ng-model="province" required>
							</div>
							<div class="form-group">
								<label for="location">Location</label>
								<input type="text" class="form-control" name="location" ng-model="location"" required>
							</div>
							<br>
							<a href="${pageContext.request.contextPath}/admin/restaurant" target="_self"">
							<button type="button" class="btn btn-blue btn-block"
							 ng-disabled="commentInfo.first_name.$invalid || brandInfo.last_name.$invalid || 
							 brandInfo.rest_name.$invalid || brandInfo.comment.$invalid"
							  ng-click="addRestaurant($event)" data-dismiss="modal">
								<i class="fa fa-floppy-o"> Add Restaurant</i></button></a>
						</div>
					   </div> 
					
				</div><!-- ==============  end Panel ===================== -->
			</div>
		</div><!-- ==============  end col-md-12 ===================== -->
	</div><!-- ==============  end row ===================== -->
</form>
</section>
	
	
	
	
	