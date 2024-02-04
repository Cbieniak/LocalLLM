class CreatePromptEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :prompt_entries do |t|
      t.string :prompt
      t.text :response

      t.timestamps
    end
  end
end
