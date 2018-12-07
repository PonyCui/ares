/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

function drawRect(context, i) {
    requestAnimationFrame(function () {
        i++
        context.clearRect(0, 0, context.canvas.width, context.canvas.height)
        context.fillRect(i, i, 44, 44)
        drawRect(context, i)
    })
}

main = function (context) {

    var i = 0;
    context.fillStyle = "red"
    drawRect(context, i);

    return {
        onResize: function () {
            // main(ctx)
        }
    }

}
