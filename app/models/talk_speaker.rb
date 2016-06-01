class TalkSpeaker < ActiveRecord::Base
  enum speaker_role: [:speaker, :moderator, :panelist, :mentor]

  belongs_to :talk
  belongs_to :person
end
