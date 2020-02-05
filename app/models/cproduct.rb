class Cproduct < ApplicationRecord
    validates :pid,presence: true
    validates :pname,presence: true
    validates :quantity,presence: true
end
