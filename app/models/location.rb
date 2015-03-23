class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      address = row["address"]
      if is_not_duplicate?(address)
        Location.create!(address: row["address"])
      end
    end
  end

  def self.is_not_duplicate?(address)
    Location.where(address: address).empty?
  end
end
