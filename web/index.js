(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.ares = f()}})(function(){var define,module,exports;return (function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
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
    // Complex shapes (paths)
    Context.prototype.beginPath = function () {
        this.canvasContext.beginPath();
    };
    Context.prototype.closePath = function () {
        this.canvasContext.closePath();
    };
    Context.prototype.stroke = function () {
        this.canvasContext.stroke();
    };
    Context.prototype.fill = function () {
        this.canvasContext.fill();
    };
    Context.prototype.lineTo = function (x, y) {
        this.canvasContext.lineTo(x, y);
    };
    Context.prototype.moveTo = function (x, y) {
        this.canvasContext.moveTo(x, y);
    };
    Context.prototype.rect = function (x, y, w, h) {
        this.canvasContext.rect(x, y, w, h);
    };
    Context.prototype.quadraticCurveTo = function (cpx, cpy, x, y) {
        this.canvasContext.quadraticCurveTo(cpx, cpy, x, y);
    };
    Context.prototype.bezierCurveTo = function (cp1x, cp1y, cp2x, cp2y, x, y) {
        this.canvasContext.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
    };
    Context.prototype.arc = function (x, y, r, start, end, anticlockwise) {
        this.canvasContext.arc(x, y, r, start, end, anticlockwise);
    };
    Context.prototype.arcTo = function (x1, y1, x2, y2, radius) {
        this.canvasContext.arcTo(x1, y1, x2, y2, radius);
    };
    Context.prototype.clip = function () {
        this.canvasContext.clip();
    };
    Context.prototype.isPointInPath = function (x, y) {
        return this.canvasContext.isPointInPath(x, y);
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

},{}]},{},[1])(1)
});
