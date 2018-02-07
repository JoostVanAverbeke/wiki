class AuthorsDatatable
  def initialize(params)
    @params = params
  end

  def as_json(options = {})
    {
        total_items: total_items,
        number_of_items: number_of_items,
        items: items
    }
  end

# TODO(JVA) make it private
  def items
    authors
  end

  private

  def total_items
    authors
    @total_items
  end

  def number_of_items
    authors.length
  end

  def authors
    @authors ||= fetch_authors
  end

  def fetch_authors
    authors = lookup_authors.page(page).per_page(limit)
  end

  def lookup_authors
    authors = Author.filter(@params.slice(:surname, :starts_with))
                       .order("#{sort_column} #{sort_direction}")
    @total_items = authors.length
    authors
  end

  def page
    @params[:page] && @params[:page].to_i > 0 ?  @params[:page].to_i : 1
  end

  def limit
    @params[:limit] && @params[:limit].to_i > 0 ? @params[:limit].to_i : 10
  end

  def sort_column
    @params[:sort_column] ? @params[:sort_column] : "surname"
  end

  def sort_direction
    @params[:sort_direction] == "desc" ? "desc" : "asc"
  end
end