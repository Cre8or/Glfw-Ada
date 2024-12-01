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
	procedure Initialise is

		Dummy : T_Result;

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



end Cre8or_Glfw;
