class Task < ApplicationRecord
    belongs_to :department
    belongs_to :account 
end
