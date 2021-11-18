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
    
    def get_owner_name
        return Account.get_name(self.account_id)
    end
    
    def self.assign_task(department, acc, day, shift)
        if !Task.find_by(:account_id => acc, :day => Time.parse(day))
            task = Task.new(:day => day, :shift => shift, :ot => 0)
            Department.add_task(department, task)
            Account.add_task(acc, task)
            task.save!
        end
    end

    def self.delete_task( accId, date, shift)
        task = Task.find_by(:account_id => accId, :day => Time.parse(date), :shift => shift)
        if task
            Account.set_free(accId)
            task.destroy!  
        end      
    end
    
    def self.assign_ot(acc_id, date, shift, val)
        task = Task.find_by(:account_id => acc_id, :day => Time.parse(date), :shift => shift)
        if task
            task.ot = val
            task.save!
        end
    end

    def self.filter_task(date, departmentId, shift, status)
        time = Time.parse(date).strftime("%Y-%m-%d")
        tmp = Task.where(:department_id => departmentId, :shift => shift)
        if status && status == "plan"
            if tmp
                tasks = []
                tmp.each do |t|
                    if t.day.strftime("%Y-%m-%d") === time
                        tasks << t
                    end
                end
            end
        elsif status && status == "actual"
            tmp = Task.where(:department_id => departmentId, :shift => shift, :active => true)
            if tmp
                tasks = []
                tmp.each do |t|
                    if t.day.strftime("%Y-%m-%d") === time
                        tasks << t
                    end
                end
            end
        end
        return tasks
    end

    def self.number_worker(departmentId, date, shift, status)
        if filter_task(date, departmentId, shift, status)
            return filter_task(date, departmentId, shift, status).length
        else
            return 0
        end
    end
    
    def self.get_accId_by_date(date)
        accId = []
        time = Time.parse(date).strftime("%Y-%m-%d")
        Task.all.each do |t|
            if t.day.strftime("%Y-%m-%d") === time
                accId << t.account_id
            end
        end
        return accId
    end
end
