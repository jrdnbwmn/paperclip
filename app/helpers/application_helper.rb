module ApplicationHelper
  def browser_title(page_title)
    content_for(:browser_title) { page_title }
  end

  def active_class(link_path)
    current_page?(link_path) ? "link--highlighted" : ""
  end
end
