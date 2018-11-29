class Topic < ApplicationRecord
  # Direct associations

  has_many   :tabs,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
