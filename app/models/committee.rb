class Committee < ApplicationRecord
  validates_presence_of :body
  validates_presence_of :name
  validates_presence_of :state

  validates :body, inclusion: { in: ApplicationHelper.committee_bodies }
  validates :state, inclusion: { in: ApplicationHelper.us_states }
end
