class CommitteesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @state = params[:state]

    add_breadcrumb "Committees (#{@state})"

    all_committees = Committee.where(state: params[:state])
    @committees = {
      house: all_committees.where({body: 'House'}),
      joint: all_committees.where({body: 'Joint'}),
      senate: all_committees.where({body: 'Senate'})
    }
  end

  def show
    @committee = Committee.find(params[:id])

    add_breadcrumb "Committees (#{@committee.state})", committees_path(state: @committee.state)
    add_breadcrumb @committee.name

    @members = CommitteeMembership.where(committee_id: params[:id])
  end
end
