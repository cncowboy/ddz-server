class PackagePayment
  include Mongoid::Document

  belongs_to :package, class_name: "DdzGoodsPackage"
  belongs_to :paymentMethod, class_name: "PaymentMethod"
  field :paymentCode, type: String
  field :packageName, type: String
  field :description, type: String
  field :price, type: Integer
  field :actual_price, type: Integer
  field :memo, type: String
  field :enabled, type: Boolean, default: true
  include Mongoid::Timestamps
  # field :createdAt, type: Date, default: ->{ Time.now }
  # field :updatedAt, type: Date, default: ->{ Time.now }

  def self.serialize_from_session(key, salt)
    record = to_adapter.get((key[0]["$oid"] rescue nil))
    record if record && record.authenticatable_salt == salt
  end

  def to_s
    self.paymentCode || self.id
  end
end