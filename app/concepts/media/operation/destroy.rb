module Media::Operation
  class Destroy < Abstract::Operation
    step Model(::Medium, :find_by)
    step Contract::Build(constant: Media::Contract::Destroy)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :scrape!
    step :model!

    def model!(ctx, model:, **)
      model.destroy
    end
  end
end
