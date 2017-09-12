class EmailConversation < ApplicationRecord

  def self.save_email(params, user)
  	sent_date = params[:send_date]
  	if sent_date.present?
  	  is_sent = false
  	else	
  	  is_sent = false			
    end 		
  	#EmailConversation.create(sender_id: user.id, receiver_id: params[:receiver_id], receiver_email, params[:receiver_email], subject: params[:subject], content: params[:content], smtp: params[:smtp], is_sent: is_sent, sent_date: sent_date)
  end	

end
