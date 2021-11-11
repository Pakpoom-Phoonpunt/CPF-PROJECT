class Factory < ApplicationRecord
    has_many :departments
    has_many :accounts 
end
