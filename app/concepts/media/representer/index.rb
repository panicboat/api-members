module Media::Representer
  class Index < Abstract::Representer
    collection :Media, decorator: Show
  end
end
