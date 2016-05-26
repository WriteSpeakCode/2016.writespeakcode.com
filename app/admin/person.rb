ActiveAdmin.register Person do

  permit_params :name, :email, :phone, :bio, :pronouns, :image_filename,
    :twitter, :website, :linkedin, :github, :job_title, :company,
    :mentor, :organizer, :display

  index do
    column :name
    column :email
    column :phone
    column :mentor
    column :organizer
    column :display
    actions
  end

end
