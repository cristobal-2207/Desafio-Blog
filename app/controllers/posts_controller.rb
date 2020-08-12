class PostsController < ApplicationController

  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", except: :index

  def new
  
    @post=Post.new
    
  end

  def create

    @post=Post.create(title: params[:post][:title],date: params[:post][:date],image_url: params[:post][:image_url],content: params[:post][:content]) 
    @post.email = params[:post][:email].gsub('spoiler', '')
		if @post.save
			flash[:notice] = 'Usuario creeado exitosamente'
			redirect_to posts_index_path
		else
			flash[:error] = 'Ocurrió un error creando el usuario'
			redirect_to posts_new_path
		end
    
	end

  def index

    @posts=Post.all
    @posts=Post.order(id: :desc)

  end

end