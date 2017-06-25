class StatesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb "States"
    @select_options = ApplicationHelper.us_states.map do |s|
      [ApplicationHelper.state_name(s), s]
    end
  end

  def show
    add_breadcrumb "States", states_path
    add_breadcrumb params[:state]
  end
end
