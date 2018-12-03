/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    // set both the strokeStyle and the fillStyle to black
    context.strokeStyle = 'red';
    context.fillStyle = 'red';
    // first line of text in the default font:
    context.strokeText(context.font, 10, 20);
    context.fillText(context.font, 350, 20);
    // second line of text:
    context.font = '20px fantasy';
    context.strokeText(context.font, 10, 40);
    context.fillText(context.font, 350, 40);
    // third line of text:
    context.font = '40px Verdana';
    context.strokeText(context.font, 10, 80);
    context.fillText(context.font, 350, 80);
    // fourth line of text:
    context.font = '60px Arial';
    context.strokeText(context.font, 10, 140);
    context.fillText(context.font, 350, 140);

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
