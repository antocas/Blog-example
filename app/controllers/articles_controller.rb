class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :destroy, :update]
	#http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def new
		@article = Article.new
	end


	def create
		@article = Article.new(article_params)
		@article.user = current_user

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
	end


	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end


	def edit
	end


	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy

		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

	def set_article
		@article = Article.find(params[:id])
	end

	def require_same_user
		if current_user != @article.user && !current_user.admin?
			flash[:danger] = "You can only edit or delete your own articles"
			redirect_to root_path
		end
	end
end
