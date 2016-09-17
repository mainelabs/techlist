class Kind
  include ActiveModel::Model
  include ActiveModel::Serialization
  attr_accessor :id, :name

  ALL = ['school', 'lab', 'company', 'media', 'accelerator', 'incubator', 'coworking', 'nonprofit', 'cluster']

  def self.codes
    ALL
  end

  def self.all
    codes.map { |code| Kind.new(id: code, name: I18n.t("kinds.codes.#{code}")) }
  end
end
