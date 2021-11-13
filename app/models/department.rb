class Department < ApplicationRecord
    has_many :tasks 
    belongs_to :factory
    def self.get_tasklist(department)
        begin
            return Department.find_by(:name => department).tasks
        rescue NoMethodError
            return []            
        end
    end
    def self.get_departmentId(department)
        begin
            return Department.find_by(:name => department).id
        rescue NoMethodError
            return ""
        end
    end
end
