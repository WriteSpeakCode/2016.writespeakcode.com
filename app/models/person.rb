class Person < ActiveRecord::Base
  has_many :talk_speakers
  has_many :talks, through: :talk_speakers

  validates :name, presence: true
  validates :email, presence: true, email: true

  scope :displayable, -> { where(display: true) }
  scope :speakers_and_mentors, -> { where(mentor: true).order(:name) }

  def self.keynote_speakers
    joins(:talk_speakers).joins(:talks).where("talks.keynote = true")
  end

  def slug
    name.parameterize
  end

end
