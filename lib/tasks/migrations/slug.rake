namespace :migration do
  desc 'Generates slugs for all the existing places'
  task slug: :environment do
    Place.record_timestamps = false

    count = Place.where(slug: nil).each do |place|
      place.save!
    end.size

    puts "Generated slug for #{count} places"
  end
end
