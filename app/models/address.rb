class Address
  include ActiveModel::Model

  attr_accessor :name
  attr_accessor :line1
  attr_accessor :line2
  attr_accessor :city
  attr_accessor :state_province
  attr_accessor :postal_code
  attr_accessor :country
  # attr_accessor :country

  validates :name, presence: true
  validates :line1, presence: true
  validates :city, presence: true
  validates :state_province, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

  def self.from_param(params)
    address = Address.new
    address.name = params[:name]
    address.line1 = params[:line1]
    address.city = params[:city]
    address.state_province = 'MN' #params[:state_province]
    address.postal_code = params[:postal_code]
    address.country = 'USA' # params[:country]
    address
  end
end
