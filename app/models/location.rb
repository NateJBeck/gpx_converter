class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      street_num = row["STNUM"]
      street = row["STREET"].to_s.downcase.titleize
      city = row["CITY"].to_s.downcase.titleize

      address = "#{ street_num } #{ street}, #{ city } Massachusetts"

      if is_not_duplicate?(address)
        Location.create!(address: address)
      end
    end
  end

  def self.is_not_duplicate?(address)
    Location.where(address: address).empty?
  end
end
