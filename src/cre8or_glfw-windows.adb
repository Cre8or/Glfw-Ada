
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
	not overriding function Is_Initialised (This : in T_Window) return Boolean is
	begin

		return (This.m_Raw /= C_Null_Address);

	end Is_Initialised;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Initialise (
		This   : in out T_Window;
		Width  : in     Positive;
		Height : in     Positive;
		Title  : in     String
	) is
	begin

		if This.m_Raw /= C_Null_Address then
			This.Destroy;
		end if;

		This.m_Raw := glfwCreateWindow (
			width   => T_Int (Width),
			height  => T_Int (Height),
			title   => To_C (Title)
		);
		Raise_Exception_On_Error;

		if This.m_Raw = C_Null_Address then
			raise EX_WINDOW_CREATION_ERROR;
		end if;

	end Initialise;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Destroy (This : in out T_Window) is
	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		glfwDestroyWindow (This.m_Raw);
		This.m_Raw := C_Null_Address;

		Raise_Exception_On_Error;

	end Destroy;

	-----------------------------------------------------------------------------------------------------------------
	not overriding function Should_Close (This : in T_Window) return Boolean is

		Result : T_Boolean;

	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		Result := glfwWindowShouldClose (This.m_Raw);

		return (Result = E_True);

	end Should_Close;

	-----------------------------------------------------------------------------------------------------------------
	not overriding function Get_Raw_Handle (This : in out T_Window) return Cre8or_Raw_Window_Handle.T_Handle
	is separate;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Show (This : in T_Window) is
	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		glfwShowWindow (This.m_Raw);
		Raise_Exception_On_Error;

	end Show;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Hide (This : in T_Window) is
	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		glfwHideWindow (This.m_Raw);
		Raise_Exception_On_Error;

	end Hide;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Request_Attention (This : in T_Window) is
	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		glfwRequestWindowAttention (This.m_Raw);
		Raise_Exception_On_Error;

	end Request_Attention;

	-----------------------------------------------------------------------------------------------------------------
	not overriding procedure Focus (This : in T_Window) is
	begin

		if This.m_Raw = C_Null_Address then
			raise EX_NOT_INITIALISED;
		end if;

		glfwFocusWindow (This.m_Raw);
		Raise_Exception_On_Error;

	end Focus;



	-- Bodies
	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Resizable (Value : in Boolean) is
	begin

		glfwWindowHint (E_Resizable, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Resizable;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Visible (Value : in Boolean) is
	begin

		glfwWindowHint (E_Visible, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Visible;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Decorated (Value : in Boolean) is
	begin

		glfwWindowHint (E_Decorated, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Decorated;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Auto_Iconify (Value : in Boolean) is
	begin

		glfwWindowHint (E_Auto_Iconify, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Auto_Iconify;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Floating (Value : in Boolean) is
	begin

		glfwWindowHint (E_Floating, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Floating;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Maximised (Value : in Boolean) is
	begin

		glfwWindowHint (E_Maximised, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Maximised;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Center_Cursor (Value : in Boolean) is
	begin

		glfwWindowHint (E_Center_Cursor, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Center_Cursor;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Transparent_Frame_Buffer (Value : in Boolean) is
	begin

		glfwWindowHint (E_Transparent_Frame_Buffer, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Transparent_Frame_Buffer;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Focus_On_Show (Value : in Boolean) is
	begin

		glfwWindowHint (E_Focus_On_Show, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Focus_On_Show;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Scale_To_Monitor (Value : in Boolean) is
	begin

		glfwWindowHint (E_Scale_To_Monitor, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Scale_To_Monitor;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Scale_Frame_Buffer (Value : in Boolean) is
	begin

		glfwWindowHint (E_Scale_Frame_Buffer, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Scale_Frame_Buffer;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Mouse_Passthrough (Value : in Boolean) is
	begin

		glfwWindowHint (E_Mouse_Passthrough, (if Value then 1 else 0));
		Raise_Exception_On_Error;

	end Hint_Mouse_Passthrough;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Position (X, Y : in T_Natural) is
	begin

		glfwWindowHint (E_Position_X, T_Int32 (X));
		glfwWindowHint (E_Position_Y, T_Int32 (Y));
		Raise_Exception_On_Error;

	end Hint_Position;

	-----------------------------------------------------------------------------------------------------------------
	procedure Hint_Any_Position is
	begin

		glfwWindowHint (E_Position_X, C_Any_Position);
		glfwWindowHint (E_Position_Y, C_Any_Position);
		Raise_Exception_On_Error;

	end Hint_Any_Position;

	-----------------------------------------------------------------------------------------------------------------
	procedure Set_Default_Hints is
	begin

		glfwDefaultWindowHints;
		Raise_Exception_On_Error;

	end Set_Default_Hints;



end Cre8or_Glfw.Windows;
