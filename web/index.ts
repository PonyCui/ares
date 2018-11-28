export class Context {

    readonly canvas: { width: number, height: number }

    constructor(readonly canvasContext: CanvasRenderingContext2D) {
        this.canvas = canvasContext.canvas
    }

    public set fillStyle(value: string) {
        this.canvasContext.fillStyle = value
    }

    fillRect(x: number, y: number, w: number, h: number): void {
        this.canvasContext.fillRect(x, y, w, h)
    }

}

export const exec = (
    canvasContext: CanvasRenderingContext2D,
    executor: string | Function,
    resolver: (handler: any) => void,
    rejector: (error: Error | undefined) => void) => {
    const ctx = new Context(canvasContext);
    if (typeof executor === "function") {
        try {
            resolver && resolver(executor(ctx) || {})
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
                    resolver && resolver(main(ctx) || {})
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