class Cproduct < ApplicationRecord
    # belongs_to :mproducts
    validates :pid,presence: true
    validates :pname,presence: true
    validates :quantity,presence: true
end
