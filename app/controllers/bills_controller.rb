class BillsController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @state = params[:state]

    add_breadcrumb "States", states_path
    add_breadcrumb @state, state_path(@state)
    add_breadcrumb "Bills"

    @bills = Bill.where(state: params[:state]).order('title')
  end

  def show
    @bill = Bill.find(params[:id])

    add_breadcrumb "States", states_path
    add_breadcrumb @bill.state, state_path(@bill.state)
    add_breadcrumb "Bills", bills_path(state: @bill.state)
    add_breadcrumb @bill.title

    @sponsor = Legislator.find(BillSponsor.where({bill_id: @bill.id}).take.legislator_id)
    @cosponsors = BillCosponsor.where({bill_id: @bill.id})
  end
end
