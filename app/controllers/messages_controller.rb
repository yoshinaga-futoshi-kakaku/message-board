class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
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
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      redirect_to root_path , notice: "message wo hensyu sitayo"
    else
      render "edit"
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: "削除したよ"
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
