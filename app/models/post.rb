require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validate  :is_clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }

  def is_clickbait?
    return false unless title.present?

    unless ["Won't Believe", 'Secret', 'Top', 'Guess'].any? { |string| title.include?(string) }
      errors.add(:title, 'is not click-baitey enough!')
    end
  end
end
