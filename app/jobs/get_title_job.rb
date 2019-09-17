class GetTitleJob < ApplicationJob
  @queue = :general

  def perform(params)
    agent = Mechanize.new()
    agent.follow_meta_refresh = true
    page = agent.get(params.original_url)
    params.update! title: page.title
  end
end
