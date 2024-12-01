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





with Ada.Text_IO;

with Cre8or_Glfw;
with Cre8or_Glfw.Windows;



pragma Elaborate_All (Ada.Text_IO);

pragma Elaborate_All (Cre8or_Glfw);
pragma Elaborate_All (Cre8or_Glfw.Windows);




procedure Main_Glfw is



	-- Use clauses
	use Ada;

	use Cre8or_Glfw;



	-- Renames
	package Glfw renames Cre8or_Glfw;



	-- Variables
	Window : Glfw.Windows.T_Window;



begin


	Glfw.Hint_Platform (E_Any);
	Glfw.Hint_Expose_Joystick_Hat_Buttons (true);
	Glfw.Initialise;

	Text_IO.Put_Line ("Platform: " & Glfw.Get_Platform'Img);

	Text_IO.Put_Line ("Window initialised (pre-init): " & Window.Is_Initialised'Img);
	Window.Initialise (640, 480, "Hello world!");
	Text_IO.Put_Line ("Window initialised (post-init): " & Window.Is_Initialised'Img);

	delay 1.0;

	Glfw.Shut_Down;



end Main_Glfw;
