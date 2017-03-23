class AddHoneypotToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :honeypot, :string
  end
end
