describe "Mercury.Models.Errors", ->

  beforeEach ->
    @errors = new Mercury.Models.Errors
      foo: ["error 1", "error 2"]
      bar: ["error 3"]

  describe ".on()", ->

    it "should provide errors on individual attributes", ->
      expect(@errors.on("foo")).toBe("error 1, error 2")
      expect(@errors.on("bar")).toBe("error 3")

    it "should be undefined when there are no errors", ->
      expect(@errors.on("baz")).toBeUndefined()

  describe ".getSummary()", ->

    it "should return a string representation of all errors", ->
      expect(@errors.getSummary()).toBe("foo error 1, error 2; bar error 3")
