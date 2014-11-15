class SampleDataSetup

  attr_accessor :users

  def seed(counter)
    puts "Counter - #{counter} Start"
    sleep(3)
    puts "Counter - #{counter} End"
  end

  def data_count
    20
  end

  def number_of_threads
  	2
  end
end