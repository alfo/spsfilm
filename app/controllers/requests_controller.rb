class RequestsController < ApplicationController
  def new
  	@request = Request.new
  end

  def index
  	if current_user.is_admin?
  		@requests = Request.all
  	else
  		@requests = current_user.requests
  	end
  end

  def show
  end

  def edit
  end
end
