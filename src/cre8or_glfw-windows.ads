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



	-- Pragmas (validation)
--	pragma Compile_Time_Error (
--		T_Integer32'Size /= 32,
--		"Actual for T_Integer32 must be a 32 bit integer type"
--	);



	-- Types
	type T_Window is tagged private;

		-- Primitives
		-----------------------------------------------------------------------------------------------------------------
		-- Converts the internal Glfw window handle into a platform-specific raw window handle for interfacing with other
		-- libraries.
		-----------------------------------------------------------------------------------------------------------------
		not overriding function Get_Raw_Handle (This : in T_Window) return Cre8or_Raw_Window_Handle.T_Handle;



private



	-- Use clauses
	use Cre8or_Glfw.API;



	-- Types
	type T_Window is tagged record
		m_Raw : T_Address := C_Null_Address;
	end record;



end Cre8or_Glfw.Windows;
