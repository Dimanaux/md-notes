class HtmlToPdfService
  def self.render(html)
    pdf_engine.pdf_from_string(html)
  end

  def self.pdf_engine
    @pdf_engine ||= WickedPdf.new
  end
end
