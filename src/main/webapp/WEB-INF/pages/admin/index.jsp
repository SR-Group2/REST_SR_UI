		
<div class="row">
	<div class="col-sm-3">
	
		<div class="tile-progress tile-primary">
			
			<div class="tile-header">
				<h3>Visitors</h3>
				<span>so far in our blog, and our website.</span>
			</div>
			
			<div class="tile-progressbar">
				<span data-fill="65.5%"></span>
			</div>
			
			<div class="tile-footer">
				<h4>
					<span class="pct-counter">0</span>% increase
				</h4>
				
				<span>so far in our blog and our website</span>
			</div>
		</div>
	
	</div>
	
	<div class="col-sm-3">
	
		<div class="tile-progress tile-red">
			
			<div class="tile-header">
				<h3>Visitors</h3>
				<span>so far in our blog, and our website.</span>
			</div>
			
			<div class="tile-progressbar">
				<span data-fill="23.2%"></span>
			</div>
			
			<div class="tile-footer">
				<h4>
					<span class="pct-counter">0</span>% increase
				</h4>
				
				<span>so far in our blog and our website</span>
			</div>
		</div>
	
	</div>
	
	<div class="col-sm-3">
	
		<div class="tile-progress tile-blue">
			
			<div class="tile-header">
				<h3>Visitors</h3>
				<span>so far in our blog, and our website.</span>
			</div>
			
			<div class="tile-progressbar">
				<span data-fill="78%"></span>
			</div>
			
			<div class="tile-footer">
				<h4>
					<span class="pct-counter">0</span>% increase
				</h4>
				
				<span>so far in our blog and our website</span>
			</div>
		</div>
	
	</div>
	
	<div class="col-sm-3">
	
		<div class="tile-progress tile-aqua">
			
			<div class="tile-header">
				<h3>Visitors</h3>
				<span>so far in our blog, and our website.</span>
			</div>
			
			<div class="tile-progressbar">
				<span data-fill="22%"></span>
			</div>
			
			<div class="tile-footer">
				<h4>
					<span class="pct-counter">0</span>% increase
				</h4>
				
				<span>so far in our blog and our website</span>
			</div>
		</div>
	
	</div>
