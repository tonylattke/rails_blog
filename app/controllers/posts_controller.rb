class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :year]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to posts_path
  end

  def year
    all_posts = Post.all
    @posts = []
    year = params[:id].to_i
    all_posts.each do |post|
      if year == post.created_at.year
        @posts.push(post)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :text)
    end

    def get_years
      posts = Post.all
      @years = []  
      if !posts.empty?
        newer_year = posts[0].created_at.year
        older_year = posts[-1].created_at.year
        if older_year != newer_year
          more_years =* (older_year..newer_year)
          more_years.each do |aux|
            @years.push(aux)
          end
        else
          @years.push(newer_year)
        end
      end      
    end

end
