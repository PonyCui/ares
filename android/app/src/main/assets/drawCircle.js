/**
 * A sample for drawing circle.
 * @param {*} ctx
 */

main = function (context) {

    context.fillStyle = 'red';
      context.font = '40px Arial';
      // set the shadow color to a visible 'orange' and the x- and y-offset to 15
      context.shadowColor = 'yellow';
      context.shadowOffsetX = 15;
      context.shadowOffsetY = 15;
      // #1
      context.shadowBlur = 0;
      context.fillText ("#1",  50, 50);
      // #2
      context.shadowBlur = 2;
      context.fillText ("#2", 200, 50);
      // #3
      context.shadowBlur = 4;
      context.fillText ("#3", 350, 50);
      // #4
      context.shadowBlur = 8;
      context.fillText ("#4", 500, 50);

    return {
        fillColor: function (color) {
//            ctx.fillStyle = color
//            ctx.fillRect(88, 88, 44, 44)
        }
    }

}
