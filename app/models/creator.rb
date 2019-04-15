class Creator < ApplicationRecord
    has_many :orders

    before_save do
       self.code = self.code.downcase 
    end
end

