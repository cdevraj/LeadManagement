class EmailTemplate < ApplicationRecord
  
  # Default created templates
  def self.default_templates(user_id)
  	EmailTemplate.where("user_id is null OR user_id = #{user_id}")
  end	

end
