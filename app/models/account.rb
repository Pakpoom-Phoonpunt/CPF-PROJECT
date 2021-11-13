class Account < ApplicationRecord
    has_many :tasks
    belongs_to :factory

    def get_free_worker
        return Account.find_by(:free => true)
    end
end
