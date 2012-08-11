class Crate < Item

  def search(json)
    ItemSearch::crate_search(json, self)
  end

end
