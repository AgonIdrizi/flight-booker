class Ticket < ApplicationRecord
  belongs_to :passenger , optional: true
  belongs_to :booking, optional: true
end
