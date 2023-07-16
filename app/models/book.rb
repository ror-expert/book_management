class Book < ApplicationRecord

  validates :name, presence: true

  belongs_to :library
  has_many :books_users, dependent: :destroy
  has_many :users, through: :books_users

  scope :with_checkedout, -> { includes(books_users: :user).where(books_users: { returned_at: nil } ) }

  def available?
    books_users.blank?
  end

  def allocated_at
    books_users.last&.allocated_at
  end

end
