class AddHiddenToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :hidden, :boolean, default: false
  end
end
