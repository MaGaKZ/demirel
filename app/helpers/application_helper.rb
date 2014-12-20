module ApplicationHelper
  def javascript(*files)
  content_for(:head) { javascript_include_tag(*files) }
  end
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Suleyman Demirel College"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end