class StatesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb "States"
  end

  def show
    add_breadcrumb "States", states_path
    add_breadcrumb params[:state]
  end
end
