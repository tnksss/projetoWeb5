class ContactsController < ApplicationController
   def index
     @contact = Contact.new
  end
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver
      flash[:notice] = 'Mensagem enviada com sucesso'
      redirect_to :action => 'index'
      return  
    end

    render :action => 'index'
  end
end  