class Talk < ActiveRecord::Base
  enum session_type: [:talk, :panel, :mentoring, :curriculum, :announcement, :break]
  enum day: [:write, :speak, :code, :career]

  has_many :talk_speakers
  has_many :people, through: :talk_speakers

  scope :talks, -> { where_session_type(:talk) }
  scope :default_order, -> { order(keynote: :desc).order(:day).order(:start_time) }
  scope :keynotes, -> { where(keynote: true).default_order }

  validates :title, presence: true
  validates :session_type, presence: true
  validates :day, presence: true

  def slug
    title.parameterize
  end

  def all_tracks?
    alumna_track && first_year_track
  end

  def alumna_only?
    alumna_track && !first_year_track
  end

  def first_year_only?
    first_year_track && !alumna_track
  end

  def self.where_session_type(session_type)
    where("session_type = ?", Talk.session_types[session_type])
  end

  def self.where_day(day, include_keynote = false)
    scope = where("day = ?", Talk.days[day])
    scope.where(keynote: false) unless include_keynote
    scope
  end

end
