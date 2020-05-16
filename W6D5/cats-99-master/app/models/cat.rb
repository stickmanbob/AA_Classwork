class Cat < ApplicationRecord

  COLORS = %w(black orange white brown)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS, message: "invalid color!" }
  # https://guides.rubyonrails.org/active_record_validations.html#inclusion

  validates :sex, inclusion: { in: ["M", 'F'] }

  has_many :rental_requests,
           class_name: 'CatRentalRequest',
           dependent: :destroy

end
