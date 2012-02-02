describe "Backbone::View", ->

  beforeEach ->
    loadFixtures "form.html"
    class MyView extends Backbone.View
      el: "#form-fixture"
    @view = (new MyView).render()

  it "should serialize form values", ->
    values = @view.serializeForm()
    expect(values.string).toBe("Lorem ipsum")
    expect(values.text).toBe("Lorem ipsum dolor amet...")
