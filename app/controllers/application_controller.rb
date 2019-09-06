class ApplicationController < ActionController::Base
  before_action :set_models, only: [:index]
  before_action :set_model, only: [:edit, :show]

  def initialize
    @model_class = self.class.name.gsub('sController', '')
    @model = @model_class.downcase
  end

  def new
    eval("@#{@model} = #{@model_class}.new")
  end

  def create
    eval("@#{@model} = #{@model_class}.new(#{model_params})")

    if eval("@#{@model}.save")
      eval("redirect_to @#{@model}")
    else
      render :new
    end
  end

  def update
    set_model.update(model_params)
    go_home
  end

  def destroy
    set_model.destroy
    go_home
  end

  protected

  def model(method)
    eval("#{@model_class}.#{method}")
  end

  def set_model
    eval("@#{@model} = #{@model_class}.find(#{params[:id]})")
  end

  def set_models
    eval("@#{@model}s = #{@model_class}.all")
  end

  def model_params
    attributes = eval("#{@model_class}::ATTRIBUTES")
    eval("params.require(:#{@model}).permit(#{attributes})")
  end

  def go_home
    redirect_to root_path || eval("redirect_to #{@model}s_path")
  end
end
