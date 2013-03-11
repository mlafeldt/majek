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

      tp = MdInc::TextProcessor.new
      tp.root(@base_dir) unless @base_dir.nil?
      content = tp.process(content)

      # TODO make variables configurable
      page = JekyllPage.new content, :layout => 'post', :title => "\"#{title}\""
      puts page.render
    end
  end
end
