module ApplicationHelper

	def active?(name)
		'class=active' if name == controller.controller_name
	end
	
	def flash_class(level)
	  	case level
	  		when :notice then "alert-success"
	  		when :error then "alert-error"
	  		when :alert then "alert-info"
	  	end
	end

end
