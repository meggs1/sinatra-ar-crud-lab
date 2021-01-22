
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do # 1 read
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do # 2 create
    @article = Article.new
    erb :new
  end

  post '/articles' do # 2 create
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do # 1 read 
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do # 3 update
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do # 3 update
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
  end

  
end
