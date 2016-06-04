ActiveAdmin.register TalkSpeaker do
  permit_params :talk_id, :person_id, :order

  index do
    selectable_column
    column "Talk" do |ts|
      link_to ts.talk.title, admin_talk_path(ts.talk)
    end
    column "Speaker" do |ts|
      link_to ts.person.name, admin_person_path(ts.person)
    end
    column :order
    column :speaker_role
    actions
  end
end
