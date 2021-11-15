class Task < ApplicationRecord
    belongs_to :department
    belongs_to :account 
    
    def get_time(input_time)
        begin
            return input_time.strftime("%H:%M")
        rescue NoMethodError
            return ""
        end
    end
    def self.get_tasks(department)
        return Task.where(:department_id => department)
    end

    def get_owner_name
        return Account.get_name(self.account_id)
    end
end
