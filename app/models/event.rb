class Event < ApplicationRecord

    class Availability
        attr_accessor :date, :slots

        def initialize(date)
            @date = date
            @slots = slots
        end

    end
    def self.calculate_slots(opening)
        # open time window
        opening_window = opening.starts_at.to_i..opening.ends_at.to_i 
        # split opening time into 30 minutes slots 
        all_slots = opening_window.step(30.minutes).map { |slot| Time.at(slot).strftime("%H:%M") }
        # opening date of this opening instance
        opening_date = opening.starts_at.to_date
        appointments = Event.where(starts_at: opening_window, kind: 'appointment').or(Event.where(ends_at: opening_window, kind: 'appointment'))
        Availability.new(date: opening_date, slots: all_slots)
    end

    # create a method that takes in a date and return availabiliteis 
    def self.availabilities(start_date)
        # one week window
        window = (start_date..start_date+7)
        # all openings within that week
        openings = Event.where(starts_at: window, kind: 'opening').or(Event.where(ends_at: window, kind: 'opening'))
        # return all available slots for each day
        availabilities = openings.map { | opening| calculate_slots(opening)}
    end
    
end
