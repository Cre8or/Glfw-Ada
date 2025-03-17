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
	function glfwGetWin32Window (GLFWwindow : in T_Address) return T_Address
	with Import, Convention => C, External_Name => "glfwGetWin32Window";

	---------------------------------------------------------------------------------------------------------------------
	function GetModuleHandleA (lpModuleName : in T_Address) return T_Address
	with Import, Convention => C, External_Name => "GetModuleHandleA";

	-- Variables
	Win32_Window   : T_Address;
	Win32_Instance : T_Address;

begin

	if This.m_Raw = C_Null_Address then
		raise EX_NOT_INITIALISED;
	end if;

	Win32_Window   := glfwGetWin32Window (This.m_Raw);
	Win32_Instance := GetModuleHandleA (C_Null_Address);

	Raise_Exception_On_Error;

	return (
		Kind            => E_Win32,
		win32_hwnd      => Win32_Window,
		win32_hinstance => Win32_Instance
	);

end Get_Raw_Handle;
