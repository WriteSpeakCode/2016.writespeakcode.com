class Talk < ActiveRecord::Base
  enum session_type: [:talk, :panel, :mentoring, :curriculum, :announcement, :break]
  enum day: [:write, :speak, :code, :career]

  validates :title, presence: true
  validates :session_type, presence: true
  validates :day, presence: true
end
