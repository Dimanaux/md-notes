class PdfNote < ApplicationDecorator
  delegate_all

  PDF_ENGINE = WickedPdf.new

  def filename
    "#{object.author.username}-#{object.slug}.pdf"
  end

  def content
    PDF_ENGINE.pdf_from_string(title + object.content)
  end
end
