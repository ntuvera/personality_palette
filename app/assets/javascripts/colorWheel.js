window.onload=function(){

  var ColorPicker = function (defaultColor, colorScale) {
      var self = this;
      var rainbow = ["#FF0000", "#FFA500", "#FFFF00", "#00FF00", "#0000FF", "#800080"];
      colorScale = colorScale || rainbow;
      var color = function (i) {
        return colorScale[i];
      };
      defaultColor = "#808080"
      var pickedColor = "#000";

      self.pickedColor = defaultColor;
      self.picked = function (color) {};
      var clicked = function () {
        self.picked(self.pickedColor);
      };

      var pie = d3.layout.pie().sort(null);
      var arc = d3.svg.arc().innerRadius(79).outerRadius(79);
      var newarc = d3.svg.arc().innerRadius(79).outerRadius(115);

      var svg = d3.select(".color-box")
        .append("svg")
        .attr("width", 300)
        .attr("height", 310)
        .append("g")
        .attr("transform", "translate(150,150)");

      var wheel = svg.datum([1, 1, 1, 1, 1, 1])
        .selectAll("path")
        .data(pie)
        .enter()
        .append("path")
        .attr("fill", function (d, i) {
          return color(i);
        })
        //.attr("stroke", "#fff")
        //.attr("stroke-width", 4)
        .attr("d", arc)
        .on("mouseover", function () {
          var fill = d3.select(this).attr("fill");
          self.pickedColor = fill;
          plate.attr("fill", self.pickedColor)  // see if duration/transformation is possible here
        })
        .on("click", function() {
          wheel.transition()
            .duration(200)
            .attr("d", arc);
        });

    var status = 0;

    var plate = svg.append("rect")
        .attr("fill", defaultColor)
        //.attr("r", 75)
        .attr("x", -75)
        .attr("y", -75)
        .attr("height", 150)
        .attr("width", 150)
        .attr("rx",100)
        .attr("ry",100)
        // .attr("stroke","black")
        .on("mouseover", function() {
            wheel.transition()
            .ease("elastic")
            .duration(800)
            .attr("d", newarc);
          })
          .on("click", function() {
            // var emotions = ["Angry", "Afraid", "Surprised", "Happy", "Sad", "Disgusted"]

            if (self.pickedColor == "#FF0000"){
              var pickedEmotion = "Angry";
              var pickedEmotionNo = 1
            }
            else if (self.pickedColor == "#FFA500"){
              var pickedEmotion = "Afraid";
              var pickedEmotionNo = 2
            }
            else if (self.pickedColor == "#FFFF00"){
              var pickedEmotion = "Surprised";
              var pickedEmotionNo = 3
            }
            else if (self.pickedColor == "#00FF00"){
              var pickedEmotion = "Happy";
              var pickedEmotionNo = 4
            }
            else if (self.pickedColor == "#0000FF"){
              var pickedEmotion = "Sad";
              var pickedEmotionNo = 5
            }
            else if(self.pickedColor == "#800080"){
              var pickedEmotion = "Disgusted"
              var pickedEmotionNo = 6
            }
            else{
              var pickedEmotion = "Neutral";
              var pickedEmotionNo = 0  // add validation for choosing an emotion
            }
            $('#plate').remove()
            // $('.color-box').append($('<div>').attr('id','plate'));
            // $('#plate').text("");
            // $('#plate').text(pickedEmotion);
            $("#color-to-emotion").val(pickedEmotion);
            $('#emo_num').val(pickedEmotionNo);


          });

  };

  var picker = new ColorPicker("#00DB00");
  picker.picked = function (color) {
      alert(color);
  };
}
