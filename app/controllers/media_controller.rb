class MediaController < ApplicationController
  def index
    run Media::Operation::Index, params: params do |ctx|
      render json: represent(Media::Representer::Index, ctx)
    end
  end

  def show
    run Media::Operation::Show, params: params do |ctx|
      render json: represent(Media::Representer::Show, ctx)
    end
  end

  def create
    run Media::Operation::Create, params: params do |ctx|
      render json: represent(Media::Representer::Create, ctx)
    end
  end

  def update
    run Media::Operation::Update, params: params do |ctx|
      render json: represent(Media::Representer::Update, ctx)
    end
  end

  def destroy
    run Media::Operation::Destroy, params: params do |ctx|
      render json: represent(Media::Representer::Destroy, ctx)
    end
  end
end
