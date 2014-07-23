class QuotesController < Rulers::Controller
  def index
    quotes = FileModel.all
    render :index, quotes: quotes
  end

  def new
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, obj: m
  end

  def a_quote
    render :a_quote, noun: :winking
  end

  def show
    quote_1 = FileModel.find(params["id"])
    render :quote, obj: quote_1
  end

  def exception
    raise "It's a bad one!"
  end
end
