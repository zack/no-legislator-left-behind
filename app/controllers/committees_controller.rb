class CommitteesController < ApplicationController
  def index
    all_committees = Committee.where(state: params[:state])
    @committees = {
      house: all_committees.where({body: 'House'}),
      joint: all_committees.where({body: 'Joint'}),
      senate: all_committees.where({body: 'Senate'})
    }
  end

  def show
    @committee = Committee.find(params[:id])
  end
end
