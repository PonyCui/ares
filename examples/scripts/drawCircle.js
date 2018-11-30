/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    // add a new path
    // context.beginPath();
    // context.moveTo (75,130);                // make (75,130) the current point
    // context.lineTo (145,75);                // line from (75,130) to (145,75)
    // context.arc (75,75,70,0,Math.PI,true);  // draw half circle disk with center (75,75), radius 70 and counterclockwise
    // context.lineTo (75,130);                // line from (5,70) to (75,130)
    context.lineWidth = 3.0;                // set the line width for the stroke drawing
    context.strokeStyle = 'red';         // set the line color for the stroke drawing
    context.beginPath();
    context.moveTo(60, 120);
    context.lineTo(150, 30)
    context.lineTo(240, 120)
    context.stroke();
    context.beginPath();
    context.moveTo(150, 30);
    context.lineTo(150, 30 + 50 + 120)
    context.stroke();
    context.beginPath();
    context.moveTo(60, 120);
    context.arcTo(150, 30, 240, 120, 120);  // different values for radius 
    context.stroke();

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
