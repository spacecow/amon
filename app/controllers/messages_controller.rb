class MessagesController < ApplicationController
  load_and_authorize_resource

  def new
  end
  
  def create
    if @message.save
      Mailer.deliver_message @message
      flash[:notice] = t('message.thanks_for_message')
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
