class AddsDescriptionToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :description, :string
    add_column :addresses, :created_at, :timestamp
    add_column :addresses, :updated_at, :timestamp
  end
end
