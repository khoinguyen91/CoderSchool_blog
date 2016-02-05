class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  attr_accessible :title, :body, :tag_list
  acts_as_taggable
  is_impressionable
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title LIKE ? or body LIKE ?", "%{query}%", "%#{query}%")
  end
end
