module ApplicationHelper
  def cart_item_uri(order_item)
    m = order_item.item_model
    if m.class.name == 'Album'
      return album_path(m)
    else
      return instrument_path(m)
    end
  end
end
