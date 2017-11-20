class ContactsController < ApplicationController
  def index
     @contact = Contact.new
  end
  
  def create
     @contact = Contact.new(contact_params) 

     if @contact.save
       flash[:success] = 'Mensagem enviada com sucesso!'
       @contact = Contact.new
     else
       flash[:error] = 'Existem dados incorretos!'
     end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
