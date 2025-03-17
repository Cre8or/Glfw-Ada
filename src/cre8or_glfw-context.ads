------------------------------------------------------------------------------------------------------------------------
--  Copyright 2024-2025 Cre8or                                                                                        --
--                                                                                                                    --
--  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance    --
--  with the License. You may obtain a copy of the License at                                                         --
--                                                                                                                    --
--     http://www.apache.org/licenses/LICENSE-2.0                                                                     --
--                                                                                                                    --
--  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed  --
--  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                     --
--  See the License for the specific language governing permissions and limitations under the License.                --
------------------------------------------------------------------------------------------------------------------------





package Cre8or_Glfw.Context is



	-- Types
	type T_Platform is (
		E_Any,
		E_Win32,
		E_Cocoa,
		E_Wayland,
		E_X11,
		E_Null
	) with Convention => C, Size => 32;



	-- Specifications
	---------------------------------------------------------------------------------------------------------------------
	-- Sends a hint to Glfw to use the specified platform. Must be submitted before calling Initialise.
	--
	-- Hints are reset after a call to Shut_Down and must be resubmitted before the next call to Initialise.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Platform (Platform : in T_Platform);

	---------------------------------------------------------------------------------------------------------------------
	-- Sets whether Glfw should expose joystick hats as buttons, for compatibility with earlier versions that did not
	-- have glfwGetJoystickHats.
	--
	-- Hints are reset after a call to Shut_Down and must be resubmitted before the next call to Initialise.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Expose_Joystick_Hat_Buttons (Enabled : in Boolean);

	---------------------------------------------------------------------------------------------------------------------
	-- Sets whether Glfw should create the menu bar and dock icon when initialised. This hint is only considered when
	-- using the Cocoa platform.
	--
	-- Hints are reset after a call to Shut_Down and must be resubmitted before the next call to Initialise.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Cocoa_Menu_Bar (Enabled : in Boolean);

	---------------------------------------------------------------------------------------------------------------------
	-- Sets whether Glfw should set the current directory to the application to the Contents/Resources subdirectory of
	-- the application's bundle, if present. This hint is only considered when using the Cocoa platform.
	--
	-- Hints are reset after a call to Shut_Down and must be resubmitted before the next call to Initialise.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Cocoa_Change_Dir_Resources (Change_Dir : in Boolean);

	---------------------------------------------------------------------------------------------------------------------
	-- Sets whether Glfw should use the VK_KHR_xcb_surface or the VK_KHR_xlib_surface extension for creating Vulkan
	-- surfaces. This hint is only considered when using the X11 platform.
	--
	-- Hints are reset after a call to Shut_Down and must be resubmitted before the next call to Initialise.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_X11_Xcb_Vulkan_Surface (Use_Xcb : in Boolean);

	---------------------------------------------------------------------------------------------------------------------
	-- Initialises Glfw. Should be called once upon application startup.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Initialise;

	---------------------------------------------------------------------------------------------------------------------
	-- Shuts down (terminates) Glfw. Should be called once at the end of the application.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Shut_Down;

	---------------------------------------------------------------------------------------------------------------------
	-- Returns the platform that was selected during initialisation.
	-- If Glfw isn't initialised, raises the exception EX_NOT_INITIALISED.
	---------------------------------------------------------------------------------------------------------------------
	function Get_Platform return T_Platform;

	---------------------------------------------------------------------------------------------------------------------
	-- Polls Glfw for any new window events. Unlike Await_Events, this procedure yields immediately.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Poll_Events;

	---------------------------------------------------------------------------------------------------------------------
	-- Polls Glfw for any new window events, and if none are detected, awaits indefinitely until new events are available.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Await_Events;

	---------------------------------------------------------------------------------------------------------------------
	-- Polls Glfw for any new window events, and if none are detected, awaits until new events are available, or until
	-- the specified timeout is reached.
	-- Must only be called from the main task.
	---------------------------------------------------------------------------------------------------------------------
	procedure Await_Events (Timeout : in Duration);



private



	-- Types
	for T_Platform use (
		E_Any     => 16#0006_0000#,
		E_Win32   => 16#0006_0001#,
		E_Cocoa   => 16#0006_0002#,
		E_Wayland => 16#0006_0003#,
		E_X11     => 16#0006_0004#,
		E_Null    => 16#0006_0005#
	);



end Cre8or_Glfw.Context;
