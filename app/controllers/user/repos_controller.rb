class User::ReposController < ApplicationController

  def index
    @repos = Repository.all(current_user)
    binding.pry
  end

end
