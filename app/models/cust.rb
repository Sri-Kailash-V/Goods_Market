class Cust < ApplicationRecord
    validates :username,presence: true
    validates :password,presence: true
    validates :email,presence: true,uniqueness: true,format: { with: /\A[A-Za-z][A-Za-z0-9]+@[A-Za-z0-9]+\.[a-z]{2,3}\z/ }
    validates :mobile_no,presence: true,numericality: {onlt_integer:true},length: {is: 10}
    validates :address,presence: true
end
