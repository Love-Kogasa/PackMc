// Generated by LiveScript 1.6.0
(function(){
  var fs, image, out$ = typeof exports != 'undefined' && exports || this;
  fs = require('fs');
  out$.image = image = function(it){
    return fs.readFileSync(it);
  };
}).call(this);
