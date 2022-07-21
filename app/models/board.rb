class Board < ApplicationRecord
  belongs_to :user
  has_one :profile
  has_many_attached :eyecatch
end
