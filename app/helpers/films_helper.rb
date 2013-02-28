module FilmsHelper

  def film_status(film)
    if film.seen?
      ''
    else
      'inactive'
    end
  end

end
