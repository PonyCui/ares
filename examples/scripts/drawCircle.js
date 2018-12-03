/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    context.strokeStyle = 'red';        // explicitly sets the text color to (default) 'black'
    var text = "This is some text.";
    context.font = '30px Arial';
    context.textBaseline = "middle"
    context.fillText(text, 0, 667);

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
