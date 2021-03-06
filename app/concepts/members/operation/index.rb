module Members::Operation
  class Index < Abstract::Operation
    step Model(::Member)
    step Contract::Build(constant: Members::Contract::Index)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :model

    def model(ctx, **)
      contract = ctx[:"contract.default"]
      data = scrape(ctx).paging(contract.limit, contract.offset).order(contract.order)
      ctx[:model] = OpenStruct.new({ Members: data })
    end
  end
end
