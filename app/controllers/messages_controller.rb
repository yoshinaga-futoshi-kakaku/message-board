class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages= Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: "messageをsaveしたよ"
    else
      @messages = Message.all
      flash.now[:alert] = "cant save message"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
