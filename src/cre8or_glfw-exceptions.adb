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





with Cre8or_Glfw.API;



pragma Elaborate (Cre8or_Glfw.API);





package body Cre8or_Glfw.Exceptions is



	-- Use clauses
	use Cre8or_Glfw.API;



	-- Bodies
	---------------------------------------------------------------------------------------------------------------------
	procedure Raise_Exception_On_Error is

		Error : T_Error;

	begin

		Error := glfwGetError;

		case Error is
			when E_No_Error              => null;
			when E_Not_Initialised       => raise EX_NOT_INITIALISED;
			when E_No_Current_Context    => raise EX_NO_CURRENT_CONTEXT;
			when E_Invalid_Enum          => raise EX_INVALID_ENUM;
			when E_Invalid_Value         => raise EX_INVALID_VALUE;
			when E_Out_Of_Memory         => raise EX_OUT_OF_MEMORY;
			when E_API_Unavailable       => raise EX_API_UNAVAILABLE;
			when E_Version_Unavailable   => raise EX_VERSION_UNAVAILABLE;
			when E_Platform_Error        => raise EX_PLATFORM_ERROR;
			when E_Format_Unavailable    => raise EX_FORMAT_UNAVAILABLE;
			when E_No_Window_Context     => raise EX_NO_WINDOW_CONTEXT;
			when E_Cursor_Unavailable    => raise EX_CURSOR_UNAVAILABLE;
			when E_Feature_Unavailable   => raise EX_FEATURE_UNAVAILABLE;
			when E_Feature_Unimplemented => raise EX_FEATURE_UNIMPLEMENTED;
			when E_Platform_Unavailable  => raise EX_PLATFORM_UNAVAILABLE;
		end case;

	end Raise_Exception_On_Error;



end Cre8or_Glfw.Exceptions;
