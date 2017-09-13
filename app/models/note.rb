class Note < ApplicationRecord

  belongs_to :email_conversation
  belongs_to :user

end
