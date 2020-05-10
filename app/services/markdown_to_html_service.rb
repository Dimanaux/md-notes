class MarkdownToHtmlService
  def self.render(markdown)
    markdown_engine.render(markdown)
  end

  def self.markdown_engine
    @markdown_engine ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML, fenced_code_blocks: true
    )
  end
end
