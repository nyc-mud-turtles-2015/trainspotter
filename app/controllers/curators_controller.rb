class CuratorsController < MainController

  def index
    @curators = Curator.all
  end
end
