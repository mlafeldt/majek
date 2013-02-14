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
      jekyll_body = markdown.gsub(MATCH_TITLE, '')
      jekyll_header = %Q(---
layout: post
title: "#{title}"
date: #{Time.now}
comments: true
categories:
---)
      tp = MdInc::TextProcessor.new
      tp.root(@base_dir)
      puts tp.process(jekyll_header + jekyll_body)
    end
  end
end
