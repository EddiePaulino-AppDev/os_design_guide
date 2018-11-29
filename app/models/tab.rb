class Tab < ApplicationRecord
  # Direct associations

  belongs_to :topic,
             :counter_cache => true

  # Indirect associations

  # Validations

end
