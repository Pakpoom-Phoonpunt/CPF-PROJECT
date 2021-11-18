class Account < ApplicationRecord
    has_many :tasks
    belongs_to :factory
    
    def self.get_free_worker(date)
        @worker_free = []
        busy_acc = Task.get_accId_by_date(date)
        return Account.where.not(:id => busy_acc).where.not(:role => ["Manager", "Admin"])
    end
    
    def self.get_name(acc_id)
        return Account.find_by(:id => acc_id).name
    end
    def self.add_task(accId, task)
        acc = Account.find_by(:id => accId)
        acc.tasks << task
        acc.free = false
        acc.save!
    end
    def self.set_free(acc_id)
        acc = Account.find_by(:id => acc_id)
        acc.free = true
        acc.save!
    end
end
