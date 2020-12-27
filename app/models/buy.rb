class Buy < ApplicationRecord
    belongs_to :user, optional: true
    
    validates_presence_of :user_id, :bought, presence: true
end
