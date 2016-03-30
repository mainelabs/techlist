module ApplicationHelper
  def markdown(markdown_text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    @markdown.render(markdown_text).html_safe if markdown_text
  end

  def title(page_title)
    content_for(:title, page_title)
  end
end
