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





separate (Cre8or_Glfw.Windows)
not overriding function Get_Raw_Handle (This : in out T_Window) return Cre8or_Raw_Window_Handle.T_Handle is

	use Cre8or_Raw_Window_Handle;

	-- Imports
	---------------------------------------------------------------------------------------------------------------------
	function glfwGetWaylandWindow (GLFWwindow : in T_Address) return T_Address
	with Import, Convention => C, External_Name => "glfwGetWaylandWindow";

	---------------------------------------------------------------------------------------------------------------------
	function glfwGetWaylandDisplay return T_Address
	with Import, Convention => C, External_Name => "glfwGetWaylandDisplay";

	-- Variables
	Wayland_Display : T_Address;
	Wayland_Surface : T_Address;

begin

	if This.m_Raw = C_Null_Address then
		raise EX_NOT_INITIALISED;
	end if;

	Wayland_Display := glfwGetWaylandDisplay;
	Wayland_Surface := glfwGetWaylandWindow (This.m_Raw);

	Raise_Exception_On_Error;

	return (
		Kind            => E_Wayland,
		wayland_display => Wayland_Display,
		wayland_surface => Wayland_Surface
	);

end Get_Raw_Handle;
