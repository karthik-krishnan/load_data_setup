require 'erubis'
require 'json'

class Template

	def self.load(template_name)
		Template.new(template_name)
	end

	def initialize(template_name)
		template_name = File.read("#{File.dirname(__FILE__)}/../templates/#{template_name}.erb")
		@template = Erubis::Eruby.new(template_name)
	end

	def generate(context)
		json_result = @template.result(context)
    JSON[json_result].inject({}){|json,(k,v)| json[k.to_sym] = v; json}
	end
end