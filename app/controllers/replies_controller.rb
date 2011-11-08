class RepliesController < ApplicationController
  def new

  end

  def create
    @message = Message.find(params[:message_id])
    @message.unhide!
    reply = @message.replies.build(params[:reply])
    if reply.valid?
      reply.author = current_user
      reply.save!
      flash[:notice] = "Message Replied..."
      redirect_to message_url(@message)
    else
      redirect_to message_url(@message)
    end
  end
end
