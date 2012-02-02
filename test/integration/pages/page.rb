class Page

  attr_accessor :page

  def initialize(page)
    @page = page
  end

  def success_notice
    page.find("#notice > .alert.alert-success")
  end

  def error_notice
    page.find("#notice > .alert.alert-error")
  end
end
