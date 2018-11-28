"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Context = /** @class */ (function () {
    function Context(canvasContext) {
        this.canvasContext = canvasContext;
        this.canvas = canvasContext.canvas;
    }
    Object.defineProperty(Context.prototype, "fillStyle", {
        set: function (value) {
            this.canvasContext.fillStyle = value;
        },
        enumerable: true,
        configurable: true
    });
    Context.prototype.fillRect = function (x, y, w, h) {
        this.canvasContext.fillRect(x, y, w, h);
    };
    return Context;
}());
exports.Context = Context;
exports.exec = function (canvasContext, executor, resolver, rejector) {
    var ctx = new Context(canvasContext);
    if (typeof executor === "function") {
        try {
            resolver && resolver(executor(ctx) || {});
        }
        catch (error) {
            rejector && rejector(error);
        }
    }
    else if (typeof executor === "string") {
        var request_1 = new XMLHttpRequest();
        request_1.open("GET", executor, true);
        request_1.addEventListener("loadend", function () {
            try {
                var main = undefined;
                eval(request_1.responseText);
                if (typeof main === "function") {
                    resolver && resolver(main(ctx) || {});
                }
                else {
                    throw Error("main function not found.");
                }
            }
            catch (error) {
                rejector && rejector(error);
            }
        });
        request_1.send();
    }
};
