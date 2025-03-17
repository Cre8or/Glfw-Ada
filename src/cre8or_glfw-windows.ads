------------------------------------------------------------------------------------------------------------------------
--  Copyright 2024-2025 Cre8or                                                                                             --
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





        with Cre8or_Raw_Window_Handle;

private with Cre8or_Glfw.API;



pragma Elaborate_All (Cre8or_Raw_Window_Handle);

pragma Elaborate_All (Cre8or_Glfw.API);





package Cre8or_Glfw.Windows is



	-- Types
	subtype T_Natural is Natural;

	type T_Window is tagged private;

		-- Primitives
		-----------------------------------------------------------------------------------------------------------------
		-- Returns true if the window has been initialised, otherwise false.
		-----------------------------------------------------------------------------------------------------------------
		not overriding function Is_Initialised (This : in T_Window) return Boolean;

		-----------------------------------------------------------------------------------------------------------------
		-- Creates a window and its associated context. The latter can be configured with context hints before window
		-- initialisation.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Initialise (
			This   : in out T_Window;
			Width  : in     Positive;
			Height : in     Positive;
			Title  : in     String
		);

		-----------------------------------------------------------------------------------------------------------------
		-- Destroys the window and its associated context.
		-- The window must not be current on any other task when this procedure is called!
		-- The window must be initialised.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Destroy (This : in out T_Window);

		-----------------------------------------------------------------------------------------------------------------
		-- Returns true if the window has been requested to close, otherwise false.
		-----------------------------------------------------------------------------------------------------------------
		not overriding function Should_Close (This : in T_Window) return Boolean;

		-----------------------------------------------------------------------------------------------------------------
		-- Converts the internal Glfw window handle into a platform-specific raw window handle for interfacing with other
		-- libraries.
		-- The window must be initialised.
		-----------------------------------------------------------------------------------------------------------------
		not overriding function Get_Raw_Handle (This : in out T_Window) return Cre8or_Raw_Window_Handle.T_Handle;

		-----------------------------------------------------------------------------------------------------------------
		-- Shows the specified window after it was previously hidden.
		-- The window must be initialised.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Show (This : in T_Window);

		-----------------------------------------------------------------------------------------------------------------
		-- Hides the specified window after it was previously visible, including from the task bar, dock, and window list.
		-- By default, windows are visible upon initialisation.
		-- The window must be initialised.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Hide (This : in T_Window);

		-----------------------------------------------------------------------------------------------------------------
		-- Sets the specified window to request user attention (e.g. by flashing on the task bar).
		-- On platforms where this is not supported, attention is instead requested to the application as a whole.
		-- The window must be initialised.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Request_Attention (This : in T_Window);

		-----------------------------------------------------------------------------------------------------------------
		-- Brings the specified window to the front and sets input focus onto it.
		-- The window must be visible and not iconified.
		-- NOTE: Be careful not to steal focus from other applications unless absolutely necessary, as this can be
		-- extremely disruptive to the user!
		-- The window must be initialised.
		-- Must only be called from the main task.
		-----------------------------------------------------------------------------------------------------------------
		not overriding procedure Focus (This : in T_Window);



	-- Specifications
	-----------------------------------------------------------------------------------------------------------------
	-- The following hint procedures set hints for the next call to Initialise.
	-- The hints, once set, persist until they are changed, or until the Glfw context is shut down.
	-- All hint procedures must only be called from the main task.
	-----------------------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows in windowed mode should be resizable by the user.
	-- This hint is ignored for full-screen and undecorated windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Resizable (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows in windowed mode should be visible upon initialisation.
	-- This hint is ignored for full-screen and undecorated windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Visible (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows in windowed mode should have window decorations such as a border, a close widget,
	-- etc. An undecorated window will not be resizable by the user.
	-- This hint is ignored for full-screen windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Decorated (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not full-screen windows should automatically iconify and restore the previous video mode on
	-- input focus loss.
	-- This hint is ignored for windows in windowed mode.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Auto_Iconify (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows in windowed mode should be floating above other regular windows (also called
	-- top-most, or always-on-top). Primarily intended for debugging purposes, and cannot be used to implement proper
	-- full-screen windows.
	-- This hint is ignored for full-screen windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Floating (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows in windowed mode should be maximised when created.
	-- This hint is ignored for full-screen windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Maximised (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not the cursor should be centered over newly created full-screen windows.
	-- This hint is ignored for windows in windowed mode.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Center_Cursor (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not the window frame buffers should be transparent. If enabled and supported by the system,
	-- the window frame buffer alpha channel will be used to combine the frame buffer with the background.
	-- This does not affect window decorations.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Transparent_Frame_Buffer (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not windows should automatically be given input focus when Show is called.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Focus_On_Show (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not the window content area should be resized based on content scale changes. This can be
	-- because of a global user settings change or because the window was moved to a monitor with different scale
	-- settings.
	-- This hint only has an effect on platforms where screen coordinates and pixels always map 1:1, such as Windows
	-- and X11. On platforms like macOS the resolution of the frame buffer can change independently of the window
	-- size.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Scale_To_Monitor (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not frame buffers should be resized based on content scale changes. This can be because of a
	-- global user settings change or because the window was moved to a monitor with different scale settings.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Scale_Frame_Buffer (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Hints whether or not the window should be transparent to mouse input, letting any mouse events pass through to
	-- whatever window is behind it. This hint is only supported for undecorated windows.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Mouse_Passthrough (Value : in Boolean);

	-----------------------------------------------------------------------------------------------------------------
	-- Specified the desired initial position of windows. The window manager may modify or ignore these coordinates.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Position (X, Y : in T_Natural);

	-----------------------------------------------------------------------------------------------------------------
	-- Clears any previously specified desired initial position of windows. By default (and after use of this hint),
	-- the window manager will decide where windows should be initially positioned, based on system and user
	-- preferences.
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Any_Position;

	-----------------------------------------------------------------------------------------------------------------
	-- Resets all window hints to their default values.
	-- Must only be called from the main task.
	-----------------------------------------------------------------------------------------------------------------
	procedure Set_Default_Hints;



private



	-- Use clauses
	use Cre8or_Glfw.API;



	-- Types
	type T_Window is tagged record
		m_Raw : T_Address := C_Null_Address;
	end record;



end Cre8or_Glfw.Windows;
