class GearController < ApplicationController
  def index
  	if current_user.is_admin? and params[:show] == 'all'
  		@gear = Gear.all
  	else
  		@gear = current_user.gear
  	end
  end

  def new
  	@gear = Gear.new
  end
  
  def create
  	@gear = Gear.new(gear_params)
  	@gear.user_id = current_user.id
  	if @gear.save
  		redirect_to gear_index_path, :notice => "Gear added"
  	else
  		flash[:error] = @gear.errors.full_messages.join(', ')
  		redirect_to new_gear_path
  	end
  end

  def edit
  	@gear = Gear.find(params[:id])
  end
  
  def update
  	@gear = Gear.find(params[:id])
  	if @gear.update(gear_params)
  		redirect_to gear_index_path, :notice => "Gear Edited"
  	else
  		flash[:error] = @gear.errors.full_messages.join(', ')
  		redirect_to edit_gear_path(@gear)
  	end
  	
  end
  
  private
  def gear_params
  	params.require(:gear).permit(:name, :description, :value, :serial)
  end
end
