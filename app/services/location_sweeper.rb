class LocationSweeper
  def clear_database_after_download
    Location.destroy_all
  end
end
