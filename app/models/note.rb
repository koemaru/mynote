class Note < ApplicationRecord
  has_many :pages
  belongs_to :user
  validates :name , presence: true, uniqueness: true
end
