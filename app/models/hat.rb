class Hat < Item

  def search(json)
    ItemSearch::basic_search(json, self)
  end

end
