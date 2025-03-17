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





with Interfaces.C;



pragma Elaborate_All (Interfaces.C);





separate (Cre8or_Glfw.Windows)
not overriding function Get_Raw_Handle (This : in out T_Window) return Cre8or_Raw_Window_Handle.T_Handle is

	use Cre8or_Raw_Window_Handle;

	-- Imports
	---------------------------------------------------------------------------------------------------------------------
	function glfwGetX11Window (GLFWwindow : in T_Address) return Interfaces.C.unsigned_long
	with Import, Convention => C, External_Name => "glfwGetX11Window";

	---------------------------------------------------------------------------------------------------------------------
	function glfwGetX11Display return T_Address
	with Import, Convention => C, External_Name => "glfwGetX11Display";

	-- Variables
	X11_Display : T_Address;
	X11_Window  : Interfaces.C.unsigned_long;

begin

	if This.m_Raw = C_Null_Address then
		raise EX_NOT_INITIALISED;
	end if;

	X11_Display := glfwGetX11Display;
	X11_Window  := glfwGetX11Window (This.m_Raw);

	Raise_Exception_On_Error;

	return (
		Kind         => E_Xlib,
		xlib_display => X11_Display,
		xlib_window  => X11_Window,
		others       => <>
	);

end Get_Raw_Handle;
