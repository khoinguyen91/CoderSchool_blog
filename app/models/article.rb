class Article < ActiveRecord::Base
	  def self.search(search)
  	where('name ~ ?', '%#{search}%') 
 	where('content ~ ?', '%#{search}%')
end
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

end
