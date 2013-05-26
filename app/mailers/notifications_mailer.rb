class NotificationsMailer < ActionMailer::Base
  default :from => "rouvignac@gmail.com"
  default :to => "rouvignac@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[rouvignac.fr] #{message.subject}")
  end
end



