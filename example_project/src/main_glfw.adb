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





with Ada.Text_IO;

with Cre8or_Glfw.Context;
with Cre8or_Glfw.Windows;



pragma Elaborate_All (Ada.Text_IO);

pragma Elaborate_All (Cre8or_Glfw.Context);
pragma Elaborate_All (Cre8or_Glfw.Windows);





procedure Main_Glfw is



	-- Use clauses
	use Ada;

	use Cre8or_Glfw;



	-- Renames
	package Glfw renames Cre8or_Glfw;



	-- Variables
	Window : Glfw.Windows.T_Window;

	Frame_No : Integer := 0;



begin



	Context.Initialise;
	Windows.Set_Default_Hints;

	Text_IO.Put_Line ("Platform: " & Context.Get_Platform'Img);
	Text_IO.Put_Line ("Window initialised (pre-init): " & Window.Is_Initialised'Img);

	Window.Initialise (640, 480, "Hello world!");
	Text_IO.Put_Line ("Window initialised (post-init): " & Window.Is_Initialised'Img);

	while not Window.Should_Close loop
		Frame_No := Frame_No + 1;

		Context.Await_Events (1.0);
		Text_IO.Put_Line ("(" & Frame_No'Img & ") Event detected");
	end loop;

	Window.Destroy;
	Text_IO.Put_Line ("Window initialised (post-destroy): " & Window.Is_Initialised'Img);

	Context.Shut_Down;



end Main_Glfw;
