class Department < ApplicationRecord
    has_many :tasks 
    has_many :accounts
    belongs_to :factory
    def self.get_tasklist(department)
        return Department.find_by(:name => department).tasks
    end
end
