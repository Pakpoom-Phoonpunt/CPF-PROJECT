class Account < ApplicationRecord
    has_many :tasks
    belongs_to :factory

    def self.get_free_worker
        return Account.where(:free => true)
    end
end
