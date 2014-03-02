class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.text :content
      t.boolean :right

      t.timestamps
    end
  end
end
