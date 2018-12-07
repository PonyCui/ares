"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exec = function (canvas, executor, resolver, rejector) {
    var handler = {};
    try {
        Object.defineProperty(canvas, "width", {
            configurable: true,
            get: function () {
                return parseInt(this.getAttribute("width"));
            },
            set: function (value) {
                this.setAttribute("width", value.toString());
                handler.onResize && handler.onResize();
            }
        });
        Object.defineProperty(canvas, "height", {
            configurable: true,
            get: function () {
                return parseInt(this.getAttribute("height"));
            },
            set: function (value) {
                this.setAttribute("height", value.toString());
                handler.onResize && handler.onResize();
            }
        });
    }
    catch (error) {
        console.error(error);
    }
    if (typeof executor === "function") {
        try {
            handler = executor(canvas.getContext('2d')) || {};
            resolver && resolver(handler);
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
                handler = main(canvas.getContext('2d') || {});
                if (typeof main === "function") {
                    resolver && resolver(handler);
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
