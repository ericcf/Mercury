require_relative "./page"

class TicketsIndex < Page

  def visit
    page.visit("/")
  end

  def comment
    page.find_field("comment").value
  end

  def comment=(value)
    page.find("form").fill_in "comment", with: value
  end

  def email=(value)
    page.find("form").fill_in "email", with: value
  end

  def submit
    page.find("form button[type=submit]").click
  end
end
