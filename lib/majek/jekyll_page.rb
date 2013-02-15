module Majek
  class JekyllPage
    def initialize(content, vars=nil)
      @content = content
      @vars = vars || Hash.new
    end

    def content
      @content
    end

    def front_matter
      ['---', @vars.map { |k, v| "#{k}: #{v}" }, '---'].join("\n")
    end

    def render
      [front_matter, content].join("\n")
    end
  end
end
