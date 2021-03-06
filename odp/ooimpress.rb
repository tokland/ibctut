#!/usr/bin/ruby
require 'rubygems'
require 'fileutils'
require 'tmpdir'
require 'erb'
require 'ostruct'

# Third-party gems
require 'escape' # http://www.a-k-r.org/escape/

class ErbBinding < OpenStruct
  def get_binding
    binding
  end
end

module OOImpress  
  def self.create_document_from_tree(tree_directory, output_path)
    path = File.expand_path(output_path)
    FileUtils.rm_f(path)
    old_directory = FileUtils.pwd
    FileUtils.cd(tree_directory)
    begin 
      run(["zip", "-0", "-X", path, "mimetype"])
      run(["zip", "-r", path, ".", "-x", "mimetype"])
    ensure
      FileUtils.cd(old_directory)
    end
    path
  end

  def self.create_document_from_template(tree_directory, output_path, namespaces)
    temporal_directory = Dir.mktmpdir
    begin
      FileUtils.cp_r(Dir.glob(File.join(tree_directory, "*")), temporal_directory)      
      namespaces.each do |template_path, namespace|
        template = ERB.new(File.read(File.join(tree_directory, template_path)))
        open(File.join(temporal_directory, template_path), "w") do |file|
          file.write(template.result(ErbBinding.new(namespace).get_binding))
        end
      end
      OOImpress.create_document_from_tree(temporal_directory, output_path)
    ensure
      FileUtils.rm_rf(temporal_directory)
    end
  end  
    
private

  def self.run(command_array)
    command = Escape.shell_command(command_array)
    output = %x{#{command}}
    status = $?.exitstatus
    fail "Error: exit status #{status}: #{command}" unless status == 0
    output
  end  
end

if __FILE__ == $0
  tree_directory, output_path = ARGV
  namespaces = {
    "content.xml" => {
      :company => "IbcMass",
      :date_start => "10/1/2010",
      :date_end => "10/3/2011",
    }
  }
  puts OOImpress.create_document_from_template(tree_directory, output_path, namespaces)
end
