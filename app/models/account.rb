class Account < ApplicationRecord
    has_many :tasks
    belongs_to :factory

    def self.get_free_worker
        @worker_free = []
        Account.where(:free => true).each do |a|
            if a.role != "Manager"
                @worker_free << a
            end
        end
        return @worker_free
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
