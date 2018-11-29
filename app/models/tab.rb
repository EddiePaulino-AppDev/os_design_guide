class Tab < ApplicationRecord
  # Direct associations

  has_many   :resources,
             :dependent => :destroy

  has_many   :text_components,
             :dependent => :destroy

  belongs_to :topic,
             :counter_cache => true

  # Indirect associations

  # Validations

end
