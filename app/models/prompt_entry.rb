class PromptEntry < ApplicationRecord
  validates :prompt, presence: true

  after_create :feed_to_prompt

  private
    def feed_to_prompt
      ProcessPromptJob.perform_later self
    end
end
