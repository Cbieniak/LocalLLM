require 'open3'

class ProcessPromptJob < ApplicationJob
  queue_as :default

  def perform(prompt_entry)
    prompt_entry.update(status: "processing")
    stdout, status = Open3.capture2("python3 phixtral/generate.py --model mlabonne/phixtral-4x2_8 --max-tokens 100 --prompt \"#{prompt_entry.prompt}\"")
    prompt_entry.update(response: stdout, status: "processed")
  end
end
