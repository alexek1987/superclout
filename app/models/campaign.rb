class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :status, presence: true, :inclusion => { in: ["Requested", "Approved", "Declined", "Active", "Completed"]}
end
