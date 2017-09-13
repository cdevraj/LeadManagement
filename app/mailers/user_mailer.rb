class UserMailer < ApplicationMailer

  def test
      mail(:to => "jsamant@grepruby.com", subject: "Registered", from: 'jitendra')
  end  

  def send_email(params)
    @content = params[:content]
    email = Lead.where(id: params[:receiver_id]).last.email rescue 'jsamant@grepruby.com'
    mail(to: email, subject: params[:subject], from: "\"Lead Generator\" <admin@leadgenerator.com>")
    # mail(
    #   to: 'jsamant@grepruby.com',#params[:receiver],
    #   subject: params[:subject],
    #   body: params[:content]
    #   )
    # mail.delivery_method.settings.merge!(get_smtp_settings(params[:smtp]))
  end

  def get_smtp_settings(smtp)
    smtp = smtp.downcase
    Rails.application.secrets.email_smtps[smtp.to_sym]
  end

  def send_email2(user, recipients, options={})
    @recipients = recipients
    @user = user
    @options = options
    mail(
      to: @recipients.join(','), 
      subject: options[:subject],
      body: options[:content]
      )
    mail.delivery_method.settings.merge!(get_smtp_settings(options))
  end

  def get_smtp_settings2(options)
    smtp = options[:smtp].downcase
    Rails.application.secrets.email_smtps[smtp.to_sym]
  end


end

