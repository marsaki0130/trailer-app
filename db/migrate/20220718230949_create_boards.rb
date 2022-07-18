class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.text :introduction
      t.timestamps
    end
  end
end
