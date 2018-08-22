class Admin::WordsController < AdminController
  def index
    @category = Category.find(params[:category_id])
    @word = @category.words
  end

  def show

  end
  
  def new
    category = Category.find(params[:category_id])
    @word = category.words.build
    3.times {
      @word.choices.build
    }
  end

  def create
    category = Category.find(params[:category_id])
    @word = category.words.build(word_params)
      if @word.save
        redirect_to admin_category_words_url
      else
        render 'new'
      end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    3.times {
      @word.choices
    }
  end

  def update
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
      if @word.update(word_params)
        redirect_to admin_category_words_url
      else
        render 'edit'
      end
  end

  def destroy
    category = Category.find(params[:category_id])
    word = category.words.find(params[:id])
    word.destroy
    flash[:notice] = 'Word deleted.'
    redirect_to admin_category_words_url
  end

  private


  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct])
  end

end
