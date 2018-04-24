module ApplicationHelper
  def browser_title(page_title)
    content_for(:browser_title) { page_title }
  end
end
