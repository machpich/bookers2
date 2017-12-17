class Book < ApplicationRecord
  validates :body, length: { maximum: 200 };

	belongs_to :user
end
