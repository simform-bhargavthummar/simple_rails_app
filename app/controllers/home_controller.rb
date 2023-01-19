class HomeController < ApplicationController
  def index
      
      @name = "Kishan"
      @company_name = "Simform Solution"
      @collage_name = "Parul University" 
      @hobbies = ["Reading Books","Learning"]
      @current_learning = ["Ruby on Rails(ROR)","Hacking"]
      @current_hacking_framework = "Reverse Engineering"
      
  end

  def hello
    @world = "World"
  end
end
