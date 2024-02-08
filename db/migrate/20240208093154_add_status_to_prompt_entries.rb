class AddStatusToPromptEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :prompt_entries, :status, :integer, default: 0
  end
end
