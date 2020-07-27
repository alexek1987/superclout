class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :status, presence: true, :inclusion => { in: ["Requested", "Offered", "Accepted", "Declined", "Cancelled", "Active", "Completed"]}
end
#add columns start and end date, offer $$

# requested - the superclout likes the product
# offered - the brand owner comes back with an offer of $$ and start and end date
# superclout reads the offer, negotitates with owner over chat (need to create chatroom model)
# accepted - superclout accepts the offer, and brand cannot make changes to offer anymore
# declined - superclout doesn't want it anymore
# cancelled - owner doesn't want to work with the superclout/on their terms anymore
# active - start_date of campaign has started
# completed - end_date elapsed and payment can be released by the owner
