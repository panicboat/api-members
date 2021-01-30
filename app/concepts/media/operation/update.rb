module Media::Operation
  class Update < Abstract::Operation
    step Model(::Medium, :find_by)
    step Contract::Build(constant: Media::Contract::Update)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :scrape!
    step Contract::Persist()
  end
end
