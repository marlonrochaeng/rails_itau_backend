class Transaction < ApplicationRecord
    validates :valor, presence: true
    validates :dataHora, presence: true
end
