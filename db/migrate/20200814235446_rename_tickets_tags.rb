class RenameTicketsTags < ActiveRecord::Migration[6.0]
  def change
    rename_table :tickets_tags, :ticket_tags
  end
end
