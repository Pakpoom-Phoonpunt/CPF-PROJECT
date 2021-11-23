class Department < ApplicationRecord
    has_many :tasks 
    belongs_to :factory

    def self.create_department(facID, name)
        if name && facID
            depart = Department.new(:name => name)
            Factory.add_department(facID, depart)
            depart.save!
        end
    end
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
    def self.add_task(department, task)
        begin
            Department.find_by(:id => get_departmentId(department)).tasks << task
        end
    end
end
