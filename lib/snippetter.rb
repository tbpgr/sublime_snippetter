# encoding: utf-8
require "erb"

class TargetMethod
  attr_accessor :method_name, :args

  def initialize(&block)
    instance_eval do
      block.call(self)
    end
  end
end

module Kernel
  attr_accessor :_methods
  SNIPPETS_OUTPUT = "#{File.dirname(__FILE__)}/snippets"

  def add(method_name, *args)
    return if method_name.nil?
    return if method_name.empty?
    return if args.each.include?(nil)
    return if args.each.include?("")
    @_methods ||= []
    @_methods << TargetMethod.new do |t|
      t.method_name = method_name
      t.args = args
    end
  end

  def generate
    dir = File.dirname(__FILE__)
    base_template = File.open("#{dir}/template", "r") {|f|f.read}

    @_methods.each do |m|
      template = base_template
      output(m.method_name, get_snippet(template, m.method_name, get_args_names(m)))
    end if @_methods
  end

  private
  def get_args_names(_method)
    args = _method.args
    args_names = " "
    args.each_with_index do |a, i|
       args_names << "${#{i + 1}:#{a}}, "
    end
    args_names.chop!.chop! unless args.empty?
  end

  def get_snippet(template, method_name, args_names)
    erb = ERB.new(template)
    snippet = erb.result(binding)
    snippet
  end

  def output(method_name, snippet)
    Dir::mkdir(SNIPPETS_OUTPUT) unless FileTest.exist?(SNIPPETS_OUTPUT)
    file_name = "#{SNIPPETS_OUTPUT}/#{method_name}.sublime-snippet"
    File::open(file_name, "w") do |f|
      f.puts snippet
    end
    puts "create for #{method_name} method snippet => #{file_name}"
  end
end
