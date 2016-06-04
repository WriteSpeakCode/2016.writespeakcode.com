class Person < ActiveRecord::Base
  has_many :talk_speakers
  has_many :talks, through: :talk_speakers

  validates :name, presence: true
  validates :email, presence: true, email: true

  scope :displayable, -> { where(display: true) }

  def self.speakers_and_mentors(include_keynotes = true)
    scope = where(mentor: true).order(:name)
    scope.where(keynote: false) unless include_keynotes
    scope
  end

  def self.keynote_speakers
    joins(:talk_speakers).joins(:talks).where("talks.keynote = true").distinct
  end

  def slug
    name.parameterize
  end

end
