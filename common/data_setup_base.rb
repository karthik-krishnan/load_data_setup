module DataSetupBase
  def self.included(klass)
    klass.class_eval do
      attr_reader :environment, :users_count

      def initialize(environment, users_count)
        @environment = environment
        @users_count = users_count
      end

      def seed_data
        thread_count = respond_to?(:number_of_threads) ? number_of_threads : DEFAULT_CONCURRENT_THREADS

      	total = (1..data_count).to_a
      	slots = []
    		
        while(total.size > 0)
    	 		slots << total.slice!(0, data_count/thread_count)
    		end

    		threads = (0..thread_count-1).map do |i|
    		  Thread.new(i) do |i|
    		  	slots[i].each do |counter|
    		  		seed(counter)
    		  	end
    		  end
    		end
    		threads.each {|t| t.join}
      end
    end
  end
end