class MessagesController < ApplicationController
  def index
    redirect_to all_messages_url
  end

  def all
  	@user = current_user # refactor plz
    @messages = current_user.received_messages + current_user.sent_messages
    render :index
  end

  def new
    @message = Message.new
  end

  def sentbox
  	@user = current_user
  	@label = 'Sent'
    @messages = current_user.sent_messages
    render :action => :index
  end

  def inbox
  	@user = current_user
  	@label = 'Inbox'
    @messages = @user.received_messages
    render :action => :index
  end
  
  def trash
  	@user = current_user
  	@label = 'Trash'
    @messages = @user.deleted_messages
    render :action => :index
  end

  def show
  	@user = current_user
    @message = Message.find(params[:id])
    @message.opened = true
    @message.save
  end
  
  def create
    @content = params[:message] || {}
    if current_user.send_message(find_recipient_from_params, @content['topic'], @content['body'] )
      flash[:notice] = "Message sent..."
      redirect_to sentbox_messages_url # sent messages
    else
      render :action => 'new'
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.delete # TODO nullify messages
    #@message.hide_for_user(current_user)
    redirect_to :back
  end
  
  
  def find_recipient_from_params
    recipient = User.find_by_username(params[:message][:recipient])
  end
end
