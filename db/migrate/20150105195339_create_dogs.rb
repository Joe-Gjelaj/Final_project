class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
    	t.string :breed
    	t.integer :m_weight
    	t.integer :m_height
    	t.integer :f_weight
    	t.integer :f_height
    	t.integer :life_span
	t.timestamps
    end
  end
end
