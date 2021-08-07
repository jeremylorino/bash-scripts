#!/bin/env node

const template = require("./stringTemplate");
const Colors = new Proxy(
    class {
        static COLOR_START = `\x1b[`;
        static COLOR_END = `m`;
        static COLOR_TEMPLATE = template([`${this.COLOR_START}`, `${this.COLOR_END}`], 0);

        static get colors() {
            const _colorBase = {
                Black: `0`,
                Red: `1`,
                Green: `2`,
                Yellow: `3`,
                Blue: `4`,
                Magenta: `5`,
                Cyan: `6`,
                White: `7`,
            };
            const colors = {
                Reset: this.COLOR_TEMPLATE(`0`),
                Stop: this.COLOR_TEMPLATE(`0`),
                Bright: this.COLOR_TEMPLATE(`1`),
                Bold: this.COLOR_TEMPLATE(`1`),
                Dim: this.COLOR_TEMPLATE(`2`),
                Underscore: this.COLOR_TEMPLATE(`4`),
                Underline: this.COLOR_TEMPLATE(`4`),
                Blink: this.COLOR_TEMPLATE(`5`),
                Reverse: this.COLOR_TEMPLATE(`7`),
                Hidden: this.COLOR_TEMPLATE(`8`),
                fg: {
                    Black: this.COLOR_TEMPLATE(`3${_colorBase.Black}`),
                    Red: this.COLOR_TEMPLATE(`3${_colorBase.Red}`),
                    Green: this.COLOR_TEMPLATE(`3${_colorBase.Green}`),
                    Yellow: this.COLOR_TEMPLATE(`3${_colorBase.Yellow}`),
                    Blue: this.COLOR_TEMPLATE(`3${_colorBase.Blue}`),
                    Magenta: this.COLOR_TEMPLATE(`3${_colorBase.Magenta}`),
                    Cyan: this.COLOR_TEMPLATE(`3${_colorBase.Cyan}`),
                    White: this.COLOR_TEMPLATE(`3${_colorBase.White}`),
                },
                bg: {
                    Black: this.COLOR_TEMPLATE(`4${_colorBase.Black}`),
                    Red: this.COLOR_TEMPLATE(`4${_colorBase.Red}`),
                    Green: this.COLOR_TEMPLATE(`4${_colorBase.Green}`),
                    Yellow: this.COLOR_TEMPLATE(`4${_colorBase.Yellow}`),
                    Blue: this.COLOR_TEMPLATE(`4${_colorBase.Blue}`),
                    Magenta: this.COLOR_TEMPLATE(`4${_colorBase.Magenta}`),
                    Cyan: this.COLOR_TEMPLATE(`4${_colorBase.Cyan}`),
                    White: this.COLOR_TEMPLATE(`4${_colorBase.White}`),
                },
            };

            colors.Black = colors.fg.Black;
            colors.Red = colors.fg.Red;
            colors.Green = colors.fg.Green;
            colors.Yellow = colors.fg.Yellow;
            colors.Blue = colors.fg.Blue;
            colors.Magenta = colors.fg.Magenta;
            colors.Cyan = colors.fg.Cyan;
            colors.White = colors.fg.White;

            return colors;
        }

        static colorize(...args) {
            return template(...args)(this);
        }
    },
    {
        get: (target, prop, receiver) => {
            if (Reflect.has(target, prop)) {
                return Reflect.get(target, prop);
            }
            if (Reflect.has(target.colors, prop)) {
                return Reflect.get(target.colors, prop, receiver);
            }
        },
    }
);
module.exports = Colors;

function main(args) {
    if (args.length === 0) {
        process.exit(0);
    }
    console.log(Colors[args]);
}

if (require.main === module) {
    main(process.argv.slice(2));
}
