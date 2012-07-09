# -*- encoding: utf-8 -*-
class UsersController < ApplicationController

  def index
    @users = User.where(brand_id: params[:item] || [1, 2, 3]).page(params[:page]).per(params[:per_page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to :action => :index
  end

  def not
    @user = User.find(params[:user_id])
    @user.update_attributes(:status => 0)
    redirect_to(:back)
  end

  def open
    @user = User.find(params[:user_id])
    @user.update_attributes(:status => 1)
    redirect_to(:back)
  end
	
end
