class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true

  scope :displayable, -> { where(display: true) }
  scope :speakers_and_mentors, -> { where(mentor: true).order(:name) }

  def slug
    name.parameterize
  end
end
