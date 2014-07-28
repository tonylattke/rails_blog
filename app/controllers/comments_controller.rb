class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:comment][:post])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:name, :text)
      #params.require(:comment).permit(:name, :text, :post_id)
    end
end
