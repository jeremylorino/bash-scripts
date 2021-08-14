const assert = require("assert");
const template = require("./stringTemplate");

describe("stringTemplate", function () {
    describe("Array", function () {
        it("should insert array values", function () {
            let result = template`${0}`("hey");
            assert.strictEqual(result, "hey");
            
            result = template`${0} ${0}`("hey");
            assert.strictEqual(result, "hey hey");
            
            result = template`${0} ${1}`("hey", "you");
            assert.strictEqual(result, "hey you");
        });
    });
});
