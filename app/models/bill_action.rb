class BillAction < ApplicationRecord
  belongs_to :bill

  validates_presence_of :action
  validates_presence_of :action_date

  validates :action, inclusion: { in: BillHelper.actions }
  validates :number, length: { minimum: 2 }
  validates :session, numericality: { greater_than_or_equal_to: 2009,
                                      less_than_or_equal_to: 2017 }
  validates :state, inclusion: { in: ApplicationHelper.us_states }

  validate :becomes_bill_exists
  validate :scheduled_date_after_action_date

  def becomes_bill_exists
    if becomes_bill and !Bill.where(id: becomes_bill)
      errors.add(:becomes_bill, 'bill does not exist')
    end
  end

  def scheduled_date_after_action_date
    if scheduled_date and scheduled_date < action_date
      errors.add(:scheduled_date, 'cannot be before action_date')
    end
  end
end
