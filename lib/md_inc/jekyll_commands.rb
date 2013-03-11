# Add Jekyll commands to MdInc.
module MdInc
  module Commands
    class << self
      def jekyll_tag(name, attrs=[], lines=[])
        output = []
        output << "{% #{([name] + attrs).join(" ")} %}"
        unless lines.empty?
          output += lines
          output << "{% end#{name} %}"
        end
        output
      end

      # Public: Jekyll command to include code that should be highlighted from
      # a file.
      #
      # path     - Path to the file to be included.
      # language - Language identifier
      #
      # Examples
      #
      #   .highlight 'snippets/stub-spec.rb', 'ruby'
      #   # =>
      #   # {% highlight ruby %}
      #   # contents of snippets/stub-spec.rb
      #   # {% endhighlight %}
      #
      # Returns the Jekyll tag as a String Array.
      def highlight(path, language)
        jekyll_tag(:highlight, [language], inc(path))
      end
    end
  end
end
