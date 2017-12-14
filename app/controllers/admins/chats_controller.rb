class Admins::ChatsController < Admins::BaseController
  def show
    @messages = Message.all
  end
end 