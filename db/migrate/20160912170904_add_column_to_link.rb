class AddColumnToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :status, :string, default: "false"
  end
end
