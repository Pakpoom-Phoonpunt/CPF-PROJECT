class Factory < ApplicationRecord
    has_many :departments
    has_many :accounts 

    def self.add_department(facID, department)
        fac = Factory.find_by_id(facID)
        fac.departments << department
    end
    def self.get_all_factory
        return Factory.all
    end

    def self.find_by_id(id)
        return Factory.find_by(:id => id)
    end
end
