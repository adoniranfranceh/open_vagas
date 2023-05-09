class Position < ApplicationRecord
  belongs_to :company
  enum career: [:developer, :business_inteligence, :information_technology, :design, 
                :product, :technology, :other]
  enum contract: [:clt, :pj, :match]
  has_rich_text :description
  validates :name, :career, :contract, :city, :state, :summary, presence: true
  has_many :applicants
  before_save :set_slug

  private

  def self.ransackable_attributes(auth_object = nil)
    ["career", "city", "company_id", "contract", "created_at", "id", "name", "publish", "remote", "slug", "state", "summary", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company", "rich_text_description"]
  end

  def set_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end
end
