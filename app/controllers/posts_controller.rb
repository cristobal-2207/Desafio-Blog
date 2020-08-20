class PostsController < ApplicationController

  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", except: :index

  def index

    @posts=Post.all
    @posts=Post.order(id: :desc)

  end

  def new
  
    @post=Post.new
    
  end

  def create

    @post=Post.create(title: params[:post][:title],date: params[:post][:date],image_url: params[:post][:image_url],content: params[:post][:content]) 
    @post.content = params[:post][:content].gsub('spoiler', '')
    if @post.save
      flash[:notice]=" Post publicado" 
      redirect_to posts_path # notice:"Usuario creado exitosamente."
    else
      flash[:error]="Ocurrio un error Guardando el Post" 
			redirect_to posts_path # error:"Ocurrió un error creando el usuario."
		end
    
	end

end