ActiveAdmin.register Talk do

  permit_params :title, :description,
    :session_type, :day, :start_time,
    :first_year_track, :alumna_track,
    :keynote

  index do
    column :id
    column :title
    column :session_type
    column :day
    column :start_time
    column :first_year_track
    column :alumna_track
    column :keynote
    actions
  end
end
