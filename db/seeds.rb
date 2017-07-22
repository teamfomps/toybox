db = Mysql2::Client.new(host: '127.0.0.1',
                        username: 'root',
                        database: 'jpearson_toybox')

binding.pry

# # import genres
# Category.destroy_all
# results = db.query('SELECT * FROM `recordings_genre`')
# results.each do |row|
#   Category.create(name: row['name'])
# end
#
# # import albums
#
# def create_album(row)
#   adult_slugs = ["come-share-fire",
#            "fax-yourself-jesus",
#            "from-the-heart-of-scandinavia",
#            "heartwood",
#            "bluegrass-gospel"]
#
#   a = Album.new
#   a.slug = row['slug']
#   a.title = row['name']
#   a.short_description = row['short_description']
#   a.long_description = row['long_description']
#   a.for_sale = row['active'] == 1
#   a.published = row['active'] == 1
#   a.category = adult_slugs.include? row['slug'] ? Category.last : Category.first
#
#   File.open(Rails.root.join('db/seed_assets/' + row['picture'])) do |f|
#     a.cover_art = f
#   end
#
#   a.save!
# end
#
# Album.destroy_all
# results = db.query('SELECT * FROM product_product a LEFT JOIN product_productimage img ON (a.id = img.product_id) WHERE items_in_stock > 5;')
# results.each do |row|
#   create_album(row)
# end
#
# # import songs
#
# def create_song(row)
#   s = Song.new
#   s.slug = row['slug']
#   s.title = row['title']
#   s.track_number = row['track_number']
#   s.album = Album.find_by(slug: row['album'])
#   s.lyrics = row['lyrics']
#   s.credits = row['credits']
#
#   File.open(Rails.root.join('db/seed_assets/' + row['audio_file'])) do |f|
#     s.audio_file = f
#   end
#
#   s.save!
# end
#
# Song.destroy_all
# results = db.query('SELECT s.title, s.slug, s.track_number, s.lyrics, s.audio_file, s.credits, p.slug AS album FROM songs_song s INNER JOIN product_product p ON (s.product_id = p.id)')
# results.each do |row|
#   create_song(row)
# end



# import instruments
def create_instrument(row)
  a = Instrument.new
  a.slug = row['slug']
  a.name = row['name']
  a.short_description = row['short_description'] || ''
  a.long_description = row['long_description'] || ''
  a.for_sale = row['active'] == 1
  a.published = row['active'] == 1

  File.open(Rails.root.join('db/seed_assets/' + row['picture'])) do |f|
    a.picture = f
  end

  a.save!
end

results = db.query('SELECT * FROM product_product a LEFT JOIN product_productimage img ON (a.id = img.product_id) WHERE items_in_stock < 10;')
results.each do |row|
  create_instrument(row)
end

# import calendar_dates
Event.destroy_all
results = db.query('SELECT * FROM events_event;')
results.each do |row|
  row['open_to_public'] = row['open_to_public'] == 1
  row['publish'] = row['publish'] == 1
  Event.create(row)
end

# import news_items
NewsItem.destroy_all
results = db.query('SELECT * FROM news_newsitem;')
results.each do |row|
  n = NewsItem.new
  n.title = row['title']
  n.body = row['body']
  n.created_at = row['timestamp']
  n.updated_at = Time.zone.now
  n.save!
end
