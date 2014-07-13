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

updateAll([
    ['0%', 'silver'],
    ['15%', 'red'],
    ['30%', 'orange'],
    ['45%', 'yellow'],
    ['60%', 'green'],
    ['75%', 'blue'],
    ['90%', 'purple']
]);
