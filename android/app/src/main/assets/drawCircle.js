/**
 * A sample for drawing circle.
 * @param {*} ctx
 */

main = function (ctx) {

    var sin = Math.sin(Math.PI/6);
      var cos = Math.cos(Math.PI/6);
      ctx.translate(100, 100);
      var c = 0;
      for (var i=0; i <= 12; i++) {
        c = Math.floor(255 / 12 * i);
        ctx.fillStyle = "red";
        ctx.fillRect(0, 0, 100, 10);
        ctx.transform(cos, sin, -sin, cos, 0, 0);
      }

      ctx.setTransform(-1, 0, 0, 1, 100, 100);
      ctx.fillStyle = "red";
      ctx.fillRect(0, 50, 100, 100);


    return {
        fillColor: function (color) {
//            ctx.fillStyle = color
//            ctx.fillRect(88, 88, 44, 44)
        }
    }

}
