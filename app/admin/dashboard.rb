ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
     columns do
       column do
         panel "Recent People" do
           ul do
             Person.all.each do |person|
               li link_to(person.name, admin_person_path(person))
             end
           end
         end
       end

       column do
         panel "Helpful Links" do
           para do
             link_to("Add & edit people for Write/Speak/Code 2016", admin_people_path)
           end
         end
       end
     end
  end # content
end
