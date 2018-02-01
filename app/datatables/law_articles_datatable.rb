class LawArticlesDatatable
  
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
    law_articles
  end
  
  private

  def total_items
    law_articles
    @total_items
  end

  def number_of_items
    law_articles.length
  end

  def law_articles
    @law_articles ||= fetch_law_articles
  end

  def fetch_law_articles
    law_articles = lookup_law_articles.page(page).per_page(limit)
  end

  def lookup_law_articles
    law_articles = LawArticle.filter(@params.slice(:law, :starts_with))
                .order("#{sort_column} #{sort_direction}")
    @total_items = law_articles.length
    law_articles
  end

  def page
    @params[:page] && @params[:page].to_i > 0 ?  @params[:page].to_i : 1
  end

  def limit
    @params[:limit] && @params[:limit].to_i > 0 ? @params[:limit].to_i : 10
  end

  def sort_column
    @params[:sort_column] ? @params[:sort_column] : "law"
  end

  def sort_direction
    @params[:sort_direction] == "desc" ? "desc" : "asc"
  end
end