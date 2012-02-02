(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  describe("Backbone::View", function() {
    beforeEach(function() {
      var MyView;
      loadFixtures("form.html");
      MyView = (function(_super) {

        __extends(MyView, _super);

        function MyView() {
          MyView.__super__.constructor.apply(this, arguments);
        }

        MyView.prototype.el = "#form-fixture";

        return MyView;

      })(Backbone.View);
      return this.view = (new MyView).render();
    });
    return it("should serialize form values", function() {
      var values;
      values = this.view.serializeForm();
      expect(values.string).toBe("Lorem ipsum");
      return expect(values.text).toBe("Lorem ipsum dolor amet...");
    });
  });

}).call(this);
