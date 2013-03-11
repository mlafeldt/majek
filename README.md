Majek
=====

Majek is a preprocessor for Jekyll blog posts that helps you to concentrate on
writing. It allows you to include other files from your Markdown (thanks to
[md_inc]) and produce posts in Jekyll format.

Majek is especially helpful when you're writing Markdown with a tool like
[iA Writer] that is more about prose and less about code. Instead of including
bulky code snippets directly in your Markdown file, you simply insert short
commands like `.inc 'foo.txt'` or `.highlight 'bar.rb', 'ruby'`, which will then
be expanded by Majek.


Installation
------------

You can install Majek via RubyGems:

    $ gem install majek

Alternatively, you can install the gem from source:

    $ git clone git://github.com/mlafeldt/majek.git
    $ cd majek/
    $ bundle install
    $ bundle exec rake install


Usage
-----

    usage: majek [<markdown file>]

Simply pass Majek a Markdown file and it will do the following (if the file is
absent, Majek reads from the standard input):

- read the contents of the Markdown file
- process the text with md_inc which provides commands to include other text
  files, code snippets, and much more (see Commands)
- add Jekyll's YAML front matter with post layout and post title (will be
  configurable in the future)
- output the final text to screen


Commands
--------

Majek provides all commands that come with md_inc as well as some additional
commands for Jekyll and Octopress:

### md_inc

- `.inc path`
- `.code_inc path [,language]`

Read the documentation of [md_inc] to learn more.

### Jekyll

- `.highlight path, language`

### Octopress

- `.blockquote path [,attributes...]`
- `.codeblock path [,attributes...]`
- `.pullquote path [,attributes...]`
- `.gist [attributes...]`
- `.img [attributes...]`
- `.include_code [attributes...]`
- `.jsfiddle [attributes...]`
- `.render_partial [attributes...]`
- `.video [attributes...]`


Examples
--------

Given a standard Markdown file like this:

```
$ cat month_of_coderwall_protips.md
# One Month of Coderwall Protips

On 1 January 2013, I signed up on [Coderwall](https://coderwall.com/) -- a place
for developers to share tips and connect with one another. I've been ...
```

Majek will produce text that is ready to be fed into Jekyll:

```
$ majek one_month_of_coderwall_protips.md
---
layout: post
title: "One Month of Coderwall Protips"
---

On 1 January 2013, I signed up on [Coderwall](https://coderwall.com/) -- a place
for developers to share tips and connect with one another. I've been ...
```

The second example shows one of the Octopress commands in action:

```
By stubbing out Chef's `include_recipe` method before the converge, Chef will
not include any recipes during the test run:

.codeblock 'snippets/stub-spec.rb', 'lang:ruby'

This requires a bit of symlink trickery to work though.
```

The result will include the Ruby code from the specified file (Jekyll stuff
stripped for brevity):

```
By stubbing out Chef's `include_recipe` method before the converge, Chef will
not include any recipes during the test run:

{% codeblock lang:ruby %}
require 'chefspec'

describe 'The recipe foo::default' do
  let (:chef_run) do
    Chef::Recipe.any_instance.stub(:include_recipe)
    ChefSpec::ChefRunner.new.converge 'foo::default'
  end
  # ...
end
{% endcodeblock %}

This requires a bit of symlink trickery to work though.
```


License
-------

Majek is licensed under the terms of the MIT License. See [LICENSE] file.


Contact
-------

* Web: <http://mlafeldt.github.com/majek>
* Mail: <mathias.lafeldt@gmail.com>
* Twitter: [@mlafeldt](https://twitter.com/mlafeldt)


[LICENSE]: https://github.com/mlafeldt/majek/blob/master/LICENSE
[iA Writer]: http://www.iawriter.com/
[md_inc]: https://github.com/russolsen/md_inc
