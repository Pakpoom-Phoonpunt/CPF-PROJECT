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
        puts self.account_id
        return Account.get_name(self.account_id)
    end
    
    def self.assign_task(department, acc, day, shift)
        if !(Task.find_by(:account_id => acc)&& Task.find_by(:day => day))
            task = Task.new(:day => day, :shift => shift, :ot => 0)
            Department.add_task(department, task)
            Account.add_task(acc, task)
            task.save!
        end
    end

    def self.delete_task(task_id)
        if Task.find_by(:id => task_id)
            task = Task.find_by(:id => task_id)
            Account.set_free(task.account_id)
            task.destroy!  
        end      
    end
    def self.assign_ot(task_id, val)
        if Task.find_by(:id => task_id)
            task = Task.find_by(:id => task_id)
            task.ot = val
            task.save!
        end
    end
end
