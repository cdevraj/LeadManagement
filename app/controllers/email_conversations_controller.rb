class EmailConversationsController < BaseController

  before_action :check_manager 

  # Chat history of lead
  def chat_history
  	@chat_history = EmailConversation.where(receiver_id: params[:lead_id], is_sent: true)
  end	

  # Chat history of lead
  def scheduled_emails
    @chat_history = EmailConversation.where("sender_id = #{current_user.id} AND sent_date is not null")
  end 

  # Add notes to chat history
  def add_notes
  	Note.create!(content: params[:body], user_id: params[:user_id], email_conversation_id: params[:email_conversation_id])
  	redirect_to chat_history_path(lead_id: params[:lead_id])
  end 
  
end	
