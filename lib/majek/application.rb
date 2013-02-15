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
      content = markdown.gsub(MATCH_TITLE, '')

      tp = MdInc::TextProcessor.new
      tp.root(@base_dir)
      content = tp.process(content)

      # TODO make variables configurable
      jekyll_vars = {
        :layout => 'post',
        :title => title,
        :date  => Time.now,
        :comments => 'true',
        :categories => nil
      }
      page = JekyllPage.new(content, jekyll_vars)
      puts page.render
    end
  end
end
