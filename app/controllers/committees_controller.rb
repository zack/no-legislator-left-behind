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
    add_breadcrumb "#{@committee.name} (#{@committee.body})"

    legislators = CommitteeMembership.where(committee_id: params[:id])
      .map{|m| Legislator.find(m.legislator.id)}
    @legislator_parties = legislators.map{|l| l.party }.uniq
    @members = {}
    @legislator_parties.each{ |p| @members[p] = [] }
    legislators.each{ |l| @members[l.party].push(l) }
    @legislator_parties.each do |p|
      @members[p] = @members[p].sort{|x, y| x.last_name <=> y.last_name}
    end
    @table_len = @legislator_parties.map{|p| @members[p].length}.max
  end
end
