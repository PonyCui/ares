/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (ctx) {
    
    ctx.fillStyle = "red"
    ctx.fillRect(44, 44, 44, 44)

    return {
        fillColor: function (color) {
            ctx.fillStyle = color
            ctx.fillRect(44, 44, 44, 44)
        }
    }

}
