function projectData(){
  var height = function(d, i){ return 400 };
  var width = 940;

  var svg = d3.select("#emotion-wheel").append("svg")
                .attr('height', height)
                .attr('width', width)
                .append('g')
                // .attr('transform', 'translate(30, 30)');
  var circles = svg.selectAll("circle")
                    .data(data)
                    .enter()
                    .append("circle")
                      .attr("r", 45)
                      .attr("cx", function(d, i){ return (i* (960/data.length)) + 60})
                      .attr("cy", function(d, i){ return 60 })
                      .attr("fill", function(d, i){ return "url(#myGradient"+i+")" })
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

setTimeout(function(){
  projectData();
  updateAll(data);
}, 2000);
