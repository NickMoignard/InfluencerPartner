class Creator < ApplicationRecord
    has_many :orders

    enum profit_share: { :revenue => 0, :profit => 1 }
    
    before_save do
       self.code = self.code.downcase 
    end
end

