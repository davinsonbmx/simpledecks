class Article < ActiveRecord::Base
  #pertenece a, tiene dependencia con el usuario
  belongs_to :user
  has_many :Comments, dependent: :destroy
  
  validates :title, presence: true,
			   length: {minimum: 1, maximum: 50}
end
