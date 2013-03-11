module Majek
  class Application
    MATCH_TITLE = %r{^# (.+)$}

    def initialize(argv)
      @filename = argv.first
      @base_dir = File.dirname(File.expand_path(@filename))
    end

    def run
      markdown = File.read(@filename)
      title = markdown.match(MATCH_TITLE)[1]
      content = markdown.sub(MATCH_TITLE, '').sub(/\n*/, '')

      tp = MdInc::TextProcessor.new
      tp.root(@base_dir)
      content = tp.process(content)

      # TODO make variables configurable
      page = JekyllPage.new content, :layout => 'post', :title => "\"#{title}\""
      puts page.render
    end
  end
end
