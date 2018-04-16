class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #
  #
	# def self.remove_white_space_from_attr_list(attribute_list)
	# 	attribute_list.each do |work_attribute|
	# 		work_attribute.squish! if !work_attribute.nil?
	# 	end
	# end
  #
	# def nil_blank_values
	# 	self.description = nil if !self.description.nil? && self.description.blank?
	# 	self.creator = nil if !self.creator.nil? && self.creator.blank?
	# end
end
