# frozen_string_literal: true

class CustomAttribute < ApplicationRecord
  belongs_to :extendable, polymorphic: true
end
