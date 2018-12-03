/**
 * A sample for drawing circle.
 * @param {*} ctx
 */

main = function (context) {

    context.strokeStyle = 'red';
    context.fillStyle = 'red';
    context.lineWidth = 2.0;              // double of the default lineWidth
    context.font = '50px monospace';
    context.strokeText ("Hello world!", 0, 50);
    context.strokeText ("This is a longer string that is limited to 750 pixel.", 0, 100, 750);
//    context.fillRect(0,0,22,44)

    return {
        fillColor: function (color) {
//            ctx.fillStyle = color
//            ctx.fillRect(88, 88, 44, 44)
        }
    }

}
