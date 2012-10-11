require "activerecord-reset-pk-sequence/version"

module ActiveRecord
  class Base
    def self.reset_pk_sequence
      case ActiveRecord::Base.connection.adapter_name
      when 'SQLite'
        new_max = maximum(primary_key) || 0
        update_seq_sql = "update sqlite_sequence set seq = #{new_max} where name = '#{table_name}';"
        ActiveRecord::Base.connection.execute(update_seq_sql)
      when 'PostgreSQL'
        ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
      else 
        raise "Task not implemented for this DB adapter"
      end 
    end
    def self.delete_all_and_reset
      delete_all
      reset_pk_sequence
    end
  end
end
