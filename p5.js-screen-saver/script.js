var sketch = function(s) {
  
  var rectWidth = 8;
  
  s.setup = function() {
    s.createCanvas(s.displayWidth, s.displayHeight);
    s.background(255);
  };
  
  s.draw = function() {
    s.background(255);
    for (var i = 0; i < s.width/rectWidth; i++) {
      if(s.random(0, 1) > 0.3) {
        s.fill(0);
        s.noStroke();
        s.rect(i*rectWidth, 0, rectWidth, s.height);
      }
    }
  };
};

var screenSaver = new p5(sketch, "canvas");