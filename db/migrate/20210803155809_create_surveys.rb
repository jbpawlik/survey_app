class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.column(:name, :varchar)
      t.column(:topic, :varchar)

      t.timestamps()
    end
  end
end
