class PromptEntry < ApplicationRecord
  validates :prompt, presence: true
end
