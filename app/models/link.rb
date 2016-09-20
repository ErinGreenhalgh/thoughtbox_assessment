class Link < ApplicationRecord
  belongs_to :user
  validates :url, url: true
  validates :url, presence: true
end
