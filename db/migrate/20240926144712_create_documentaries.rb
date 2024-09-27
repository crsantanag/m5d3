class CreateDocumentaries < ActiveRecord::Migration[7.2]
  def change
    create_table :documentaries do |t|
      t.string :name
      t.string :synopsis
      t.string :director

      t.timestamps
    end
  end
end
