module MessagesHelper
  #returns HTML from input text using Gihub flavoures markdown
  def markdown_to_html(text)
    Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
