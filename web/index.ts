export const exec = (
    canvas: HTMLCanvasElement,
    executor: string | Function,
    resolver: (handler: any) => void,
    rejector: (error: Error | undefined) => void) => {
    let handler: any = {}
    try {
        Object.defineProperty(canvas, "width", {
            configurable: true,
            get: function () {
                return parseInt(this.getAttribute("width"))
            },
            set: function (value) {
                this.setAttribute("width", value.toString())
                handler.onResize && handler.onResize()
            }
        })
        Object.defineProperty(canvas, "height", {
            configurable: true,
            get: function () {
                return parseInt(this.getAttribute("height"))
            },
            set: function (value) {
                this.setAttribute("height", value.toString())
                handler.onResize && handler.onResize()
            }
        })
    } catch (error) {
        console.error(error)
    }
    if (typeof executor === "function") {
        try {
            handler = executor(canvas.getContext('2d')) || {}
            resolver && resolver(handler)
        } catch (error) {
            rejector && rejector(error)
        }
    }
    else if (typeof executor === "string") {
        const request = new XMLHttpRequest()
        request.open("GET", executor, true)
        request.addEventListener("loadend", function () {
            try {
                let main: any = undefined
                eval(request.responseText)
                handler = main(canvas.getContext('2d') || {})
                if (typeof main === "function") {
                    resolver && resolver(handler)
                }
                else {
                    throw Error("main function not found.")
                }
            } catch (error) {
                rejector && rejector(error)
            }
        })
        request.send()
    }
}