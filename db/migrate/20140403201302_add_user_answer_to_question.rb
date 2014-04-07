class AddUserAnswerToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_answer, :boolean
  end
end
