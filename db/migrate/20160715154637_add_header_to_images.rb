class AddHeaderToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :header, :boolean
  end
end
