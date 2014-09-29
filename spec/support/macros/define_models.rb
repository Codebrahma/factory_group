require "active_record"

class User < ActiveRecord::Base
end

FactoryGirl.define do
  factory :user do
    name "sample"
    age 20
  end
end

module CreateTables
  def create_table(table_name, &block)
    connection = ActiveRecord::Base.connection
    connection.create_table(table_name, &block)
  end

  def drop_table(table_name)
    connection = ActiveRecord::Base.connection
    connection.drop_table(table_name)
  end
end

RSpec.configure do |config|
  include CreateTables

  config.before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter:  'sqlite3',
      database: File.join(File.dirname(__FILE__), 'test.db')
    )

    create_table :users do |t|
      t.string :name, limit: 60
      t.integer :age
    end
  end


  config.after(:all) do
    drop_table :users
  end
end
