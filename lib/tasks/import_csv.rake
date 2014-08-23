namespace :words do
  desc 'import csv file with words'
  task :import_csv, [:file] => :environment do |t, args|
    require 'csv'
    # raise 'need to specify file to import' unless args.file && File.exists?(args.file)
    CSV.foreach(args.file) do |row|
      Word.create!(original: row[1], word_index: row[0].to_i)
    end
  end

end