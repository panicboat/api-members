module Media::Operation
  class Create < Abstract::Operation
    step Model(::Medium, :new)
    step Contract::Build(constant: Media::Contract::Create)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :uuid!
    step Contract::Persist()
  end
end
