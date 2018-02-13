class RemovePaperclipFromImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :image_file_name
    remove_column :images, :image_content_type
    remove_column :images, :image_file_size
    remove_column :images, :image_updated_at
    add_column     :images, :image_url, :string
  end
end
