class Article < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  attr_accessible :title, :body, :tag_list
  acts_as_taggable
  is_impressionable
  def self.search(search)
  	if search 
  		where('title like ?', '%#{search}%') 
 		where('body like ?', '%#{search}%')
 	else
 		all
   	end
  end
end
