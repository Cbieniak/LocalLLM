class PromptEntriesController < ApplicationController
  def index
    @prompts = PromptEntry.all
  end

  def show
    @prompt_entry = PromptEntry.find(params[:id])
  end

  def new
    @prompt_entry = PromptEntry.new
  end

  def create
    @prompt_entry = PromptEntry.new(prompt_entry_params)

    if @prompt_entry.save
      redirect_to @prompt_entry
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
      def prompt_entry_params
        params.require(:prompt_entry).permit(:prompt)
      end
end
