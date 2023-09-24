-- Define a class to handle events
EventProcessor = {}

-- Class constructor
function EventProcessor:new(events)
    local obj = {
        events = events,
        recoil = false
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-- Enable primary mouse button events when the profile is activated
function EventProcessor:profileActivated()
    EnablePrimaryMouseButtonEvents(true)
end

-- Release mouse button 2 to prevent it from getting stuck when the profile is deactivated
function EventProcessor:profileDeactivated()
    ReleaseMouseButton(2)
end

-- Toggle recoil when mouse button 5 is pressed
function EventProcessor:mouseButtonPressed(arg)
    if arg == 5 then
        self.recoil = not self.recoil
    end
end

-- Apply recoil when mouse button 1 is pressed and recoil is enabled
function EventProcessor:applyRecoil(arg)
    if arg == 1 and self.recoil then
        repeat
            Sleep(10) -- Small delay between movements
            MoveMouseRelative(0, 2) -- Simulate mouse movement
        until not IsMouseButtonPressed(1) -- Exit the loop when mouse button 1 is released
    end
end

-- Create an instance of the EventProcessor class with the list of events
local eventProcessor = EventProcessor:new {
    PROFILE_ACTIVATED = "PROFILE_ACTIVATED",
    PROFILE_DEACTIVATED = "PROFILE_DEACTIVATED",
    MOUSE_BUTTON_PRESSED = "MOUSE_BUTTON_PRESSED"
}

-- Main function to handle events
function OnEvent(event, arg)
    if event == eventProcessor.events.PROFILE_ACTIVATED then
        eventProcessor:profileActivated()
    elseif event == eventProcessor.events.PROFILE_DEACTIVATED then
        eventProcessor:profileDeactivated()
    elseif event == eventProcessor.events.MOUSE_BUTTON_PRESSED then
        eventProcessor:mouseButtonPressed(arg)
        eventProcessor:applyRecoil(arg)
    end
end
