module Media::Contract
  class Index < Abstract::Contract
    property  :member_id

    validates :member_id, allow_blank: true, format: { with: FORMAT_UUID }
  end
end
