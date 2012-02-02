describe "Ticket", ->

  beforeEach ->
    @ticket = new Mercury.Models.Ticket( comment: "It's shiny." )

  it "should accept valid attributes", ->
    expect(@ticket.validate( comment: "It's shiny." )).toBeUndefined()

  it "should validate the presence of a comment", ->
    expect(@ticket.validate( comment: "  " )).toBeDefined()

  it "should validate the length of a comment", ->
    expect(@ticket.validate( comment: [0..65536].join() )).toBeDefined()
