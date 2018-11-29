export class Context {

    readonly canvas: { width: number, height: number }

    constructor(readonly canvasContext: CanvasRenderingContext2D) {
        this.canvas = canvasContext.canvas
    }

    // Compositing

    public get globalAlpha(): number {
        return this.canvasContext.globalAlpha
    }

    public set globalAlpha(value: number) {
        this.canvasContext.globalAlpha = value
    }

    // Colors and styles

    public get fillStyle(): string {
        if (typeof this.canvasContext.fillStyle === "string") {
            return this.canvasContext.fillStyle
        }
        return ""
    }

    public set fillStyle(value: string) {
        this.canvasContext.fillStyle = value
    }

    public get strokeStyle(): string {
        if (typeof this.canvasContext.strokeStyle === "string") {
            return this.canvasContext.strokeStyle
        }
        return ""
    }

    public set strokeStyle(value: string) {
        this.canvasContext.strokeStyle = value
    }

    // Line caps and joins

    public get lineWidth(): number {
        return this.canvasContext.lineWidth
    }

    public set lineWidth(value: number) {
        this.canvasContext.lineWidth = value
    }

    public get lineCap(): any {
        return this.canvasContext.lineCap
    }

    public set lineCap(value: any) {
        this.canvasContext.lineCap = value
    }

    public get lineJoin(): any {
        return this.canvasContext.lineJoin
    }

    public set lineJoin(value: any) {
        this.canvasContext.lineJoin = value
    }

    public get miterLimit(): number {
        return this.canvasContext.miterLimit
    }

    public set miterLimit(value: number) {
        this.canvasContext.miterLimit = value
    }

    // Simple shapes (rectangles)

    fillRect(x: number, y: number, w: number, h: number): void {
        this.canvasContext.fillRect(x, y, w, h)
    }

    strokeRect(x: number, y: number, w: number, h: number): void {
        this.canvasContext.strokeRect(x, y, w, h)
    }

    clearRect(x: number, y: number, w: number, h: number): void {
        this.canvasContext.clearRect(x, y, w, h)
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