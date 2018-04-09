class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  get '/landmarks/new' do
    erb :"/figures/new"
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    @figure.titles.build(params[:title]) if !params[:title][:name].empty?
    @figure.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    @figure.save
    redirect "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.titles.build(params[:title]) if !params[:title][:name].empty?
    @figure.landmarks.build(params[:landmark]) if !params[:landmark][:name].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
