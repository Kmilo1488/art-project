module ArtsHelper

  def form_art
    @art.new_record? ? "New Art" : "Edit Art"
  end
  
end
