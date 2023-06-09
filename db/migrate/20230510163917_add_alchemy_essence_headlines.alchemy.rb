# frozen_string_literal: true

# This migration comes from alchemy (originally 20210406093436)
class AddAlchemyEssenceHeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :alchemy_essence_headlines do |t|
      t.text :body
      t.integer :level
      t.integer :size
      t.timestamps
    end
  end
end
