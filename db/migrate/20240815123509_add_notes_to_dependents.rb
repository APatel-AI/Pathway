# frozen_string_literal: true

class AddNotesToDependents < ActiveRecord::Migration[7.1]
  def change
    add_column :dependents, :notes, :text
  end
end
