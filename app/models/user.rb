class User < ActiveRecord::Base
    has_many :pacientes
    has_many :financeiros
    has_many :atendimentos, through: :pacientes
    has_many :agendamentos, through: :pacientes
    
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 100 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,   presence: true, length: { maximum: 255 }, 
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    # Retorna o Hash "digerido" da string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)         
    end
   
  # Retorna um token aleatório
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Lembra de um usuário do banco de dados
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Retorna verdadeiro se o token é igual ao Hash "digerido"
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Esquece o usuário atual
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def soma_despesas(data_de = "", data_ate = "")
    if data_de == "" && data_ate == ""
      financeiros.where("tipo = ?", "Despesa").sum(:valor)
    else
      financeiros.where("financeiros.tipo = ? AND financeiros.data >= ? AND financeiros.data <= ?", "Despesa", data_de, data_ate).sum(:valor)
    end
  end
  
  def soma_receitas(data_de = "", data_ate = "")
    if data_de == "" && data_ate == ""
      financeiros.where("tipo = ?", "Receita").sum(:valor)
    else
      financeiros.where("financeiros.tipo = ? AND financeiros.data >= ? AND financeiros.data <= ?", "Receita", data_de, data_ate).sum(:valor)
    end
  end
end