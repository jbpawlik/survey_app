class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column(:question, :varchar)
      t.column(:survey_id, :int)
      t.column(:answer, :varchar)
      
      t.timestamps()
    end
  end
end
