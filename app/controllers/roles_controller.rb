class RolesController < InheritedResources::Base
  def index
    @roles = Role.page(params[:page]).per(params[:per_page])
  end

  def update
    params[:role][:auth] = Hash[params[:role][:auth].map{|key, value| [key, value.keys] }].to_json if params[:role][:auth]
    @role = Role.find(params[:id])
    @role.update_attributes params[:role]
    redirect_to :action => :show, :id => @role.id
  end


  def show
    @role = Role.find(params[:id])
    @auth = JSON.parse(@role.auth)
  end

  def create
    params[:role][:auth] = Hash[Role::AUTH.keys.map{|key, value| [key, ["read", "comment", "destroy", "create"]]}].to_json
    @role = Role.create(params[:role])
    redirect_to :action => "show", :id => @role.id
  end

  def edit
    @role = Role.find(params[:id])
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to :action => "index"
  end
end
