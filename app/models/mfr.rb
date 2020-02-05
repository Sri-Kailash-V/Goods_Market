class Mfr < ApplicationRecord
    has_many :mproducts
    validates :username ,presence: true
    validates :email ,presence: true,uniqueness: true,format: { with: /[A-Za-z][A-Za-z0-9]+@[A-Za-z0-9]+\.[a-z]{2,3}/ }
    validates :password ,presence: true,length: {in: 6..10}
    validates :mobile_no ,presence: true ,numericality: {only_integer: true},length: {is: 10}
end
