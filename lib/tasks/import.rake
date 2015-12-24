require 'csv'

namespace :import do
  desc 'Import catalog from CSV'
  task catalog: :environment do
    filename = 'data/catalog_sample.csv'
    counter_total = counter_imported = 0
    CSV.foreach(filename, headers: true) do |row|
      title = row['TITLE']
      alt_title = row['ALT_TITLE']
      info = row['INFO']
      languages = row['LANGUAGE']
      episodes = row['EPISODES']
      discs = row['DISCS'].to_i
      details = row['DETAILS']
      genres = row['GENRE']

      item = Item.create(title: title,
                         alt_title: alt_title,
                         info: info,
                         episodes: episodes,
                         discs: discs,
                         details: details)

      genres = genres.split('/')
      genres.each do |g|
        g.strip!
        genre = Genre.find_or_create_by(name: g)
        item.genres << genre unless genre.nil?
      end
      
      languages = languages.split('/')
      languages.each do |l|
        l.strip!
        language = Language.find_or_create_by(name: l)
        item.languages << language unless language.nil?
      end
      
      front_cover_file = "data/covers/%05d_front.jpg" % [item.id]
      back_cover_file = "data/covers/%05d_back.jpg" % [item.id]
      
      if File.file? front_cover_file
        item.front = File.new(front_cover_file)
      end
      
      if File.file? back_cover_file
        item.back = File.new(back_cover_file)
      end
      
      item.save!
      
      puts "#{item.id}"

      counter_total += 1
      counter_imported += 1 if item.persisted?
    end

    puts 'Import finished.'
    puts "Total items in catalog: #{counter_total}."
    puts "Total items imported: #{counter_imported}"
  end
end
