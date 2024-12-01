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





with Cre8or_Glfw.Exceptions;



pragma Elaborate_All (Cre8or_Glfw.Exceptions);





package body Cre8or_Glfw.Windows is



	-- Use clasues
	use Cre8or_Glfw.Exceptions;

	use type T_Address;



	-- Primitives
	-----------------------------------------------------------------------------------------------------------------
	-- T_Window
	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Initialise (
		This   : in out T_Window;
		Width  : in Positive;
		Height : in Positive;
		Title  : in String
	) is

		Title_C : constant T_Char_Array := To_C (Title);

	begin

		if This.m_Raw /= C_Null_Address then
			raise EX_ALREADY_INITIALISED;
		end if;

		This.m_Raw := glfwCreateWindow (
			width   => T_Int (Width),
			height  => T_Int (Height),
			title   => Title_C
		);
		Raise_Exception_On_Error;

	end Initialise;

	-----------------------------------------------------------------------------------------------------------------
	not overriding function Is_Initialised (This : in T_Window) return Boolean is
	begin

		return (This.m_Raw /= C_Null_Address);

	end Is_Initialised;

	-----------------------------------------------------------------------------------------------------------------
	not overriding function Get_Raw_Handle (This : in T_Window) return Cre8or_Raw_Window_Handle.T_Handle
	is separate;



end Cre8or_Glfw.Windows;
