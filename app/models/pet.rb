class Pet < ApplicationRecord
  belongs_to :shelter
  # belongs_to :user
  validates :name, presence: true
  validates :shelter_id, presence: true
  validates :breed, :animal_type, presence: true

  after_create :set_adopted_to_false


  def adopt_friend
    self.is_adopted = true
    save
  end

  private

  def set_adopted_to_false
    self.is_adopted = false
  end


end
