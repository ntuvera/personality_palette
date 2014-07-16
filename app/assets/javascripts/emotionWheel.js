function projectData(){
  var height = 200;
  var width = 940;

  var svg = d3.select("svg")
                .attr('height', height)
                .attr('width', width)
                .attr("class", "sixteen columns fadeable")
                .attr("id", "emotion-wheel-gradients")
                .append('g');
  var circles = svg.selectAll("circle")
                    .data(data)
                    .enter()
                    .append("circle")
                      .attr("r", 75)
                      .attr("cx", function(d, i){ return (i* (800/data.length)) + 80})
                      .attr("cy", function(d, i){ return 80 })
                      .attr("fill", function(d, i){ return "url(#myGradient"+i+")" });
}

function updateStops(data) {
  for (var i=0; i< data.length; i++){
    var stops = d3.select('#myGradient'+i).selectAll('stop')
        .data(data[i]);

    stops.enter().append('stop');

    stops.attr('offset', function(d) { return d[0]; })
         .attr('stop-color', function(d) { return d[1]; });

    stops.exit().remove();
  }
}

function updateAll(data) {
    updateStops(data);
}

