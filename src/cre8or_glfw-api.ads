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





with Interfaces.C.Strings;
with System;



pragma Elaborate_All (Interfaces.C.Strings);
pragma Elaborate_All (System);





private package Cre8or_Glfw.API is



	-- Basic types
	type T_Byte   is new Interfaces.C.char;
	type T_UByte  is new Interfaces.C.unsigned_char;
	type T_Short  is new Interfaces.C.short;
	type T_UShort is new Interfaces.C.unsigned_short;
	type T_Int    is new Interfaces.C.int;
	type T_UInt   is new Interfaces.C.unsigned;
	type T_Long   is new Interfaces.C.long;
	type T_ULong  is new Interfaces.C.unsigned_long;

	type T_Float  is new Interfaces.C.C_float;
	type T_Double is new Interfaces.C.double;

	type T_Int32 is range -2**32 .. 2**32 - 1;

	type T_Size       is new Interfaces.C.size_t;
	subtype T_Address is System.Address;

	subtype T_Char_Array     is Interfaces.C.char_array;
	subtype T_Chars_Ptr      is Interfaces.C.Strings.chars_ptr;
	subtype T_Char_Array_Ref is Interfaces.C.Strings.char_array_access;

	type T_Boolean is (
		E_False,
		E_True
	) with Convention => C, Size => T_Int'Size;

	for T_Boolean use (
		E_False => 0,
		E_True  => 1
	);

	type T_Error is (
		E_No_Error,
		E_Not_Initialised,
		E_No_Current_Context,
		E_Invalid_Enum,
		E_Invalid_Value,
		E_Out_Of_Memory,
		E_API_Unavailable,
		E_Version_Unavailable,
		E_Platform_Error,
		E_Format_Unavailable,
		E_No_Window_Context,
		E_Cursor_Unavailable,
		E_Feature_Unavailable,
		E_Feature_Unimplemented,
		E_Platform_Unavailable
	) with Convention => C, Size => T_Int'Size;

	for T_Error use (
		E_No_Error              => 0,
		E_Not_Initialised       => 16#0001_0001#,
		E_No_Current_Context    => 16#0001_0002#,
		E_Invalid_Enum          => 16#0001_0003#,
		E_Invalid_Value         => 16#0001_0004#,
		E_Out_Of_Memory         => 16#0001_0005#,
		E_API_Unavailable       => 16#0001_0006#,
		E_Version_Unavailable   => 16#0001_0007#,
		E_Platform_Error        => 16#0001_0008#,
		E_Format_Unavailable    => 16#0001_0009#,
		E_No_Window_Context     => 16#0001_000A#,
		E_Cursor_Unavailable    => 16#0001_000B#,
		E_Feature_Unavailable   => 16#0001_000C#,
		E_Feature_Unimplemented => 16#0001_000D#,
		E_Platform_Unavailable  => 16#0001_000E#
	);

	type T_Initialisation_Hint is (
		E_Joystick_Hat_Buttons,
		E_Platform,
		E_Cocoa_ChDir_Resources,
		E_Cocoa_Menubar,
		E_X11_Xcb_Vulkan_Surface,
		E_Wayland_LibDecor
	) with Convention => C, Size => T_Int'Size;

	for T_Initialisation_Hint use (
		E_Joystick_Hat_Buttons   => 16#0005_0001#,
		E_Platform               => 16#0005_0003#,
		E_Cocoa_ChDir_Resources  => 16#0005_1001#,
		E_Cocoa_Menubar          => 16#0005_1002#,
		E_X11_Xcb_Vulkan_Surface => 16#0005_2001#,
		E_Wayland_LibDecor       => 16#0005_3001#
	);

	type T_Window_Hint is (
		E_Focused,
		E_Iconified,
		E_Resizable,
		E_Visible,
		E_Decorated,
		E_Auto_Iconify,
		E_Floating,
		E_Maximised,
		E_Center_Cursor,
		E_Transparent_Frame_Buffer,
		E_Hovered,
		E_Focus_On_Show,
		E_Mouse_Passthrough,
		E_Position_X,
		E_Position_Y,
		E_Red_Bits,
		E_Green_Bits,
		E_Blue_Bits,
		E_Alpha_Bits,
		E_Depth_Bits,
		E_Stencil_Bits,
		E_Accum_Red_Bits,
		E_Accum_Green_Bits,
		E_Accum_Blue_Bits,
		E_Accum_Alpha_Bits,
		E_Aux_Buffers,
		E_Stereo,
		E_Samples,
		E_SRGB_Capable,
		E_Refresh_Rate,
		E_Double_Buffer,
		E_Client_API,
		E_Context_Version_Major,
		E_Context_Version_Minor,
		E_Context_Revision,
		E_Context_Robustness,
		E_OpenGL_Forward_Compat,
		E_Context_Debug,
		E_OpenGL_Profile,
		E_Context_Release_Behaviour,
		E_Context_No_Error,
		E_Context_Creation_API,
		E_Scale_To_Monitor,
		E_Scale_Frame_Buffer,
		E_Cocoa_Retina_Frame_Buffer,
		E_Cocoa_Frame_Name,
		E_Cocoa_Graphics_Switching,
		E_X11_Class_Name,
		E_X11_Instance_Name,
		E_Win32_Keyboard_Menu,
		E_Win32_Show_Default,
		E_Wayland_App_ID
	) with Convention => C, Size => T_Int'Size;

	for T_Window_Hint use (
		E_Focused                   => 16#0002_0001#,
		E_Iconified                 => 16#0002_0002#,
		E_Resizable                 => 16#0002_0003#,
		E_Visible                   => 16#0002_0004#,
		E_Decorated                 => 16#0002_0005#,
		E_Auto_Iconify              => 16#0002_0006#,
		E_Floating                  => 16#0002_0007#,
		E_Maximised                 => 16#0002_0008#,
		E_Center_Cursor             => 16#0002_0009#,
		E_Transparent_Frame_Buffer  => 16#0002_000A#,
		E_Hovered                   => 16#0002_000B#,
		E_Focus_On_Show             => 16#0002_000C#,
		E_Mouse_Passthrough         => 16#0002_000D#,
		E_Position_X                => 16#0002_000E#,
		E_Position_Y                => 16#0002_000F#,
		E_Red_Bits                  => 16#0002_1001#,
		E_Green_Bits                => 16#0002_1002#,
		E_Blue_Bits                 => 16#0002_1003#,
		E_Alpha_Bits                => 16#0002_1004#,
		E_Depth_Bits                => 16#0002_1005#,
		E_Stencil_Bits              => 16#0002_1006#,
		E_Accum_Red_Bits            => 16#0002_1007#,
		E_Accum_Green_Bits          => 16#0002_1008#,
		E_Accum_Blue_Bits           => 16#0002_1009#,
		E_Accum_Alpha_Bits          => 16#0002_100A#,
		E_Aux_Buffers               => 16#0002_100B#,
		E_Stereo                    => 16#0002_100C#,
		E_Samples                   => 16#0002_100D#,
		E_SRGB_Capable              => 16#0002_100E#,
		E_Refresh_Rate              => 16#0002_100F#,
		E_Double_Buffer             => 16#0002_1010#,
		E_Client_API                => 16#0002_2001#,
		E_Context_Version_Major     => 16#0002_2002#,
		E_Context_Version_Minor     => 16#0002_2003#,
		E_Context_Revision          => 16#0002_2004#,
		E_Context_Robustness        => 16#0002_2005#,
		E_OpenGL_Forward_Compat     => 16#0002_2006#,
		E_Context_Debug             => 16#0002_2007#,
		E_OpenGL_Profile            => 16#0002_2008#,
		E_Context_Release_Behaviour => 16#0002_2009#,
		E_Context_No_Error          => 16#0002_200A#,
		E_Context_Creation_API      => 16#0002_200B#,
		E_Scale_To_Monitor          => 16#0002_200C#,
		E_Scale_Frame_Buffer        => 16#0002_200D#,
		E_Cocoa_Retina_Frame_Buffer => 16#0002_3001#,
		E_Cocoa_Frame_Name          => 16#0002_3002#,
		E_Cocoa_Graphics_Switching  => 16#0002_3003#,
		E_X11_Class_Name            => 16#0002_4001#,
		E_X11_Instance_Name         => 16#0002_4002#,
		E_Win32_Keyboard_Menu       => 16#0002_5001#,
		E_Win32_Show_Default        => 16#0002_5002#,
		E_Wayland_App_ID            => 16#0002_6001#
	);



	-- Constants
	C_Null_Address   : T_Address renames System.Null_Address;
	C_Null_Chars_Ptr : T_Chars_Ptr renames Interfaces.C.Strings.Null_Ptr;

	C_Any_Position : constant T_Int32 := 16#8000_0000#; -- GLFW_ANY_POSITION



	-- Renames
	function To_C (
		Item       : in String;
		Append_Nul : in Boolean := True
	) return T_Char_Array renames Interfaces.C.To_C;



	-- Imports
	---------------------------------------------------------------------------------------------------------------------
	-- Context
	---------------------------------------------------------------------------------------------------------------------
	procedure glfwInitHint (
		hint :  in T_Initialisation_Hint;
		value : in T_Int
	) with Import, Convention => C, External_Name => "glfwInitHint";

	---------------------------------------------------------------------------------------------------------------------
	function glfwInit return T_Boolean
	with Import, Convention => C, External_Name => "glfwInit";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwTerminate
	with Import, Convention => C, External_Name => "glfwTerminate";

	---------------------------------------------------------------------------------------------------------------------
	function glfwGetError (description : T_Chars_Ptr := C_Null_Chars_Ptr) return T_Error
	with Import, Convention => C, External_Name => "glfwGetError";

	---------------------------------------------------------------------------------------------------------------------
	function glfwGetPlatform return T_Int
	with Import, Convention => C, External_Name => "glfwGetPlatform";

	---------------------------------------------------------------------------------------------------------------------
	-- Windows
	---------------------------------------------------------------------------------------------------------------------
	function glfwCreateWindow (
		width   : in T_Int;
		height  : in T_Int;
		title   : in T_Char_Array;
		monitor : in T_Address := C_Null_Address;
		share   : in T_Address := C_Null_Address
	) return T_Address
	with Import, Convention => C, External_Name => "glfwCreateWindow";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwDestroyWindow (window : in T_Address)
	with Import, Convention => C, External_Name => "glfwDestroyWindow";

	---------------------------------------------------------------------------------------------------------------------
	function glfwWindowShouldClose (window : in T_Address) return T_Boolean
	with Import, Convention => C, External_Name => "glfwWindowShouldClose";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwShowWindow (window : in T_Address)
	with Import, Convention => C, External_Name => "glfwShowWindow";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwHideWindow (window : in T_Address)
	with Import, Convention => C, External_Name => "glfwHideWindow";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwRequestWindowAttention (window : in T_Address)
	with Import, Convention => C, External_Name => "glfwRequestWindowAttention";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwFocusWindow (window : in T_Address)
	with Import, Convention => C, External_Name => "glfwFocusWindow";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwWindowHint (
		hint  : in T_Window_Hint;
		value : in T_Int32
	) with Import, Convention => C, External_Name => "glfwWindowHint";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwDefaultWindowHints
	with Import, Convention => C, External_Name => "glfwDefaultWindowHints";

	---------------------------------------------------------------------------------------------------------------------
	-- Inputs
	---------------------------------------------------------------------------------------------------------------------
	procedure glfwPollEvents
	with Import, Convention => C, External_Name => "glfwPollEvents";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwWaitEvents
	with Import, Convention => C, External_Name => "glfwWaitEvents";

	---------------------------------------------------------------------------------------------------------------------
	procedure glfwWaitEventsTimeout (timeout : in T_Double)
	with Import, Convention => C, External_Name => "glfwWaitEventsTimeout";



end Cre8or_Glfw.API;
