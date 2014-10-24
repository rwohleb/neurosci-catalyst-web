#
# Allows rendering blocks of content using markdown.
#
# Example:
#
# {% markdown %}
# [Stack Overflow](http://www.stackoverflow.com)
# {% endmarkdown %}
#
# 
# Alternatives:
#
# Doesn't require a plugin.
# {{ page.excerpt | markdownify }}
#
module Jekyll
  class MarkdownBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end
    require "kramdown"
    def render(context)
      content = super
      "#{Kramdown::Document.new(content).to_html}"
    end
  end
end

Liquid::Template.register_tag('markdown', Jekyll::MarkdownBlock)
