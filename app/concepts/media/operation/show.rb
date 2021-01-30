module Media::Operation
  class Show < Abstract::Operation
    step Model(::Medium, :find_by)
    step Contract::Build(constant: Media::Contract::Show)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :scrape!
    step Contract::Persist(method: :sync)
  end
end
