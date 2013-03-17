module Majek
  class Application
    MATCH_TITLE = %r{^# (.+)$}

    def initialize(argv)
      if argv.empty?
        @markdown = STDIN.read
        @base_dir = nil
      else
        filename = argv.first
        @markdown = File.read(filename)
        @base_dir = File.dirname(File.expand_path(filename))
      end
    end

    def run
      match = @markdown.match(MATCH_TITLE)
      title = match ? match[1] : 'New Post'
      content = @markdown.sub(MATCH_TITLE, '').sub(/\n*/, '')

      tp = MdInc::TextProcessor.new(:base_dir => @base_dir)
      content = tp.process(content)

      # TODO make variables configurable
      page = JekyllPage.new content, :layout => 'post', :title => "\"#{title}\""
      puts page.render
    end
  end

  class MarkdownProcessor
    MATCH_TITLE = %r{^# (.+)$}
    DEFAULT_TITLE = 'New Post'

    def post_title(text)
      if md = text.match(MATCH_TITLE)
        md[1]
      else
        DEFAULT_TITLE
      end
    end

    def post_content(text)
      text.sub(MATCH_TITLE, '').sub(/\n*/, '')
    end

    def process(text)
      title = post_title(text)
      content = post_content(text)
      # TODO make variables configurable
      vars = { :layout => 'post', :title => "\"#{title}\"" }
      page = JekyllPage.new(content, vars)
      page.render
    end
  end
end
