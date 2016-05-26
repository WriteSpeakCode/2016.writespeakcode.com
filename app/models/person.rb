class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true

  scope :displayable, -> { where(display: true) }

  def slug
    name.parameterize
  end
end
