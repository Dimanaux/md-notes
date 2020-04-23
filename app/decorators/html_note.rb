class HtmlNote < ApplicationDecorator
  delegate_all

  def title
    "<h1>#{object.title}</h1>"
  end

  def content
    @content ||= MarkdownToHtmlService.render(object.content)
  end
end
