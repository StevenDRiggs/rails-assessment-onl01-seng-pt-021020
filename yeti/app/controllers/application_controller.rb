class ApplicationController < ActionController::Base
  before_action :define_variables

  def define_variables
    @obj = Object.const_get(self.class.to_s[0..-11].singularize)
    @snake_case = @obj.class.to_s.underscore
  end

  def index
    self.instance_variable_set("@#{@snake_case}", @obj.all)
  end

  def show
    begin
      self.instance_variable_set("@#{@snake_case}", @obj.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      flash[:errors] = ["#{@obj.name} not found"]
      redirect_to self.send("#{@snake_case.pluralize}")
    end
  end

  def new
    self.instance_variable_set("@#{@snake_case}", @obj.new)
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete
  end
end
