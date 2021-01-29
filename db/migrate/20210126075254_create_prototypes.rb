class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|

      t.timestamps
      t.string  :content
      t.string  :catch_copy
      t.string  :concept
      t.binary  :image
      t.references :user, foreign_key: true
    end
  end
end
