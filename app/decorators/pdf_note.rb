class PdfNote < ApplicationDecorator
  delegate_all

  def filename
    "#{object.author.username}-#{object.slug}.pdf"
  end

  def content
    @content ||= HtmlToPdfService.render(title + object.content)
  end
end
