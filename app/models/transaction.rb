class Transaction < ApplicationRecord
  validates :valor, uniqueness: { scope: :dataHora, message: "this combination of valor and dataHora already exists" }
end
