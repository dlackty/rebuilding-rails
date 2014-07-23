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
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, obj: quote, ua: ua
  end

  def exception
    raise "It's a bad one!"
  end
end
