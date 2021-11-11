class Department < ApplicationRecord
    has_many :tasks 
    has_many :accounts
    belongs_to :factory
end
