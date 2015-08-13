class StaticPagesController < ApplicationController
  def home
    @user=User.new
    @news = News.all
  end
  
  def subject_assignments
      
  end
  
  def help
  end

  def about
  end
  
  def contact
  end
  def admission
    
  end
end
