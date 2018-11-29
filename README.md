# Ares - Open Source

Ares is a light-weight library, draw elements with [Canvas API](http://bucephalus.org/text/CanvasHandbook/CanvasHandbook.html) on iOS, Android, Web natively.

The ares repository is where Ares is developed and there are many ways you can participate in the project, for example:

* Submit bugs and feature requests and help us verify as they are checked in.
* Review source code changes.
* Review the documentation and make pull requests for anything from typos to new content.

## Contributing

If you are interested in fixing issues and contributing directly to the code base, please see the document How to Contribute and our [Code of Conduct](./CODE_OF_CONDUCT.md).

### Web Developer

Please install NodeJS first.

1. Download source `git glone https://github.com/PonyCui/ares.git`.
2. Install dependencies `cd ares && npm i`.
3. Use http-server create a local server, you may need to run `npm i http-server -g` first, and then run `http-server -c-1`.
4. Open browser, go to `http://localhost:port/examples/web/index.html` for debugging.
5. Edit `/web/*.ts` files as you want.
6. Run `npm run build:web` update dist files.

### iOS Developer

You need to install Xcode first.

1. Download source `git glone https://github.com/PonyCui/ares.git`.
2. Use Xcode open `/ios/ares.xcodeproj`.
3. Edit codes and build as you want.

### Android Developer

You need to install Android Studio *3.0+* first.

1. Download source `git glone https://github.com/PonyCui/ares.git`.
2. Use Xcode open `/android`.
3. Edit codes and build as you want.

## License

Copyright (c) Pony Cui. All rights reserved.

Licensed under the MIT License.