/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (ctx) {

    // ctx.globalAlpha = 0.5
//    ctx.strokeStyle = "red"
//    ctx.lineWidth = 3
//    ctx.strokeRect(44, 44, 44, 44)
     ctx.fillStyle = "red"
     ctx.fillRect(44, 44, 44, 44)
    // ctx.clearRect(44, 44, 22, 22)

    return {
        fillColor: function (color) {
            ctx.fillStyle = color
            ctx.fillRect(88, 88, 44, 44)
        }
    }

}
