require 'csv'

namespace :import do
  desc 'Import catalog from CSV'
  task catalog: :environment do
    filename = 'data/catalog.csv'
    counter_total = counter_imported = 0
    CSV.foreach(filename, headers: true) do |row|
      title = row['TITLE']
      alt_title = row['ALT_TITLE']
      info = row['INFO']
      language = row['LANGUAGE']
      episodes = row['EPISODES']
      discs = row['DISCS'].to_i
      details = row['DETAILS']
      genre = row['GENRE']

      item = Item.create(title: title,
                         alt_title: alt_title,
                         info: info,
                         language: language,
                         episodes: episodes,
                         discs: discs,
                         details: details,
                         genre: genre)

      counter_total += 1
      counter_imported += 1 if item.persisted?
    end

    puts 'Import finished.'
    puts "Total items in catalog: #{counter_total}."
    puts "Total items imported: #{counter_imported}"
  end
end
