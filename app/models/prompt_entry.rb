class PromptEntry < ApplicationRecord
  validates :prompt, presence: true

  after_create :feed_to_prompt

  broadcasts_to ->(prompt_entry) { "prompt_entries" }, inserts_by: :prepend

  private
    def feed_to_prompt
      ProcessPromptJob.perform_later self
    end
end
