class Category < ApplicationRecord
  has_many :blog_categories
  has_many :blogs, through: :blog_categories

  validates :name, presence: true, length: {minimum:5, maximum:20}
  validates_uniqueness_of :name, { case_sensitive: false }


end
