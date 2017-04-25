class Legislator < ApplicationRecord
  validates_presence_of :body
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :state

  validates :body, inclusion: { in: ApplicationHelper.legislative_bodies }
  validates :state, inclusion: { in: ApplicationHelper.us_states }
end
