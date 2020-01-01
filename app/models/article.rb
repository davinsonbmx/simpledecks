class Article < ActiveRecord::Base
  #pertenece a, tiene dependencia con el usuario
  belongs_to :user
  validates :title, presence: true,
			   length: {minimum: 1, maximum: 50}
end
