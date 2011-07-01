class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :display_name
      t.string :css_class

      t.timestamps
    end
    add_index :components, :display_name, :unique => true
    add_index :components, :css_class, :unique => true
  end

  def self.down
    drop_table :components
  end
end