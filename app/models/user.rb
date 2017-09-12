class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :assign_role
  belongs_to :role, optional: true
  has_many :leads
  has_many :user_lead_generators
  has_many :lead_generators, through: :user_lead_generators
  has_many :inverse_user_lead_generators, class_name: "UserLeadGenerator", foreign_key: "manager_id"
  has_many :inverse_lead_generators, through: :inverse_user_lead_generators, source: :user

  # Assign lead generator role if role id missing
  def assign_role
  	default_role = Role.where(name: 'LeadGenerator').last
 	  self.role_id =  default_role.id if self.role_id.blank? && default_role.present?			
  end	

  def is_lead_generator?
  	role.present? && role.name == 'LeadGenerator'
  end	

  def is_manager?
  	role.present? && role.name == 'Manager'
  end	

  def is_admin?
  	role.present? && role.name == 'Admin'
  end	

  # List of managers
  def self.managers
    where("role_id in(select id from roles where name = 'Manager')")
  end    

end
