class Legislator < ApplicationRecord
  has_many :bill_sponsorships, through: :bill_sponsors
  has_many :bill_cosponsorships, through: :bill_cosponsors

  validates_presence_of :body
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :state

  validates :body, inclusion: { in: ApplicationHelper.legislative_bodies }
  validates :state, inclusion: { in: ApplicationHelper.us_states }

  def name
    first_name + ' ' + last_name
  end
end
