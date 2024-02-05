class ProcessPromptJob < ApplicationJob
  queue_as :default

  def perform(prompt_entry)
    puts prompt_entry
    puts "I am job"
  end
end
