# recoil-control-
recoil control script all games

## Usage

1. Copy the Lua script provided in the script file (src/script.lua).

2. Configure your Logitech mouse software to run the Lua script

3. Customize the script according to your needs. You can modify the events and actions associated with each event.

## Supported Logitech Mice

This script is compatible with Logitech mice that support Lua scripting. Please ensure that your mouse is compatible before using this script.

## Script Structure

The script follows an object-oriented approach with the following components:

- `EventProcessor`: A class that handles events and related actions.

- `profileActivated()`: Enables primary mouse button events when the profile is activated.

- `profileDeactivated()`: Releases mouse button 2 to prevent it from getting stuck when the profile is deactivated.

- `mouseButtonPressed(arg)`: Toggles recoil when mouse button 5 is pressed.

- `applyRecoil(arg)`: Applies recoil when mouse button 1 is pressed and recoil is enabled.

- The script creates an instance of the `EventProcessor` class and maps events to their respective actions.

- The `OnEvent` function is the main entry point, where events are processed and actions are executed.

## Customization

You can customize the script by:

- Modifying the list of events and their associated actions.

- Changing the delay (`Sleep`) and mouse movement (`MoveMouseRelative`) values to suit your preferences.

## License
This script is provided under the [MIT License](LICENSE). You are free to use, modify, and distribute it as needed.
