class SearchsController < ApplicationController

  def search
   @model = params["model"]
   @content = params["content"]
   @method = params["method"]
   @records = search_for(@model, @content, @method)

  end

  private
  def search_for(model, content, method)
   if model == 'user'
    if method == 'perfect'
     User.where(name: content)
    elsif method == 'forward'
     User.where('name LIKE?', content+'%')
    elsif method == 'backward'
     User.where('name LIKE?', '%'+content)
    else
     User.where('name LIKE ?', '%'+content+'%')
    end
   elsif model == 'post'
    if method == 'perfect'
     Post.where(title: content)
    elsif method == 'forward'
     Post.where('title LIKE?', content+'%')
    elsif method == 'backward'
     Post.where('title LIKE?', '%'+content)
    else
     Post.where('title LIKE ?', '%'+content+'%')
    end
   elsif model == 'question'
    if method == 'perfect'
     Question.where(title: content)
    elsif method == 'forward'
     Question.where('title LIKE?', content+'%')
    elsif method == 'backward'
     Question.where('title LIKE?', '%'+content)
    else
     Question.where('title LIKE ?', '%'+content+'%')
    end
   end
  end

end
