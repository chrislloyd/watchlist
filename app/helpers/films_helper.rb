module FilmsHelper

  def film_status(film)
    if film.watched?
      'watched'
    else
      'inactive'
    end
  end

end
