# Sublime-Snippeter

This Project is snippet generator for Sublime Text2.

ex. input

~~~ ruby
# encoding: utf-8
require_relative "./snippeter"

add :hoge, :param1, :param2
~~~

ex. output

~~~ xml
<snippet>
  <content><![CDATA[
hoge ${1:param1}, ${2:param1}
]]></content>
  <tabTrigger>hoge</tabTrigger>
  <scope>source.ruby</scope>
  <description>hoge method</description>
</snippet>
~~~

## Feature
* Simple snippet.
* Main use target is DSL that you make.

## Usage
* git clone, this project
* Edit Snippet.rb
* run command, "ruby se.rb"
* output snippets in %PROJECT_ROOT%/snippeets
* copy %PROJECT_ROOT%/lib/snippeets to Sublime Text Package/User directory

## Directory Tree

~~~
│  se.rb # => DSL executor
│  Snippet.rb # => DSL description
│  snippetter.rb # =>DSL engine
│  template # => snippet template
│
└─snippets # => output folder
       hoge.sublime-snippet # => output file
~~~

## Snippet Sample

~~~ ruby
# encoding: utf-8
require_relative "./snippeter"

add :hoge, :param1, :param2
add :hage, :param1
add :hige
~~~

## Output Sample

~~~ xml
<snippet>
  <content><![CDATA[
hoge ${1:param1}, ${2:param1}
]]></content>
  <tabTrigger>hoge</tabTrigger>
  <scope>source.ruby</scope>
  <description>hoge method</description>
</snippet>
~~~

## Notice

I am not good at English.
