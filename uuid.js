// Generated by LiveScript 1.6.0
(function(){
  var uuid;
  module.exports = uuid = function(){
    var retc, i$, len$, char;
    retc = "";
    for (i$ = 0, len$ = ("66c6e9a8-3093-462a-9c36-dbb052165822").length; i$ < len$; ++i$) {
      char = ("66c6e9a8-3093-462a-9c36-dbb052165822")[i$];
      retc += char !== "-" ? Math.floor(Math.random() * 16).toString(16) : "-";
    }
    return retc;
  };
}).call(this);
