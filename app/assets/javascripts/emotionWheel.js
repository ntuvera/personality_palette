function updateStops(data) {
  var stops = d3.select('#myGradient').selectAll('stop')
      .data(data);

  stops.enter().append('stop');

  stops
      .attr('offset', function(d) { return d[0]; })
      .attr('stop-color', function(d) { return d[1]; });

  stops.exit().remove();
}



function updateAll(data) {
  updateStops(data);

}

// updateAll(data);


setTimeout(function() {updateAll(data)}, 10);


// window.onload=function(){ updateAll(data)}
