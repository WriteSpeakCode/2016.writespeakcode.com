class Talk < ActiveRecord::Base
  enum session_type: [:talk, :panel, :mentoring, :curriculum, :announcement, :break]
  enum day: [:write, :speak, :code, :career]

  has_many :talk_speakers
  has_many :people, through: :talk_speakers

  scope :talks, -> { where_session_type(:talk) }
  scope :keynotes, -> { where(keynote: true) }
  scope :default_order, -> { order(keynote: :desc).order(:title) }

  validates :title, presence: true
  validates :session_type, presence: true
  validates :day, presence: true

  def slug
    title.parameterize
  end

  private

  def self.where_session_type(session_type)
    where("session_type = ?", Talk.session_types[session_type])
  end

  def self.where_day(day)
    where("day = ?", Talk.days[day])
  end

  def self.hour
    self.start_date.to_formatted_s
  end
end
