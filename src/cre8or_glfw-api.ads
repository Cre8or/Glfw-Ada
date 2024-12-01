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

	type T_Hint_Kind is (
		E_Joystick_Hat_Buttons,
		E_Platform,
		E_Cocoa_ChDir_Resources,
		E_Cocoa_Menubar,
		E_X11_Xcb_Vulkan_Surface,
		E_Wayland_LibDecor
	) with Convention => C, Size => T_Int'Size;

	for T_Hint_Kind use (
		E_Joystick_Hat_Buttons   => 16#0005_0001#,
		E_Platform               => 16#0005_0003#,
		E_Cocoa_ChDir_Resources  => 16#0005_1001#,
		E_Cocoa_Menubar          => 16#0005_1002#,
		E_X11_Xcb_Vulkan_Surface => 16#0005_2001#,
		E_Wayland_LibDecor       => 16#0005_3001#
	);



	-- Constants
	C_Null_Address   : T_Address renames System.Null_Address;
	C_Null_Chars_Ptr : T_Chars_Ptr renames Interfaces.C.Strings.Null_Ptr;



	-- Renames
	function To_C (
		Item       : in String;
		Append_Nul : in Boolean := True
	) return T_Char_Array renames Interfaces.C.To_C;




	-- Imports
	---------------------------------------------------------------------------------------------------------------------
	-- Context / hints
	---------------------------------------------------------------------------------------------------------------------
	procedure glfwInitHint (
		hint :  in T_Hint_Kind;
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



end Cre8or_Glfw.API;
