class Account < ApplicationRecord
    has_many :tasks
    belongs_to :department
    belongs_to :factory
end
