class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                      message: 'Must be a valid e-mail format.'
                    }
end
