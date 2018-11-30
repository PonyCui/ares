/**
 * A sample for drawing circle.
 * @param {*} ctx
 */

main = function (context) {

// add a new path
context.beginPath();
context.moveTo (75,130);                // make (75,130) the current point
context.lineTo (145,75);                // line from (75,130) to (145,75)
context.arc (75,75,70,0,Math.PI,true);  // draw half circle disk with center (75,75), radius 70 and counterclockwise
context.lineTo (75,130);                // line from (5,70) to (75,130)
context.lineWidth = 3.0;                // set the line width for the stroke drawing
context.strokeStyle = 'red';         // set the line color for the stroke drawing
context.stroke();                       // draw the shape

// determine the position of two points
var answer1 = context.isPointInPath (25,100);    // answer1 is now either true or false
var answer2 = context.isPointInPath (100,25);    // answer2 is also either true or false

if (answer1) {
    context.fillStyle = 'red'
    context.fillRect(88, 88, 44, 44)
}
else {
    context.fillStyle = 'yellow'
    context.fillRect(88, 88, 44, 44)
}


    return {
        fillColor: function (color) {
//            ctx.fillStyle = color
//            ctx.fillRect(88, 88, 44, 44)
        }
    }

}
