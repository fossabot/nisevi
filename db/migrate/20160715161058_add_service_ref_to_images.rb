class AddServiceRefToImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :service, foreign_key: true
  end
end
