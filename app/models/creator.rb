class Creator < ApplicationRecord
    has_many :orders

    enum profit_share: [:revenue, :profit]
    
    before_save do
       self.code = self.code.downcase 
    end
end