</div>
<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="tile-stats tile-white stat-tile">
					<h3>15% more</h3>
					<p>Monthly visitor statistics</p>
					<span class="daily-visitors"></span>
				</div>		
			</div>
		
			<div class="col-md-3 col-sm-6">
				<div class="tile-stats tile-white stat-tile">
					<h3>32 Sales</h3>
					<p>Avg. Sales per day</p>
					<span class="monthly-sales"></span>
				</div>		
			</div>
		
		
			<div class="col-md-3 col-sm-6">
				<div class="tile-stats tile-white stat-tile">
					<h3>-0.0102</h3>
					<p>Stock Market</p>
					<span class="stock-market"></span>
				</div>		
			</div>
		
		
			<div class="col-md-3 col-sm-6">
				<div class="tile-stats tile-white stat-tile">
					<h3>61.5%</h3>
					<p>US Dollar Share</p>
					<span class="pie-chart"></span>
				</div>		
			</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-md-9">
				
				<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						var map = $("#map-2");
						
						map.vectorMap({
							map: 'europe_merc_en',
							zoomMin: '3',
							backgroundColor: '#f4f4f4',
							focusOn: { x: 0.5, y: 0.7, scale: 3 },
						    markers: [
						      {latLng: [50.942, 6.972], name: 'Cologne'},
						      {latLng: [42.6683, 21.164], name: 'Prishtina'},
						      {latLng: [41.3861, 2.173], name: 'Barcelona'},
						    ],
						    markerStyle: {
						      initial: {
						        fill: '#ff4e50',
						        stroke: '#ff4e50',
							    "stroke-width": 6,
							    "stroke-opacity": 0.3,
		    				      }
						    },	
							regionStyle: 
								{
								  initial: {
								    fill: '#e9e9e9',
								    "fill-opacity": 1,
								    stroke: 'none',
								    "stroke-width": 0,
								    "stroke-opacity": 1
								  },
								  hover: {
								    "fill-opacity": 0.8
								  },
								  selected: {
								    fill: 'yellow'
								  },
								  selectedHover: {
								  }
								}					
						});
					});
				</script>
				
				<div class="tile-group tile-group-2">
					<div class="tile-left tile-white">
						<div class="tile-entry">
							<h3>Visitor Map</h3>
							<span>Where do our visitors come from</span>
						</div>
						<ul class="country-list">
							<li><span class="badge badge-secondary">3</span>  Cologne, Germany</li>
							<li><span class="badge badge-secondary">2</span>  Pristina, Kosovo</li>
							<li><span class="badge badge-secondary">1</span>  Barcelona, Spain</li>
						</ul>
					</div>
					
					<div class="tile-right">
						
						<div id="map-2" class="map"></div>
						
					</div>
					
				</div>
				
			</div>
		
		
		
			<div class="col-md-3">
				<div class="tile-stats tile-neon-red">
					<div class="icon"><i class="entypo-chat"></i></div>
					<div class="num" data-start="0" data-end="124" data-postfix="" data-duration="1400" data-delay="0">0</div>
					
					<h3>Comments</h3>
					<p>New comments today</p>
				</div>	
				
				<br />
				
				<div class="tile-stats tile-primary">
					<div class="icon"><i class="entypo-users"></i></div>
					<div class="num" data-start="0" data-end="213" data-postfix="" data-duration="1400" data-delay="0">0</div>
					
					<h3>New Followers</h3>
					<p>Statistics this week</p>
				</div>	
				
					
			</div>
		</div>
		
		<br />
		
		<div class="row">
			<div class="col-sm-8">
				<div class="panel panel-primary panel-table">
					<div class="panel-heading">
						<div class="panel-title">
							<h3>Top Grossing</h3>
							<span>Weekly statistics from AppStore</span>
						</div>
						
						<div class="panel-options">
							<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
							<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
							<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
							<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
						</div>
					</div>
					<div class="panel-body">	
						<table class="table table-responsive">
							<thead>
								<tr>
									<th>App Name</th>
									<th>Download</th>
									<th class="text-center">Graph</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>Flappy Bird</td>
									<td>2,215,215</td>
									<td class="text-center"><span class="top-apps">4,3,5,4,5,6,3,2,5,3</span></td>
								</tr>
								
								<tr>
									<td>Angry Birds</td>
									<td>1,001,001</td>
									<td class="text-center"><span class="top-apps">3,2,5,4,3,6,7,5,7,9</span></td>
								</tr>
								
								<tr>
									<td>Asphalt 8</td>
									<td>998,003</td>
									<td class="text-center"><span class="top-apps">1,3,4,3,5,4,3,6,9,8</span></td>
								</tr>
			
								
								<tr>
									<td>Viber</td>
									<td>512,015</td>
									<td class="text-center"><span class="top-apps">9,2,5,7,2,4,6,7,2,6</span></td>
								</tr>
			
								
								<tr>
									<td>Whatsapp</td>
									<td>504,135</td>
									<td class="text-center"><span class="top-apps">1,4,5,4,4,3,2,5,4,3</span></td>
								</tr>
			
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
			<div class="col-sm-4">
				<div class="panel panel-primary panel-table">
					<div class="panel-heading">
						<div class="panel-title">
							<h3>Events</h3>
							<span>This month's event calendar</span>
						</div>
						
						<div class="panel-options">
							<a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
							<a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
							<a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
							<a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
						</div>
					</div>
					<div class="panel-body">
						<div id="calendar" class="calendar-widget">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer class="main">
			
			&copy; 2014 <strong>Neon</strong> Admin Theme by <a href="http://laborator.co" target="_blank">Laborator</a>
		
		</footer>
	</div>

		
	<div id="chat" class="fixed" data-current-user="Art Ramadani" data-order-by-status="1" data-max-chat-history="25">
	
		<div class="chat-inner">
	
	
			<h2 class="chat-header">
				<a href="#" class="chat-close"><i class="entypo-cancel"></i></a>
	
				<i class="entypo-users"></i>
				Chat
				<span class="badge badge-success is-hidden">0</span>
			</h2>
	
	
			<div class="chat-group" id="group-1">
				<strong>Favorites</strong>
	
				<a href="#" id="sample-user-123" data-conversation-history="#sample_history"><span class="user-status is-online"></span> <em>Catherine J. Watkins</em></a>
				<a href="#"><span class="user-status is-online"></span> <em>Nicholas R. Walker</em></a>
				<a href="#"><span class="user-status is-busy"></span> <em>Susan J. Best</em></a>
				<a href="#"><span class="user-status is-offline"></span> <em>Brandon S. Young</em></a>
				<a href="#"><span class="user-status is-idle"></span> <em>Fernando G. Olson</em></a>
			</div>
	
	
			<div class="chat-group" id="group-2">
				<strong>Work</strong>
	
				<a href="#"><span class="user-status is-offline"></span> <em>Robert J. Garcia</em></a>
				<a href="#" data-conversation-history="#sample_history_2"><span class="user-status is-offline"></span> <em>Daniel A. Pena</em></a>
				<a href="#"><span class="user-status is-busy"></span> <em>Rodrigo E. Lozano</em></a>
			</div>
	
	
			<div class="chat-group" id="group-3">
				<strong>Social</strong>
	
				<a href="#"><span class="user-status is-busy"></span> <em>Velma G. Pearson</em></a>
				<a href="#"><span class="user-status is-offline"></span> <em>Margaret R. Dedmon</em></a>
				<a href="#"><span class="user-status is-online"></span> <em>Kathleen M. Canales</em></a>
				<a href="#"><span class="user-status is-offline"></span> <em>Tracy J. Rodriguez</em></a>
			</div>
	
		</div>
	
		<!-- conversation template -->
		<div class="chat-conversation">
	
			<div class="conversation-header">
				<a href="#" class="conversation-close"><i class="entypo-cancel"></i></a>
	
				<span class="user-status"></span>
				<span class="display-name"></span>
				<small></small>
			</div>
	
			<ul class="conversation-body">
			</ul>
	
			<div class="chat-textarea">
				<textarea class="form-control autogrow" placeholder="Type your message"></textarea>
			</div>
	
		</div>
	
	</div>
	
	
	<!-- Chat Histories -->
	<ul class="chat-history" id="sample_history">
		<li>
			<span class="user">Art Ramadani</span>
			<p>Are you here?</p>
			<span class="time">09:00</span>
		</li>
	
		<li class="opponent">
			<span class="user">Catherine J. Watkins</span>
			<p>This message is pre-queued.</p>
			<span class="time">09:25</span>
		</li>
	
		<li class="opponent">
			<span class="user">Catherine J. Watkins</span>
			<p>Whohoo!</p>
			<span class="time">09:26</span>
		</li>
	
		<li class="opponent unread">
			<span class="user">Catherine J. Watkins</span>
			<p>Do you like it?</p>
			<span class="time">09:27</span>
		</li>
	</ul>
	
	
	
	
	<!-- Chat Histories -->
	<ul class="chat-history" id="sample_history_2">
		<li class="opponent unread">
			<span class="user">Daniel A. Pena</span>
			<p>I am going out.</p>
			<span class="time">08:21</span>
		</li>
	
		<li class="opponent unread">
			<span class="user">Daniel A. Pena</span>
			<p>Call me when you see this message.</p>
			<span class="time">08:27</span>
		</li>
	</ul>

	
</div>

