class User < ApplicationRecord

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true

  has_many :books_users, dependent: :destroy

end
