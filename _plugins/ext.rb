require 'jekyll/scholar'
require 'uri'

module Jekyll
    class FootNoteTag < Liquid::Tag
  
      def initialize(tag_name, text, tokens)
        super
        @text = text.strip
      end
  
      def render(context)
        "<sup id='fnref-#{@text}' class='footnote-ref'><a href='#fn-#{@text}'>#{@text}</a></sup>"
      end
    end
  end
  
Liquid::Template.register_tag('fn', Jekyll::FootNoteTag)

module Jekyll
    module AssetFilter
      def fndetail(input, id)
        "<div class='footnotes'><p id='fn-#{id}'>#{id}. #{input}<a href='#fnref-#{id}' class='footnote footnotes'>↩</a></p></div>"
      end
    end
  end
  
Liquid::Template.register_filter(Jekyll::AssetFilter)
