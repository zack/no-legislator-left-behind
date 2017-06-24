class CommitteesController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @state = params[:state]

    add_breadcrumb "States", states_path
    add_breadcrumb @state, state_path(@state)
    add_breadcrumb "Committees"

    @committees = Committee.where(state: params[:state]).order('name')
  end

  def show
    @committee = Committee.find(params[:id])

    add_breadcrumb "States", states_path
    add_breadcrumb @committee.state, state_path(@committee.state)
    add_breadcrumb "Committees", committees_path(state: @committee.state)
    add_breadcrumb @committee.name

    legislators = CommitteeMembership.where(committee_id: params[:id])
      .map{|m| Legislator.find(m.legislator.id)}
    @parties = legislators.map{|l| l.party }.uniq.shuffle
    @members = {}
    @parties.each{ |p| @members[p] = [] }
    legislators.each{ |l| @members[l.party].push(l) }
    @parties.each do |p|
      @members[p] = @members[p].sort{|x, y| x.last_name <=> y.last_name}
    end
    @table_len = @parties.map{|p| @members[p].length}.max
  end
end
