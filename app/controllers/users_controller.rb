class UsersController < ApplicationController
  
  def update_brand
    current_user.update_attribute(:brand_id, params[:brand_id].to_i)
    render :text => "ok"
  end
end
