require "spec_helper"

module SnippeterSpec
  SNIPPET =<<EOS
# encoding: utf-8
require_relative "./snippetter"

add :hoge, :param1, :param2
add :hige
EOS

  describe "generate" do
    EXPECTED =<<EOS
<snippet>
  <content><![CDATA[
hoge ${1:param1}, ${2:param2}
]]></content>
  <tabTrigger>hoge</tabTrigger>
  <scope>source.ruby</scope>
  <description>hoge method</description>
</snippet>
EOS
    it 'generate' do
      require_relative "../lib/snippetter"
      add :hoge, :param1, :param2

      generate

      output = File.open("lib/snippets/hoge.sublime-snippet", "r") {|f|f.read}
      expect(output).to eq(EXPECTED)
    end
  end

end