class EmailConversationsController < BaseController

  before_action :check_manager 

  # Chat history of lead
  def chat_history
  	@chat_history = EmailConversation.where(receiver_id: params[:lead_id])
  end	

  # Add notes to chat history
  def add_notes
  	Note.create!(content: params[:body], user_id: params[:user_id], email_conversation_id: params[:email_conversation_id])
  	redirect_to chat_history_path(lead_id: params[:lead_id])
  end 
  
end	
