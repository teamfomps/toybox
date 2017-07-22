class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all.order('created_at DESC')
  end
end
