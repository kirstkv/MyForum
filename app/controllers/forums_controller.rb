class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @forum = Forum.find(params[:id])
    @topics = Topic.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/new
  # GET /forums/new.json
  def new
    @forum = Forum.new
    @topics = Topic.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
    @topics = Topic.all
  end

  # POST /forums
  # POST /forums.json
  def create
      @subject = Subject.find(params[:subject_id])
      @forum = @subject.forums.create(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to subject_path(@subject), notice: 'Forum was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.json
  def update

    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
      @subject = Subject.find(params[:subject_id])
      @forum = @subject.forums.find(params[:id])
      @forum.destroy
      redirect_to subject_path(@subject)
    end
end
