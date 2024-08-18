# frozen_string_literal: true

json.array! @dependents, partial: 'dependents/dependent', as: :dependent
