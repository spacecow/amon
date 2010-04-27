class Admin::MessagesController < ApplicationController
	load_and_authorize_resource
	
	def index
		@messages = Message.all
	end
	
  def destroy
		@message.destroy
		flash[:notice] = t('notice.deleted', :object=>t(:mail_message))
		redirect_to admin_messages_path
  end	
end