class AnnotationsController < ApplicationController
  def create
    video = Video.find(annotation_params[:video])
    product = Product.find(annotation_params[:product])
    @annotation = Annotation.new(
      video: video,
      product: product,
      time_start: annotation_params[:time_start],
      time_end: annotation_params[:time_end]
    )
    @annotation.save
    redirect_to video_path(video)
  end

  def new
    @annotation = Annotation.new
  end

  private

  def annotation_params
    params.require(:annotation).permit(:video, :product, :time_start, :time_end)
  end
end
