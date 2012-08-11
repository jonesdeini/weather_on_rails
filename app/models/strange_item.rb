class StrangeItem < Item

  def search(json)
    ItemSearch::quality_search(json, self)
  end

end
