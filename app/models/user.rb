# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  has_many :news
  ROLES = {
    "admin"  => "管理员",
    "ba"     => "BA",
    "common" => "公司职员",
    "si"     => "SI部门",
    "sales"  => "销售部",
    "edu"    => "美容教育部"
  }

  BRAND = {
    "1" => "兰芝",
    "2" => "梦妆",
    "3" => "雪花秀"
  }

  GROUP = {
    "1" => "所有人",
    "2" => "管理员",
    "3" => "ba",
    "4" => "bp"
  }
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login
  attr_accessor :login
  
  has_attached_file :avatar,
    :styles => {:upload => "80x72#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def display_name
    email || login
  end

  def role
    User::ROLES[role_id]
  end

  def brand
    User::BRAND[brand_id]
  end

  def no_last_an?
    an = Announcement.where("id > #{self.an_id.to_i} and an_type=1").order("id asc").limit(1).first
    if an
      update_attribute :an_id, an.id
      true
    else
      false
    end
  end

  def area
    Area.find(area_id).name 
  end
end
