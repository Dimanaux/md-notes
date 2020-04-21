class PdfNote < ApplicationDecorator
  delegate_all

  def filename
    "#{object.author.username}-#{object.slug}.pdf"
  end

  def content
    @content ||= PdfNote.pdf_engine.pdf_from_string(title + object.content)
  end

  def self.pdf_engine
    @pdf_engine ||= WickedPdf.new
  end
end
