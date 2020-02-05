class Mproduct < ApplicationRecord
  belongs_to :mfr
  # mount_uploader :image, ImageUploader
  validates :product_name ,:presence=> true
  validates :quantity ,presence: true,numericality: {only_integer: true,greater_then_or_equal: 10}
  validates :price ,presence: true,numericality: {only_integer: true,greater_then_or_equal: 50}
  # validates :mobile_no ,presence: true ,numericality: {only_integer: true},length: {is: 10}
  Group=["Pulses","Grains"]
end
