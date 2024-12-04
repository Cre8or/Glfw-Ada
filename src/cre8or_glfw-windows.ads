------------------------------------------------------------------------------------------------------------------------
--  Copyright 2024 Cre8or                                                                                             --
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



private



	-- Use clauses
	use Cre8or_Glfw.API;



	-- Types
	type T_Window is tagged record
		m_Raw : T_Address := C_Null_Address;
	end record;



end Cre8or_Glfw.Windows;
