(function() {

  describe("String extensions", function() {
    return describe(".teaser()", function() {
      it("should remove extra whitespace", function() {
        return expect(" it was the    worst of times  ".teaser()).toBe("it was the worst of times");
      });
      it("should return the desired number of words", function() {
        return expect("it was the worst of times".teaser(4)).toBe("it was the worst ...");
      });
      return it("should truncate if there are too many characters", function() {
        return expect("it's supercalifragilisticexpialadocious".teaser(2)).toBe("it's supercalifr...");
      });
    });
  });

}).call(this);
