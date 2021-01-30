module Media::Contract
  class Create < Abstract::Contract
    property  :member_id
    property  :name
    property  :url
    property  :status, default: 'available'
    property  :note

    validates :member_id, presence: true, format: { with: FORMAT_UUID }
    validates :name,      presence: true
    validates :url,       presence: true, format: { with: FORMAT_URL }
    validates :status,    presence: false, inclusion: { in: ::Medium.statuses.keys }
    validates :note,      presence: false
    validate  :uniqueness

    def uniqueness
      errors.add(:url, I18n.t('errors.messages.taken')) if ::Medium.where.not({ id: id }).where({ url: url }).present?
    end
  end
end
