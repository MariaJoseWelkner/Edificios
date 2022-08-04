class Edificio < ApplicationRecord
    has_many :departamento, dependent: :delete_all

    validates :nombre, presence: true
    validates :direccion, presence: true
    validates :ciudad, presence: true
end
