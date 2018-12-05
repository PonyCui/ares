/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    var image = new Image();               // 1. create the image: (a). create an image object
    image.src = "horse.jpg";               //                      (b). set it to the jpg file
    image.onload = function () {
        context.drawImage(image, 150, 40, 130, 120, 75, 100, 200, 150);
    }

    // return {
    //     fillColor: function (color) {
    //         ctx.fillStyle = color
    //         ctx.fillRect(88, 88, 44, 44)
    //     }
    // }

}
