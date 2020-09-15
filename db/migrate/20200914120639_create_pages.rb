class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :text
      t.string :image
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
