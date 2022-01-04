module ApplicationHelper
  def markdown(text)
    options = %i[hard_wrap autolink no_intra_emphasis fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

  def title(text)
    content_for :title, text
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text = '')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end
end
