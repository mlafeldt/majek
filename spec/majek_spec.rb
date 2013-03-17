require 'majek'

describe Majek::MarkdownProcessor do
  subject { Majek::MarkdownProcessor.new }
  let (:frontmatter) { "---\nlayout: post\ntitle: \"New Post\"\n---\n" }

  it 'adds the YAML front matter with post layout and title' do
    text = ''
    subject.process(text).should == "#{frontmatter}\n#{text}"
  end

  it 'includes the text as-is' do
    text = "aaa\nbbb\nccc"
    subject.process(text).should == "#{frontmatter}\n#{text}"
  end

  it 'extracts the post title from the markdown' do
    frontmatter = "---\nlayout: post\ntitle: \"Learning Chef\"\n---\n"
    text = "# Learning Chef\nOhai!"
    subject.process(text).should == "#{frontmatter}\nOhai!"
  end

  it 'removes the post title and trailing empty lines from markdown' do
    frontmatter = "---\nlayout: post\ntitle: \"Learning Chef\"\n---\n"
    text = "# Learning Chef\n\n\n\n\nOhai!"
    subject.process(text).should == "#{frontmatter}\nOhai!"
  end
end
