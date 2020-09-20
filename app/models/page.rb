class Page < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Page.where('text LIKE(?)', "%#{search}%")
    else
      Page.all
    end
  end
end
