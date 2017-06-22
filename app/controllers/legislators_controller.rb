class LegislatorsController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @state = params[:state]

    add_breadcrumb "States", states_path
    add_breadcrumb @state, state_path(@state)
    add_breadcrumb "Legislators"

    @legislators = Legislator.where(state: params[:state]).order('last_name')
  end

  def show
    @legislator = Legislator.find(params[:id])

    add_breadcrumb "States", states_path
    add_breadcrumb @legislator.state, state_path(@legislator.state)
    add_breadcrumb "Legislators", legislators_path(state: @legislator.state)
    add_breadcrumb @legislator.name

    committee_memberships = CommitteeMembership.where(legislator: @legislator)
    committees = committee_memberships.map{|c| Committee.find(c.committee_id)}
    @committees = {:body => [], :joint => []}
    committees.each{|c| c.body == 'Joint' ? @committees[:joint].push(c) : @committees[:body].push(c)}
    @table_len = [@committees[:body].length, @committees[:joint].length].max
  end
end
