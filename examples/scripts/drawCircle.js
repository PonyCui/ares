/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    context.font = '28px Arial';
    context.fillStyle = 'red';
    // shadow settings
    context.shadowColor = 'yellow';
    context.shadowBlur = 5;
    context.shadowOffsetX = 0;
    context.shadowOffsetY = 0;
    // add the text
    context.fillText("shadow: blur 5, color blue, x- and y-offset 0", 20, 50);

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
