class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  has_one_attached :image
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1 } 
end
