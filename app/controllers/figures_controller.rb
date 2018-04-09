class FiguresController < ApplicationController

  get '/figures' do
    erb :"/figures/index"
  end

  get '/figures/new' do
    erb :"/figures/new"
  end

  post '/figures' do
    raise params.inspect
    @figure = Figure.new(params)
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"/figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"/figures/edit"
  end

end
