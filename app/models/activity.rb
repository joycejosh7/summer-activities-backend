class Activity < ApplicationRecord
    belongs_to :creator

    #class method that handles arr of activities
    def self.arr_to_json
        self.all.map do |a|
            a.instance_to_json
        end 
    end 

    # instance method that handles one specific activity
    def instance_to_json
        { 
            id: self.id,
            title: self.title,
            description: self.description,
            creator: self.creator.name
              
         }
    end 
end
