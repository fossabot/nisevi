class AddAttributesToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :service, :boolean
    add_column :images, :porfolio, :boolean
    add_column :images, :article, :boolean
  end
end
