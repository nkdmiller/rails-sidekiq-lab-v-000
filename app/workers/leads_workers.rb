class LeadsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(leads_file)
   CSV.foreach(params[:file].path, headers: true) do |song|
      Song.create(title: song[0], artist_id: Artist.find_or_create_by(name: song[1]).id)
    end
  end
end