Majek
=====

Tool to convert Markdown to Jekyll post format


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

    usage: majek <markdown file>

Simply pass Majek a Markdown file and it will do the following:

- read the contents of the Markdown file
- process the text with [md_inc] which provides commands to include other text
  files (`.inc`) and code (`.code_inc`) and more
- process the text using custom md_inc commands for [Octopress], see below
- add a [Jekyll] header with title, date, categories, etc. (will be configurable
  in the future)
- output the final text to screen

In addition to the default commands of md_inc, Majek provides the following
Octopress-specific commands:

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
date: 2013-02-14 11:01:09 +0100
comments: true
categories:
---

On 1 January 2013, I signed up on [Coderwall](https://coderwall.com/) -- a place
for developers to share tips and connect with one another. I've been ...
```

The second example shows one of the Octopress commands:

```
By stubbing out Chef's `include_recipe` method before the converge, Chef will
not include any recipes during the test run:

.codeblock 'snippets/stub-spec.rb', 'ruby'

This requires a bit of symlink trickery to work though.
```

The result will include the Ruby code from the specified file (Jekyll stuff
stripped for brevity):

```
By stubbing out Chef's `include_recipe` method before the converge, Chef will
not include any recipes during the test run:

{% codeblock ruby %}
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


[Jekyll]: https://github.com/mojombo/jekyll
[LICENSE]: https://github.com/mlafeldt/majek/blob/master/LICENSE
[Octopress]: http://octopress.org/
[md_inc]: https://github.com/russolsen/md_inc
