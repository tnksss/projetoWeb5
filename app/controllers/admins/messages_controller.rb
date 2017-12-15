class Admins::MessagesController < Admins::BaseController
  def index
    @messages = Message.all
  end
 
end   