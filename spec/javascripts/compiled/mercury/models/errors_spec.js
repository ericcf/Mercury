(function() {

  describe("Mercury.Models.Errors", function() {
    beforeEach(function() {
      return this.errors = new Mercury.Models.Errors({
        foo: ["error 1", "error 2"],
        bar: ["error 3"]
      });
    });
    describe(".on()", function() {
      it("should provide errors on individual attributes", function() {
        expect(this.errors.on("foo")).toBe("error 1, error 2");
        return expect(this.errors.on("bar")).toBe("error 3");
      });
      return it("should be undefined when there are no errors", function() {
        return expect(this.errors.on("baz")).toBeUndefined();
      });
    });
    return describe(".getSummary()", function() {
      return it("should return a string representation of all errors", function() {
        return expect(this.errors.getSummary()).toBe("foo error 1, error 2; bar error 3");
      });
    });
  });

}).call(this);
