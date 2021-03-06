class PostsController < ApplicationController
  
  # GET /posts
  # GET /posts.json
  def index
    if (params[:page])
      @page = params[:page].to_i
      if params[:sort_by]
        sort_by = params[:sort_by]
      else
        sort_by = "created_at"
      end

      per_page = 6
      offset = (@page - 1) * per_page

      if params[:sort_by] == "distance"
        lat = params[:lat]
        lng = params[:lng]      
        @posts = Post.find_by_sql(["
          SELECT *, ACOS(SIN(posts.lat)*SIN(?)+COS(posts.lat)*COS(?)*COS(posts.lng-?))*6371        
          as distance FROM posts ORDER BY distance ASC LIMIT 100", lat, lat, lng])      
      else
         @posts = Post.offset(offset).limit(per_page).order("#{sort_by} DESC")
      end
    else
      @posts = Post.order('created_at DESC')
    end    
    
    #if @page == 1 
    #  per_page = 5
    #else 
    #  per_page = 6
    #end 

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render :json => @posts.to_json(:only => [:id, :title, :text, :lat, :lng, :created_at, :post_type, :likes], 
        :methods => [:image_url, :video_url], 
        :include => [:comments])
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @post }
      format.json do
        render :json => @post.to_json(:only => [:id, :title, :text, :lat, :lng, :created_at, :post_type, :likes], 
        :methods => [:image_url, :video_url], 
        :include => [:comments])
      end
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
  #raise params.inspect
    
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
