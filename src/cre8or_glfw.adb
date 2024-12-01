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





with Cre8or_Glfw.API;
with Cre8or_Glfw.Exceptions;



pragma Elaborate (Cre8or_Glfw.API);
pragma Elaborate (Cre8or_Glfw.Exceptions);





package body Cre8or_Glfw is



	-- Use clauses
	use Cre8or_Glfw.API;
	use Cre8or_Glfw.Exceptions;



	-- Bodies
	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Platform (Platform : in T_Platform) is
	begin

		glfwInitHint (E_Platform, T_Platform'Enum_Rep (Platform));
		Raise_Exception_On_Error;

	end Hint_Platform;

	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Expose_Joystick_Hat_Buttons (Enabled : in Boolean) is
	begin

		glfwInitHint (E_Joystick_Hat_Buttons, (if Enabled then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Expose_Joystick_Hat_Buttons;

	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Cocoa_Menu_Bar (Enabled : in Boolean) is
	begin

		glfwInitHint (E_Cocoa_Menubar, (if Enabled then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Cocoa_Menu_Bar;

	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_Cocoa_Change_Dir_Resources (Change_Dir : in Boolean) is
	begin

		glfwInitHint (E_Cocoa_ChDir_Resources, (if Change_Dir then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Cocoa_Change_Dir_Resources;

	---------------------------------------------------------------------------------------------------------------------
	procedure Hint_X11_Xcb_Vulkan_Surface (Use_Xcb : in Boolean) is
	begin

		glfwInitHint (E_X11_Xcb_Vulkan_Surface, (if Use_Xcb then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_X11_Xcb_Vulkan_Surface;

	---------------------------------------------------------------------------------------------------------------------
	procedure Initialise is

		Dummy : T_Boolean;

	begin

		Dummy := glfwInit;
		Raise_Exception_On_Error;

	end Initialise;

	---------------------------------------------------------------------------------------------------------------------
	procedure Shut_Down is
	begin

		glfwTerminate;
		Raise_Exception_On_Error;

	end Shut_Down;

	---------------------------------------------------------------------------------------------------------------------
	function Get_Platform return T_Platform is

		Result : T_Int;

	begin

		Result := glfwGetPlatform;
		Raise_Exception_On_Error;

		return T_Platform'Enum_Val (Result);

	end Get_Platform;

	---------------------------------------------------------------------------------------------------------------------
	procedure Poll_Events is
	begin

		glfwPollEvents;

	end Poll_Events;

	---------------------------------------------------------------------------------------------------------------------
	procedure Await_Events is
	begin

		glfwWaitEvents;

	end Await_Events;

	---------------------------------------------------------------------------------------------------------------------
	procedure Await_Events (Timeout : in Duration) is
	begin

		glfwWaitEventsTimeout (T_Double (Timeout));

	end Await_Events;



end Cre8or_Glfw;
