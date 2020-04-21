class HtmlNote < ApplicationDecorator
  delegate_all

  MARKDOWN_ENGINE = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML, fenced_code_blocks: true
  )

  def title
    "<h1>#{object.title}</h1>"
  end

  def content
    @content ||= MARKDOWN_ENGINE.render(object.content)
  end
end
