/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    context.fillStyle = 'red';
    context.fillRect(0, 0, 60, 60);
    // 2. set the globalCompositeOperation
    context.globalCompositeOperation = "lighter";
    // 3. add the cyan circle
    context.fillStyle = 'yellow';
    // context.beginPath()
    context.arc(54, 54, 36, 0, 2 * Math.PI, false);
    
    context.fill();

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
