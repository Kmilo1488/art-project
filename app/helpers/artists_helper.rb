module ArtistsHelper
  def form_artist
    @artist.new_record? ? "New Artist" : "Edit Artist"
  end
end
