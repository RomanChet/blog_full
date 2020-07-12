class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.transliterate(:russian).normalize.to_s
  end

  has_many :comments, dependent: :destroy

  validates :name, presence: true,
                    length: { minimum: 5 }
end
