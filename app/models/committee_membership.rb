class CommitteeMembership < ApplicationRecord
  belongs_to :committee
  belongs_to :legislator

  validates_presence_of :committee_id
  validates_presence_of :legislator_id
  validates_presence_of :start_date

  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date and end_date < start_date
      errors.add(:end_date, 'cannot be before start_date')
    end
  end
end
