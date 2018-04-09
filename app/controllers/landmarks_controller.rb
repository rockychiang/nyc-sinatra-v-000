class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.titles.build(params[:title]) if !params[:title][:name].empty?
    @landmark.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    @landmark.save
    redirect "/landmarks"
  end

  get '/figures/:id' do
    @landmark = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @landmark = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  post '/figures/:id' do
    @landmark = Figure.find(params[:id])
    @landmark.update(params[:figure])
    @landmark.titles.build(params[:title]) if !params[:title][:name].empty?
    @landmark.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    @landmark.save
    redirect "/figures/#{@landmark.id}"
  end

end
