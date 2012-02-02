(function() {

  describe("Ticket", function() {
    beforeEach(function() {
      return this.ticket = new Mercury.Models.Ticket({
        comment: "It's shiny."
      });
    });
    it("should accept valid attributes", function() {
      return expect(this.ticket.validate({
        comment: "It's shiny."
      })).toBeUndefined();
    });
    it("should validate the presence of a comment", function() {
      return expect(this.ticket.validate({
        comment: "  "
      })).toBeDefined();
    });
    return it("should validate the length of a comment", function() {
      var _i, _results;
      return expect(this.ticket.validate({
        comment: (function() {
          _results = [];
          for (_i = 0; _i <= 65536; _i++){ _results.push(_i); }
          return _results;
        }).apply(this).join()
      })).toBeDefined();
    });
  });

}).call(this);
