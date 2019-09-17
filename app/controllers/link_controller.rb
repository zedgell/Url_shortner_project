class LinkController < ApplicationController

  def index
    @top = Link.order("total_count DESC").order("updated_at DESC").limit(100)
    render json: @top
  end

  def show
    @yourlink = Link.order("updated_at DESC").limit(1)
  end

  def create
    url = params[:link][:original_url]
    url = "https://#{url}" if !url_valid?(url)
    @ex_url = exiting_url(url)
    if @ex_url
      @ex_url.increment(:total_count)
      @ex_url.save!
      redirect_to @ex_url
    else
      begin
        response = HTTParty.get(url)
        flash[:warnings] = 'The url is not secure' if url.split('://')[0].length < 5
        @link = Link.new(original_url: url)
        @link.increment(:total_count)
        if @link.save
          flash[:success] = 'Your url was successfully shortened'
          GetTitleJob.perform_now(@link)
          redirect_to @link
        else
          redirect_to 'link/index'
        end
      rescue => ex
        flash[:error] = 'The url can not be verified!'
        redirect_to '/'
      end
    end
  end

  def send_to_url
    id= params[:short_url].to_i(36)
    link = Link.find(id)
    redirect_to link.original_url
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def url_valid?(url)
    url = URI.parse(url) rescue false
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end

  def exiting_url(url)
    Link.all.each do |link|
      if link.original_url.downcase.gsub(/(https?:\/\/)|(http?:\/\/)|(www\.)/ , "") == url.downcase.gsub(/(https?:\/\/)|(http?:\/\/)|(www\.)/ , "")
        return link
      end
    end
    return false
  end
end