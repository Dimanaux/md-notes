class HtmlNote < ApplicationDecorator
  delegate_all

  def title
    "<h1>#{object.title}</h1>"
  end

  def content
    @content ||= HtmlNote.markdown_engine.render(object.content)
  end

  def self.markdown_engine
    @markdown_engine ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML, fenced_code_blocks: true
    )
  end
end
