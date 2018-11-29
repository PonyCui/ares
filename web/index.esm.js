"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var Context = /** @class */ (function () {
    function Context(canvasContext) {
        this.canvasContext = canvasContext;
        this.canvas = canvasContext.canvas;
    }
    Object.defineProperty(Context.prototype, "globalAlpha", {
        // Compositing
        get: function () {
            return this.canvasContext.globalAlpha;
        },
        set: function (value) {
            this.canvasContext.globalAlpha = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "fillStyle", {
        // Colors and styles
        get: function () {
            if (typeof this.canvasContext.fillStyle === "string") {
                return this.canvasContext.fillStyle;
            }
            return "";
        },
        set: function (value) {
            this.canvasContext.fillStyle = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "strokeStyle", {
        get: function () {
            if (typeof this.canvasContext.strokeStyle === "string") {
                return this.canvasContext.strokeStyle;
            }
            return "";
        },
        set: function (value) {
            this.canvasContext.strokeStyle = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "lineWidth", {
        // Line caps and joins
        get: function () {
            return this.canvasContext.lineWidth;
        },
        set: function (value) {
            this.canvasContext.lineWidth = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "lineCap", {
        get: function () {
            return this.canvasContext.lineCap;
        },
        set: function (value) {
            this.canvasContext.lineCap = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "lineJoin", {
        get: function () {
            return this.canvasContext.lineJoin;
        },
        set: function (value) {
            this.canvasContext.lineJoin = value;
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Context.prototype, "miterLimit", {
        get: function () {
            return this.canvasContext.miterLimit;
        },
        set: function (value) {
            this.canvasContext.miterLimit = value;
        },
        enumerable: true,
        configurable: true
    });
    // Simple shapes (rectangles)
    Context.prototype.fillRect = function (x, y, w, h) {
        this.canvasContext.fillRect(x, y, w, h);
    };
    Context.prototype.strokeRect = function (x, y, w, h) {
        this.canvasContext.strokeRect(x, y, w, h);
    };
    Context.prototype.clearRect = function (x, y, w, h) {
        this.canvasContext.clearRect(x, y, w, h);
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
