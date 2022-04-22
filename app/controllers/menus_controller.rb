class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
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

    redirect_to menus_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
  end

  def menu_parameters
    params.require("menu").permit(:name, :description, :price)
  end
end
