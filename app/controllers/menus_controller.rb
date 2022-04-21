class MenusController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    menu = Menu.create(menu_parameters)

    redirect_to menus_path
  end

  def edit
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_parameters)
  end

  def menu_parameters
    params.require("menu").permit(:name, :description, :price)
  end
end
