(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.ares = f()}})(function(){var define,module,exports;return (function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
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

},{}]},{},[1])(1)
});
