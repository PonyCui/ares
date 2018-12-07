/**
 * A sample for drawing circle.
 * @param {*} ctx 
 */

main = function (context) {

    var horseImage = new Image();
    horseImage.src = 'grayhorse.jpg';
    horseImage.onload = function () {
        // create a CanvasPattern object with this image and make that the new fillStyle value
        var horsePattern = context.createPattern(horseImage, 'repeat');
        context.fillStyle = horsePattern;
        context.lineWidth = 10
        // Now draw same objects: first a rectangle
        context.fillRect(0, 0, 200, 210);
        // then a triangle
        context.beginPath();
        context.moveTo(220, 0);
        context.lineTo(220, 100);
        context.lineTo(550, 50);
        context.lineTo(220, 0);
        context.fill();
        context.closePath();
        // and finally write "Hello!" 
        context.font = '120px sans-serif';
        context.fillText('Hello!', 210, 200);
    }

    return {
        onResize: function () {
            // main(ctx)
        }
    }

}
