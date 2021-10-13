ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description, :image, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :image, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :title, :name, :description, :publish_date, :image
  index do
    column :title
    column :description
    column "image" do |f|
      image_tag(f.image_url, height:"50", width: "50") rescue nil

    end
    column :created_at
    column :updated_at
    column :user

    actions
  end
end
