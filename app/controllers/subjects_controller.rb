class SubjectsController < ApplicationController
require 'will_paginate/array'
  
  before_filter :authenticate_user!, :except => [:show, :index]
  # GET /subjects
  # GET /subjects.json
  def most_recent_post  
    newforum = Forum.find(:conditions => ['forum_id = ?', self.id])  
    return newforum  
  end  
  
  
  def index
    @subjects = Subject.paginate(:page => params[:page], :per_page =>10)
    @users=User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])
    @forums = @subject.forums
    @users=User.all
    if params[:search]

      a= @forums.find(:all, :joins => :topics, :conditions => ['content LIKE ? OR topics.title LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%"])
      b= @forums.find(:all, :conditions => ["title LIKE ?", "%#{params[:search]}%"])
      c= @forums.find(:all, :conditions => ["name LIKE ?", "%#{params[:search]}%"])
      @forums=a+b+c
      @forums = @forums.uniq
      
    end
    @forums = @forums.to_a.paginate(:page => params[:page], :per_page =>10)
    @subject.forums.each do |f|
      y=Time.at(0)
      f.topics.each do |tim|
        if tim.updated_at>y
          y=(tim.updated_at)
        end
      end  
      f.newpost=y
      f.save  
    end  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render json: @subject, status: :created, location: @subject }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end
end
