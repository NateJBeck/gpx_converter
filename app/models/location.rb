class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Location.create!(address: row["address"])
    end
  end
end
