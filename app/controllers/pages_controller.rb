class PagesController < ApplicationController
  load_and_authorize_resource
  
  def show
  	@page = Page.find_by_name( params[:name] )
  end
end
