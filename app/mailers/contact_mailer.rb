class ContactMailer < ActionMailer::Base
  default :from => 'onlineauctionutfpr@gmail.com'

  def contact_message(contact)
    @contact = contact
    mail(:to => 'onlineauctionutfpr@gmail.com', :subject => 'Mensagem de Contato')
  end
end