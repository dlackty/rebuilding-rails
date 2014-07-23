class QuotesController < Rulers::Controller
  def index
    @quotes = FileModel.all
    render :index
  end

  def new
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is worth one k pixels",
      "attribution" => "Me"
    }
    @obj = FileModel.create attrs
    render :quote
  end

  def a_quote
    render :a_quote, noun: :winking
  end

  def show
    @quote = FileModel.find(params["id"])
    @ua = request.user_agent
    render :quote
  end

  def exception
    raise "It's a bad one!"
  end
end
