class EmailConversation < ApplicationRecord
  
  has_many :notes  

  def self.save_email(params, user)
    is_sent = false; send_date = Date.today     
    if params[:send_date].present? && params[:send_date]["(1i)"].present? && params[:send_date]["(2i)"].present? && params[:send_date]["(3i)"].present?
      date = "#{params[:send_date]["(1i)"]}/#{params[:send_date]["(2i)"]}/#{params[:send_date]["(3i)"]}"
      send_date = Date.parse(date)
      unless send_date > Date.today
        UserMailer.send_email(params).deliver   
        is_sent = true     
      end  
    else
      UserMailer.send_email(params).deliver   
      is_sent = true     
    end  	
  	EmailConversation.create(sender_id: user.id, receiver_id: params[:receiver_id], receiver_email: params[:receiver_email], subject: params[:subject], content: params[:content], smtp: params[:smtp], is_sent: is_sent, sent_date: send_date, created_at: Time.now)
  end	

end
