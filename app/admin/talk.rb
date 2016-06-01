ActiveAdmin.register Talk do

  permit_params :title, :description,
    :session_type, :day,
    :first_year_track, :alumna_track,
    :keynote

  index do
    column :id
    column :title
    column :session_type
    column :day
    column :first_year_track
    column :alumna_track
    column :keynote
    actions
  end
end
