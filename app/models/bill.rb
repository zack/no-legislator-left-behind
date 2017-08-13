class Bill < ApplicationRecord
  has_many :bill_actions
  has_many :bill_sponsors, through: :bill_sponsors
  has_many :bill_cosponsors, through: :bill_cosponsors

  validates_associated :bill_actions

  validates_presence_of :body
  validates_presence_of :description
  validates_presence_of :number
  validates_presence_of :session
  validates_presence_of :state
  validates_presence_of :title

  validates :body, inclusion: { in: ApplicationHelper.legislative_bodies }
  validates :number, length: { minimum: 2 }
  validates :session, numericality: { greater_than_or_equal_to: 2009,
                                      less_than_or_equal_to: 2017,
                                      message: 'Year out of bounds'}
  validates :state, inclusion: { in: ApplicationHelper.us_states }

  validate :reintroduces_exists

  def reintroduces_exists
    if reintroduces and !Bill.where(id: reintroduces)
      errors.add(:reintroduces, 'bill does not exist')
    end
  end
end
