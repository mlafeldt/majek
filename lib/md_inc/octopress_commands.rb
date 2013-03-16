# Add Octopress commands to MdInc.
module MdInc
  module Commands
    # Public: Octopress command to include other files.
    #
    # path  - Path to the file to be included.
    # attrs - Array of attributes passed to the Octopress tag.
    #
    # Examples
    #
    #   .codeblock 'snippets/stub-spec.rb', 'lang:ruby'
    #   # =>
    #   # {% codeblock lang:ruby %}
    #   # contents of snippets/stub-spec.rb
    #   # {% endcodeblock %}
    #
    # Returns the Octopress tag as a String Array.
    %w(blockquote codeblock pullquote).each do |meth|
      define_method(meth) { |path, *attrs| jekyll_tag(meth, attrs, inc(path)) }
    end

    # Public: Octopress command that doesn't include anything; only added for
    # consistency and convenience.
    #
    # attrs - Array of attributes passed to the Octopress tag.
    #
    # Examples
    #
    #   .gist 1234
    #   # => {% gist 1234 %}
    #
    #   .img 'left', 'http://placekitten.com/320/250', 'Place Kitten #2'
    #   # => {% img left http://placekitten.com/320/250 Place Kitten #2 %}
    #
    # Returns the Octopress tag as a String Array.
    %w(gist img include_code jsfiddle render_partial video).each do |meth|
      define_method(meth) { |*attrs| jekyll_tag(meth, attrs) }
    end
  end
end
