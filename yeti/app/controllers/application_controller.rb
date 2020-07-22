class ApplicationController < ActionController::Base
  before_action :define_variables, except: :welcome

  def welcome
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  def define_variables
    @obj = Object.const_get(self.class.to_s[0..-11].singularize)
    @snake_case = @obj.to_s.underscore
  end

  def index
    self.instance_variable_set('@objects', @obj.all)
  end

  def show
    begin
      self.instance_variable_set("@#{@snake_case}", @obj.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}_path")
    end
  end

  def new
    @object_ = @obj.new
  end

  def create
    @object_ = @obj.new(self.object_params)
    if @object_.save
      redirect_to @object_
    else
      flash[:errors] = @object_.errors.full_messages
      render :new
    end
  end

  def edit
    begin
      self.instance_variable_set("@#{@snake_case}", @obj.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}_path")
    end
  end

  def update
    begin
      object_ = self.instance_variable_set("@#{@snake_case}", @obj.find(params[:id]))
      if object_.update(self.object_params)
        redirect_to object_
      else
        flash[:errors] = object_.errors.full_messages
        render self.send("edit_#{@snake_case}_path")
      end
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}_path")
    end
  end

  def delete
    begin
      object_ = self.instance_variable_set("@#{@snake_case}", @obj.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}_path")
    end
  end

  def destroy
    begin
      object_ = @obj.find(params[:id])

      object_.destroy

      redirect_to self.send("#{@snake_case.pluralize}_path")
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}_path")
    end
  end
end
