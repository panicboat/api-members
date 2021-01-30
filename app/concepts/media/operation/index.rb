module Media::Operation
  class Index < Abstract::Operation
    step Model(::Medium)
    step Contract::Build(constant: Media::Contract::Index)
    step Contract::Validate()
    fail :invalid_params!
    step :permit!
    step :model

    def model(ctx, **)
      contract = ctx[:"contract.default"]
      data = scrape(ctx).paging(contract.limit, contract.offset).order(contract.order)
      data = data.where({ member_id: contract.member_id }) if contract.member_id.present?
      ctx[:model] = OpenStruct.new({ Media: data })
    end
  end
end
