class UserLeadGenerator < ApplicationRecord

  belongs_to :user
  belongs_to :lead_generator, class_name: "User"

end
