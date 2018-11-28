export namespace ares {

    function exec(el: any, script: string | Function): void

    interface Canvas {
        width: number
        height: number
    }

    class Context {
        constructor(platformContext: any)
        canvas: Canvas
        // State
        // save(): void
        // restore(): void
        // // Transformations
        // scale(x: number, y: number): void
        // rotate(angle: number): void
        // translate(x: number, y: number): void
        // transform(a: number, b: number, c: number, d: number, e: number, f: number): void
        // setTransform(a: number, b: number, c: number, d: number, e: number, f: number): void
        // // Compositing
        // globalAlpha: number
        // globalCompositeOperation: string
        // // Colors and styles
        // strokeStyle: string
        fillStyle: string
        fillRect(x: number, y: number, w: number, h: number): void
        // createLinearGradient(x0, y0, x1, y1): void
        // addColorStop(pos, color): void
        // createRadialGradient(x0, y0, r0, x1, y1, r1): void
        // addColorStop(pos, color): void
        // createPattern(image, repetition): void
    }

    class Ticker {
        constructor(callback: () => void)
        readonly timestamp: number
    }

}

