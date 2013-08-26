# encoding: utf-8
if $*.size == 1 && $*[0] == "init"
  File::open("./Snippet.rb", "w") do |f|
    f.puts <<-EOS
# encoding: utf-8
require_relative "./snippeter"

# add :method1, :args1, :args2, :args3
# add :method2
EOS
  end
  puts "create Snippet.rb template file"
  exit
end

unless FileTest.exist?("./Snippet.rb")
  puts "please create Snippet.rb"
  puts "you can use 'ruby se.rb init'. then you get Snippet.rb template."
  exit
end

require_relative "./snippeter"
require_relative "./Snippet"
generate
