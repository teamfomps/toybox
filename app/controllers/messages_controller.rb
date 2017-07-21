class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.send
      flash[:success] = 'Message received!'
      redirect_to '/contact'
    else
      render :new
    end
  end

  protected
  def message_params
    params.require(:message).permit(:sender_name, :sender_email, :body)
  end
end
