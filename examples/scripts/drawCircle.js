/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (ctx) {

    ctx.fillStyle = "yellow"
    ctx.fillRect(0, 0, ctx.canvas.width - 10, 44)

    return {
        onResize: function () {
            main(ctx)
        }
    }

}
