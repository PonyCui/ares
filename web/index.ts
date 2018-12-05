export const exec = (
    canvasContext: CanvasRenderingContext2D,
    executor: string | Function,
    resolver: (handler: any) => void,
    rejector: (error: Error | undefined) => void) => {
    if (typeof executor === "function") {
        try {
            resolver && resolver(executor(canvasContext) || {})
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
                if (typeof main === "function") {
                    resolver && resolver(main(canvasContext) || {})
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