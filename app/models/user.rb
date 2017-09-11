class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :assign_role
  has_many :leads

  # Assign lead generator role if role id missing
  def assign_role
  	default_role_id = Role.where(name: 'LeadGenerator').last
 	role_id =  default_role_id if role_id.blank? && default_role_id.present?			
  end	

end
