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
end
