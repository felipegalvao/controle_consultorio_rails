class Paciente < ActiveRecord::Base
    belongs_to :user
    validates :nome, presence: true, length: { maximum: 100 }
    validates :identidade, presence: true, length: { maximum: 15 }, uniqueness: true
    validates :cpf, presence: true, length: { maximum: 15 }, uniqueness: true
    validates :plano_de_saude, presence: true
    validates :telefone_fixo, length: { maximum: 20 }
    validates :telefone_celular, length: { maximum: 20 }
    validates :numero_plano_de_saude, length: { maximum: 50 }
    validates :user_id, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,   length: { maximum: 255 }, 
                        format: { with: VALID_EMAIL_REGEX }
  
end
