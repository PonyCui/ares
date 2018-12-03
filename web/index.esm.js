"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.exec = function (canvasContext, executor, resolver, rejector) {
    if (typeof executor === "function") {
        try {
            resolver && resolver(executor(canvasContext) || {});
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
                    resolver && resolver(main(canvasContext) || {});
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
