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





package Cre8or_Glfw.Exceptions is



	-- Exceptions
	-- Custom exceptions
	EX_ALREADY_INITIALISED   : exception;
	EX_WINDOW_CREATION_ERROR : exception;

	-- Glfw exceptions
	EX_NOT_INITIALISED       : exception;
	EX_NO_CURRENT_CONTEXT    : exception;
	EX_INVALID_ENUM          : exception;
	EX_INVALID_VALUE         : exception;
	EX_OUT_OF_MEMORY         : exception;
	EX_API_UNAVAILABLE       : exception;
	EX_VERSION_UNAVAILABLE   : exception;
	EX_PLATFORM_ERROR        : exception;
	EX_FORMAT_UNAVAILABLE    : exception;
	EX_NO_WINDOW_CONTEXT     : exception;
	EX_CURSOR_UNAVAILABLE    : exception;
	EX_FEATURE_UNAVAILABLE   : exception;
	EX_FEATURE_UNIMPLEMENTED : exception;
	EX_PLATFORM_UNAVAILABLE  : exception;



	-- Specifications
	---------------------------------------------------------------------------------------------------------------------
	-- Checks Glfw for potential errors and raises an appropriate exception if one is detected.
	-- Intended for internal use, but can also be called manually.
	---------------------------------------------------------------------------------------------------------------------
	procedure Raise_Exception_On_Error;



end Cre8or_Glfw.Exceptions;
