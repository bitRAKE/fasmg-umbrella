
; SDL2 version 2.24.0, https://libsdl.org

PE.__IMPORTS equ 'SDL2',\
SDL_AddEventWatch,\
SDL_AddHintCallback,\
SDL_AddTimer,\
SDL_AllocFormat,\
SDL_AllocPalette,\
SDL_AllocRW,\
SDL_AtomicAdd,\
SDL_AtomicCAS,\
SDL_AtomicCASPtr,\
SDL_AtomicGet,\
SDL_AtomicGetPtr,\
SDL_AtomicLock,\
SDL_AtomicSet,\
SDL_AtomicSetPtr,\
SDL_AtomicTryLock,\
SDL_AtomicUnlock,\
SDL_AudioInit,\
SDL_AudioQuit,\
SDL_AudioStreamAvailable,\
SDL_AudioStreamClear,\
SDL_AudioStreamFlush,\
SDL_AudioStreamGet,\
SDL_AudioStreamPut,\
SDL_BuildAudioCVT,\
SDL_CalculateGammaRamp,\
SDL_CaptureMouse,\
SDL_ClearComposition,\
SDL_ClearError,\
SDL_ClearHints,\
SDL_ClearQueuedAudio,\
SDL_CloseAudio,\
SDL_CloseAudioDevice,\
SDL_ComposeCustomBlendMode,\
SDL_CondBroadcast,\
SDL_CondSignal,\
SDL_CondWait,\
SDL_CondWaitTimeout,\
SDL_ConvertAudio,\
SDL_ConvertPixels,\
SDL_ConvertSurface,\
SDL_ConvertSurfaceFormat,\
SDL_CreateColorCursor,\
SDL_CreateCond,\
SDL_CreateCursor,\
SDL_CreateMutex,\
SDL_CreateRGBSurface,\
SDL_CreateRGBSurfaceFrom,\
SDL_CreateRGBSurfaceWithFormat,\
SDL_CreateRGBSurfaceWithFormatFrom,\
SDL_CreateRenderer,\
SDL_CreateSemaphore,\
SDL_CreateShapedWindow,\
SDL_CreateSoftwareRenderer,\
SDL_CreateSystemCursor,\
SDL_CreateTexture,\
SDL_CreateTextureFromSurface,\
SDL_CreateThread,\
SDL_CreateThreadWithStackSize,\
SDL_CreateWindow,\
SDL_CreateWindowAndRenderer,\
SDL_CreateWindowFrom,\
SDL_DXGIGetOutputInfo,\
SDL_DYNAPI_entry,\
SDL_DelEventWatch,\
SDL_DelHintCallback,\
SDL_Delay,\
SDL_DequeueAudio,\
SDL_DestroyCond,\
SDL_DestroyMutex,\
SDL_DestroyRenderer,\
SDL_DestroySemaphore,\
SDL_DestroyTexture,\
SDL_DestroyWindow,\
SDL_DetachThread,\
SDL_Direct3D9GetAdapterIndex,\
SDL_DisableScreenSaver,\
SDL_DuplicateSurface,\
SDL_EnableScreenSaver,\
SDL_EncloseFPoints,\
SDL_EnclosePoints,\
SDL_Error,\
SDL_EventState,\
SDL_FillRect,\
SDL_FillRects,\
SDL_FilterEvents,\
SDL_FlashWindow,\
SDL_FlushEvent,\
SDL_FlushEvents,\
SDL_FreeAudioStream,\
SDL_FreeCursor,\
SDL_FreeFormat,\
SDL_FreePalette,\
SDL_FreeRW,\
SDL_FreeSurface,\
SDL_FreeWAV,\
SDL_GL_BindTexture,\
SDL_GL_CreateContext,\
SDL_GL_DeleteContext,\
SDL_GL_ExtensionSupported,\
SDL_GL_GetAttribute,\
SDL_GL_GetCurrentContext,\
SDL_GL_GetCurrentWindow,\
SDL_GL_GetDrawableSize,\
SDL_GL_GetProcAddress,\
SDL_GL_GetSwapInterval,\
SDL_GL_LoadLibrary,\
SDL_GL_MakeCurrent,\
SDL_GL_ResetAttributes,\
SDL_GL_SetAttribute,\
SDL_GL_SetSwapInterval,\
SDL_GL_SwapWindow,\
SDL_GL_UnbindTexture,\
SDL_GL_UnloadLibrary,\
SDL_GUIDFromString,\
SDL_GUIDToString,\
SDL_GameControllerAddMapping,\
SDL_GameControllerAddMappingsFromRW,\
SDL_GameControllerClose,\
SDL_GameControllerEventState,\
SDL_GameControllerFromInstanceID,\
SDL_GameControllerFromPlayerIndex,\
SDL_GameControllerGetAppleSFSymbolsNameForAxis,\
SDL_GameControllerGetAppleSFSymbolsNameForButton,\
SDL_GameControllerGetAttached,\
SDL_GameControllerGetAxis,\
SDL_GameControllerGetAxisFromString,\
SDL_GameControllerGetBindForAxis,\
SDL_GameControllerGetBindForButton,\
SDL_GameControllerGetButton,\
SDL_GameControllerGetButtonFromString,\
SDL_GameControllerGetFirmwareVersion,\
SDL_GameControllerGetJoystick,\
SDL_GameControllerGetNumTouchpadFingers,\
SDL_GameControllerGetNumTouchpads,\
SDL_GameControllerGetPlayerIndex,\
SDL_GameControllerGetProduct,\
SDL_GameControllerGetProductVersion,\
SDL_GameControllerGetSensorData,\
SDL_GameControllerGetSensorDataRate,\
SDL_GameControllerGetSerial,\
SDL_GameControllerGetStringForAxis,\
SDL_GameControllerGetStringForButton,\
SDL_GameControllerGetTouchpadFinger,\
SDL_GameControllerGetType,\
SDL_GameControllerGetVendor,\
SDL_GameControllerHasAxis,\
SDL_GameControllerHasButton,\
SDL_GameControllerHasLED,\
SDL_GameControllerHasRumble,\
SDL_GameControllerHasRumbleTriggers,\
SDL_GameControllerHasSensor,\
SDL_GameControllerIsSensorEnabled,\
SDL_GameControllerMapping,\
SDL_GameControllerMappingForDeviceIndex,\
SDL_GameControllerMappingForGUID,\
SDL_GameControllerMappingForIndex,\
SDL_GameControllerName,\
SDL_GameControllerNameForIndex,\
SDL_GameControllerNumMappings,\
SDL_GameControllerOpen,\
SDL_GameControllerPath,\
SDL_GameControllerPathForIndex,\
SDL_GameControllerRumble,\
SDL_GameControllerRumbleTriggers,\
SDL_GameControllerSendEffect,\
SDL_GameControllerSetLED,\
SDL_GameControllerSetPlayerIndex,\
SDL_GameControllerSetSensorEnabled,\
SDL_GameControllerTypeForIndex,\
SDL_GameControllerUpdate,\
SDL_GetAssertionHandler,\
SDL_GetAssertionReport,\
SDL_GetAudioDeviceName,\
SDL_GetAudioDeviceSpec,\
SDL_GetAudioDeviceStatus,\
SDL_GetAudioDriver,\
SDL_GetAudioStatus,\
SDL_GetBasePath,\
SDL_GetCPUCacheLineSize,\
SDL_GetCPUCount,\
SDL_GetClipRect,\
SDL_GetClipboardText,\
SDL_GetClosestDisplayMode,\
SDL_GetColorKey,\
SDL_GetCurrentAudioDriver,\
SDL_GetCurrentDisplayMode,\
SDL_GetCurrentVideoDriver,\
SDL_GetCursor,\
SDL_GetDefaultAssertionHandler,\
SDL_GetDefaultAudioInfo,\
SDL_GetDefaultCursor,\
SDL_GetDesktopDisplayMode,\
SDL_GetDisplayBounds,\
SDL_GetDisplayDPI,\
SDL_GetDisplayMode,\
SDL_GetDisplayName,\
SDL_GetDisplayOrientation,\
SDL_GetDisplayUsableBounds,\
SDL_GetError,\
SDL_GetErrorMsg,\
SDL_GetEventFilter,\
SDL_GetGlobalMouseState,\
SDL_GetGrabbedWindow,\
SDL_GetHint,\
SDL_GetHintBoolean,\
SDL_GetKeyFromName,\
SDL_GetKeyFromScancode,\
SDL_GetKeyName,\
SDL_GetKeyboardFocus,\
SDL_GetKeyboardState,\
SDL_GetMemoryFunctions,\
SDL_GetModState,\
SDL_GetMouseFocus,\
SDL_GetMouseState,\
SDL_GetNumAllocations,\
SDL_GetNumAudioDevices,\
SDL_GetNumAudioDrivers,\
SDL_GetNumDisplayModes,\
SDL_GetNumRenderDrivers,\
SDL_GetNumTouchDevices,\
SDL_GetNumTouchFingers,\
SDL_GetNumVideoDisplays,\
SDL_GetNumVideoDrivers,\
SDL_GetOriginalMemoryFunctions,\
SDL_GetPerformanceCounter,\
SDL_GetPerformanceFrequency,\
SDL_GetPixelFormatName,\
SDL_GetPlatform,\
SDL_GetPointDisplayIndex,\
SDL_GetPowerInfo,\
SDL_GetPrefPath,\
SDL_GetPreferredLocales,\
SDL_GetQueuedAudioSize,\
SDL_GetRGB,\
SDL_GetRGBA,\
SDL_GetRectDisplayIndex,\
SDL_GetRelativeMouseMode,\
SDL_GetRelativeMouseState,\
SDL_GetRenderDrawBlendMode,\
SDL_GetRenderDrawColor,\
SDL_GetRenderDriverInfo,\
SDL_GetRenderTarget,\
SDL_GetRenderer,\
SDL_GetRendererInfo,\
SDL_GetRendererOutputSize,\
SDL_GetRevision,\
SDL_GetRevisionNumber,\
SDL_GetScancodeFromKey,\
SDL_GetScancodeFromName,\
SDL_GetScancodeName,\
SDL_GetShapedWindowMode,\
SDL_GetSurfaceAlphaMod,\
SDL_GetSurfaceBlendMode,\
SDL_GetSurfaceColorMod,\
SDL_GetSystemRAM,\
SDL_GetTextureAlphaMod,\
SDL_GetTextureBlendMode,\
SDL_GetTextureColorMod,\
SDL_GetTextureScaleMode,\
SDL_GetTextureUserData,\
SDL_GetThreadID,\
SDL_GetThreadName,\
SDL_GetTicks,\
SDL_GetTicks64,\
SDL_GetTouchDevice,\
SDL_GetTouchDeviceType,\
SDL_GetTouchFinger,\
SDL_GetTouchName,\
SDL_GetVersion,\
SDL_GetVideoDriver,\
SDL_GetWindowBordersSize,\
SDL_GetWindowBrightness,\
SDL_GetWindowData,\
SDL_GetWindowDisplayIndex,\
SDL_GetWindowDisplayMode,\
SDL_GetWindowFlags,\
SDL_GetWindowFromID,\
SDL_GetWindowGammaRamp,\
SDL_GetWindowGrab,\
SDL_GetWindowICCProfile,\
SDL_GetWindowID,\
SDL_GetWindowKeyboardGrab,\
SDL_GetWindowMaximumSize,\
SDL_GetWindowMinimumSize,\
SDL_GetWindowMouseGrab,\
SDL_GetWindowMouseRect,\
SDL_GetWindowOpacity,\
SDL_GetWindowPixelFormat,\
SDL_GetWindowPosition,\
SDL_GetWindowSize,\
SDL_GetWindowSurface,\
SDL_GetWindowTitle,\
SDL_GetWindowWMInfo,\
SDL_GetYUVConversionMode,\
SDL_GetYUVConversionModeForResolution,\
SDL_HapticClose,\
SDL_HapticDestroyEffect,\
SDL_HapticEffectSupported,\
SDL_HapticGetEffectStatus,\
SDL_HapticIndex,\
SDL_HapticName,\
SDL_HapticNewEffect,\
SDL_HapticNumAxes,\
SDL_HapticNumEffects,\
SDL_HapticNumEffectsPlaying,\
SDL_HapticOpen,\
SDL_HapticOpenFromJoystick,\
SDL_HapticOpenFromMouse,\
SDL_HapticOpened,\
SDL_HapticPause,\
SDL_HapticQuery,\
SDL_HapticRumbleInit,\
SDL_HapticRumblePlay,\
SDL_HapticRumbleStop,\
SDL_HapticRumbleSupported,\
SDL_HapticRunEffect,\
SDL_HapticSetAutocenter,\
SDL_HapticSetGain,\
SDL_HapticStopAll,\
SDL_HapticStopEffect,\
SDL_HapticUnpause,\
SDL_HapticUpdateEffect,\
SDL_Has3DNow,\
SDL_HasARMSIMD,\
SDL_HasAVX,\
SDL_HasAVX2,\
SDL_HasAVX512F,\
SDL_HasAltiVec,\
SDL_HasClipboardText,\
SDL_HasColorKey,\
SDL_HasEvent,\
SDL_HasEvents,\
SDL_HasIntersection,\
SDL_HasIntersectionF,\
SDL_HasLASX,\
SDL_HasLSX,\
SDL_HasMMX,\
SDL_HasNEON,\
SDL_HasRDTSC,\
SDL_HasSSE,\
SDL_HasSSE2,\
SDL_HasSSE3,\
SDL_HasSSE41,\
SDL_HasSSE42,\
SDL_HasScreenKeyboardSupport,\
SDL_HasSurfaceRLE,\
SDL_HideWindow,\
SDL_Init,\
SDL_InitSubSystem,\
SDL_IntersectFRect,\
SDL_IntersectFRectAndLine,\
SDL_IntersectRect,\
SDL_IntersectRectAndLine,\
SDL_IsGameController,\
SDL_IsScreenKeyboardShown,\
SDL_IsScreenSaverEnabled,\
SDL_IsShapedWindow,\
SDL_IsTablet,\
SDL_IsTextInputActive,\
SDL_IsTextInputShown,\
SDL_JoystickAttachVirtual,\
SDL_JoystickAttachVirtualEx,\
SDL_JoystickClose,\
SDL_JoystickCurrentPowerLevel,\
SDL_JoystickDetachVirtual,\
SDL_JoystickEventState,\
SDL_JoystickFromInstanceID,\
SDL_JoystickFromPlayerIndex,\
SDL_JoystickGetAttached,\
SDL_JoystickGetAxis,\
SDL_JoystickGetAxisInitialState,\
SDL_JoystickGetBall,\
SDL_JoystickGetButton,\
SDL_JoystickGetDeviceGUID,\
SDL_JoystickGetDeviceInstanceID,\
SDL_JoystickGetDevicePlayerIndex,\
SDL_JoystickGetDeviceProduct,\
SDL_JoystickGetDeviceProductVersion,\
SDL_JoystickGetDeviceType,\
SDL_JoystickGetDeviceVendor,\
SDL_JoystickGetFirmwareVersion,\
SDL_JoystickGetGUID,\
SDL_JoystickGetGUIDFromString,\
SDL_JoystickGetGUIDString,\
SDL_JoystickGetHat,\
SDL_JoystickGetPlayerIndex,\
SDL_JoystickGetProduct,\
SDL_JoystickGetProductVersion,\
SDL_JoystickGetSerial,\
SDL_JoystickGetType,\
SDL_JoystickGetVendor,\
SDL_JoystickHasLED,\
SDL_JoystickHasRumble,\
SDL_JoystickHasRumbleTriggers,\
SDL_JoystickInstanceID,\
SDL_JoystickIsHaptic,\
SDL_JoystickIsVirtual,\
SDL_JoystickName,\
SDL_JoystickNameForIndex,\
SDL_JoystickNumAxes,\
SDL_JoystickNumBalls,\
SDL_JoystickNumButtons,\
SDL_JoystickNumHats,\
SDL_JoystickOpen,\
SDL_JoystickPath,\
SDL_JoystickPathForIndex,\
SDL_JoystickRumble,\
SDL_JoystickRumbleTriggers,\
SDL_JoystickSendEffect,\
SDL_JoystickSetLED,\
SDL_JoystickSetPlayerIndex,\
SDL_JoystickSetVirtualAxis,\
SDL_JoystickSetVirtualButton,\
SDL_JoystickSetVirtualHat,\
SDL_JoystickUpdate,\
SDL_LoadBMP_RW,\
SDL_LoadDollarTemplates,\
SDL_LoadFile,\
SDL_LoadFile_RW,\
SDL_LoadFunction,\
SDL_LoadObject,\
SDL_LoadWAV_RW,\
SDL_LockAudio,\
SDL_LockAudioDevice,\
SDL_LockJoysticks,\
SDL_LockMutex,\
SDL_LockSensors,\
SDL_LockSurface,\
SDL_LockTexture,\
SDL_LockTextureToSurface,\
SDL_Log,\
SDL_LogCritical,\
SDL_LogDebug,\
SDL_LogError,\
SDL_LogGetOutputFunction,\
SDL_LogGetPriority,\
SDL_LogInfo,\
SDL_LogMessage,\
SDL_LogMessageV,\
SDL_LogResetPriorities,\
SDL_LogSetAllPriority,\
SDL_LogSetOutputFunction,\
SDL_LogSetPriority,\
SDL_LogVerbose,\
SDL_LogWarn,\
SDL_LowerBlit,\
SDL_LowerBlitScaled,\
SDL_MapRGB,\
SDL_MapRGBA,\
SDL_MasksToPixelFormatEnum,\
SDL_MaximizeWindow,\
SDL_MemoryBarrierAcquireFunction,\
SDL_MemoryBarrierReleaseFunction,\
SDL_Metal_CreateView,\
SDL_Metal_DestroyView,\
SDL_Metal_GetDrawableSize,\
SDL_Metal_GetLayer,\
SDL_MinimizeWindow,\
SDL_MixAudio,\
SDL_MixAudioFormat,\
SDL_MouseIsHaptic,\
SDL_NewAudioStream,\
SDL_NumHaptics,\
SDL_NumJoysticks,\
SDL_NumSensors,\
SDL_OnApplicationDidBecomeActive,\
SDL_OnApplicationDidEnterBackground,\
SDL_OnApplicationDidReceiveMemoryWarning,\
SDL_OnApplicationWillEnterForeground,\
SDL_OnApplicationWillResignActive,\
SDL_OnApplicationWillTerminate,\
SDL_OpenAudio,\
SDL_OpenAudioDevice,\
SDL_OpenURL,\
SDL_PauseAudio,\
SDL_PauseAudioDevice,\
SDL_PeepEvents,\
SDL_PixelFormatEnumToMasks,\
SDL_PollEvent,\
SDL_PremultiplyAlpha,\
SDL_PumpEvents,\
SDL_PushEvent,\
SDL_QueryTexture,\
SDL_QueueAudio,\
SDL_Quit,\
SDL_QuitSubSystem,\
SDL_RWFromConstMem,\
SDL_RWFromFP,\
SDL_RWFromFile,\
SDL_RWFromMem,\
SDL_RWclose,\
SDL_RWread,\
SDL_RWseek,\
SDL_RWsize,\
SDL_RWtell,\
SDL_RWwrite,\
SDL_RaiseWindow,\
SDL_ReadBE16,\
SDL_ReadBE32,\
SDL_ReadBE64,\
SDL_ReadLE16,\
SDL_ReadLE32,\
SDL_ReadLE64,\
SDL_ReadU8,\
SDL_RecordGesture,\
SDL_RegisterApp,\
SDL_RegisterEvents,\
SDL_RemoveTimer,\
SDL_RenderClear,\
SDL_RenderCopy,\
SDL_RenderCopyEx,\
SDL_RenderCopyExF,\
SDL_RenderCopyF,\
SDL_RenderDrawLine,\
SDL_RenderDrawLineF,\
SDL_RenderDrawLines,\
SDL_RenderDrawLinesF,\
SDL_RenderDrawPoint,\
SDL_RenderDrawPointF,\
SDL_RenderDrawPoints,\
SDL_RenderDrawPointsF,\
SDL_RenderDrawRect,\
SDL_RenderDrawRectF,\
SDL_RenderDrawRects,\
SDL_RenderDrawRectsF,\
SDL_RenderFillRect,\
SDL_RenderFillRectF,\
SDL_RenderFillRects,\
SDL_RenderFillRectsF,\
SDL_RenderFlush,\
SDL_RenderGeometry,\
SDL_RenderGeometryRaw,\
SDL_RenderGetClipRect,\
SDL_RenderGetD3D11Device,\
SDL_RenderGetD3D12Device,\
SDL_RenderGetD3D9Device,\
SDL_RenderGetIntegerScale,\
SDL_RenderGetLogicalSize,\
SDL_RenderGetMetalCommandEncoder,\
SDL_RenderGetMetalLayer,\
SDL_RenderGetScale,\
SDL_RenderGetViewport,\
SDL_RenderGetWindow,\
SDL_RenderIsClipEnabled,\
SDL_RenderLogicalToWindow,\
SDL_RenderPresent,\
SDL_RenderReadPixels,\
SDL_RenderSetClipRect,\
SDL_RenderSetIntegerScale,\
SDL_RenderSetLogicalSize,\
SDL_RenderSetScale,\
SDL_RenderSetVSync,\
SDL_RenderSetViewport,\
SDL_RenderTargetSupported,\
SDL_RenderWindowToLogical,\
SDL_ReportAssertion,\
SDL_ResetAssertionReport,\
SDL_ResetHint,\
SDL_ResetKeyboard,\
SDL_RestoreWindow,\
SDL_SIMDAlloc,\
SDL_SIMDFree,\
SDL_SIMDGetAlignment,\
SDL_SIMDRealloc,\
SDL_SaveAllDollarTemplates,\
SDL_SaveBMP_RW,\
SDL_SaveDollarTemplate,\
SDL_SemPost,\
SDL_SemTryWait,\
SDL_SemValue,\
SDL_SemWait,\
SDL_SemWaitTimeout,\
SDL_SensorClose,\
SDL_SensorFromInstanceID,\
SDL_SensorGetData,\
SDL_SensorGetDeviceInstanceID,\
SDL_SensorGetDeviceName,\
SDL_SensorGetDeviceNonPortableType,\
SDL_SensorGetDeviceType,\
SDL_SensorGetInstanceID,\
SDL_SensorGetName,\
SDL_SensorGetNonPortableType,\
SDL_SensorGetType,\
SDL_SensorOpen,\
SDL_SensorUpdate,\
SDL_SetAssertionHandler,\
SDL_SetClipRect,\
SDL_SetClipboardText,\
SDL_SetColorKey,\
SDL_SetCursor,\
SDL_SetError,\
SDL_SetEventFilter,\
SDL_SetHint,\
SDL_SetHintWithPriority,\
SDL_SetMainReady,\
SDL_SetMemoryFunctions,\
SDL_SetModState,\
SDL_SetPaletteColors,\
SDL_SetPixelFormatPalette,\
SDL_SetRelativeMouseMode,\
SDL_SetRenderDrawBlendMode,\
SDL_SetRenderDrawColor,\
SDL_SetRenderTarget,\
SDL_SetSurfaceAlphaMod,\
SDL_SetSurfaceBlendMode,\
SDL_SetSurfaceColorMod,\
SDL_SetSurfacePalette,\
SDL_SetSurfaceRLE,\
SDL_SetTextInputRect,\
SDL_SetTextureAlphaMod,\
SDL_SetTextureBlendMode,\
SDL_SetTextureColorMod,\
SDL_SetTextureScaleMode,\
SDL_SetTextureUserData,\
SDL_SetThreadPriority,\
SDL_SetWindowAlwaysOnTop,\
SDL_SetWindowBordered,\
SDL_SetWindowBrightness,\
SDL_SetWindowData,\
SDL_SetWindowDisplayMode,\
SDL_SetWindowFullscreen,\
SDL_SetWindowGammaRamp,\
SDL_SetWindowGrab,\
SDL_SetWindowHitTest,\
SDL_SetWindowIcon,\
SDL_SetWindowInputFocus,\
SDL_SetWindowKeyboardGrab,\
SDL_SetWindowMaximumSize,\
SDL_SetWindowMinimumSize,\
SDL_SetWindowModalFor,\
SDL_SetWindowMouseGrab,\
SDL_SetWindowMouseRect,\
SDL_SetWindowOpacity,\
SDL_SetWindowPosition,\
SDL_SetWindowResizable,\
SDL_SetWindowShape,\
SDL_SetWindowSize,\
SDL_SetWindowTitle,\
SDL_SetWindowsMessageHook,\
SDL_SetYUVConversionMode,\
SDL_ShowCursor,\
SDL_ShowMessageBox,\
SDL_ShowSimpleMessageBox,\
SDL_ShowWindow,\
SDL_SoftStretch,\
SDL_SoftStretchLinear,\
SDL_StartTextInput,\
SDL_StopTextInput,\
SDL_TLSCleanup,\
SDL_TLSCreate,\
SDL_TLSGet,\
SDL_TLSSet,\
SDL_ThreadID,\
SDL_TryLockMutex,\
SDL_UnionFRect,\
SDL_UnionRect,\
SDL_UnloadObject,\
SDL_UnlockAudio,\
SDL_UnlockAudioDevice,\
SDL_UnlockJoysticks,\
SDL_UnlockMutex,\
SDL_UnlockSensors,\
SDL_UnlockSurface,\
SDL_UnlockTexture,\
SDL_UnregisterApp,\
SDL_UpdateNVTexture,\
SDL_UpdateTexture,\
SDL_UpdateWindowSurface,\
SDL_UpdateWindowSurfaceRects,\
SDL_UpdateYUVTexture,\
SDL_UpperBlit,\
SDL_UpperBlitScaled,\
SDL_VideoInit,\
SDL_VideoQuit,\
SDL_Vulkan_CreateSurface,\
SDL_Vulkan_GetDrawableSize,\
SDL_Vulkan_GetInstanceExtensions,\
SDL_Vulkan_GetVkGetInstanceProcAddr,\
SDL_Vulkan_LoadLibrary,\
SDL_Vulkan_UnloadLibrary,\
SDL_WaitEvent,\
SDL_WaitEventTimeout,\
SDL_WaitThread,\
SDL_WarpMouseGlobal,\
SDL_WarpMouseInWindow,\
SDL_WasInit,\
SDL_WriteBE16,\
SDL_WriteBE32,\
SDL_WriteBE64,\
SDL_WriteLE16,\
SDL_WriteLE32,\
SDL_WriteLE64,\
SDL_WriteU8,\
SDL_abs,\
SDL_acos,\
SDL_acosf,\
SDL_asin,\
SDL_asinf,\
SDL_asprintf,\
SDL_atan,\
SDL_atan2,\
SDL_atan2f,\
SDL_atanf,\
SDL_atof,\
SDL_atoi,\
SDL_bsearch,\
SDL_calloc,\
SDL_ceil,\
SDL_ceilf,\
SDL_copysign,\
SDL_copysignf,\
SDL_cos,\
SDL_cosf,\
SDL_crc16,\
SDL_crc32,\
SDL_exp,\
SDL_expf,\
SDL_fabs,\
SDL_fabsf,\
SDL_floor,\
SDL_floorf,\
SDL_fmod,\
SDL_fmodf,\
SDL_free,\
SDL_getenv,\
SDL_hid_ble_scan,\
SDL_hid_close,\
SDL_hid_device_change_count,\
SDL_hid_enumerate,\
SDL_hid_exit,\
SDL_hid_free_enumeration,\
SDL_hid_get_feature_report,\
SDL_hid_get_indexed_string,\
SDL_hid_get_manufacturer_string,\
SDL_hid_get_product_string,\
SDL_hid_get_serial_number_string,\
SDL_hid_init,\
SDL_hid_open,\
SDL_hid_open_path,\
SDL_hid_read,\
SDL_hid_read_timeout,\
SDL_hid_send_feature_report,\
SDL_hid_set_nonblocking,\
SDL_hid_write,\
SDL_iconv,\
SDL_iconv_close,\
SDL_iconv_open,\
SDL_iconv_string,\
SDL_isalnum,\
SDL_isalpha,\
SDL_isblank,\
SDL_iscntrl,\
SDL_isdigit,\
SDL_isgraph,\
SDL_islower,\
SDL_isprint,\
SDL_ispunct,\
SDL_isspace,\
SDL_isupper,\
SDL_isxdigit,\
SDL_itoa,\
SDL_lltoa,\
SDL_log,\
SDL_log10,\
SDL_log10f,\
SDL_logf,\
SDL_lround,\
SDL_lroundf,\
SDL_ltoa,\
SDL_malloc,\
SDL_memcmp,\
SDL_memcpy,\
SDL_memmove,\
SDL_memset,\
SDL_pow,\
SDL_powf,\
SDL_qsort,\
SDL_realloc,\
SDL_round,\
SDL_roundf,\
SDL_scalbn,\
SDL_scalbnf,\
SDL_setenv,\
SDL_sin,\
SDL_sinf,\
SDL_snprintf,\
SDL_sqrt,\
SDL_sqrtf,\
SDL_sscanf,\
SDL_strcasecmp,\
SDL_strchr,\
SDL_strcmp,\
SDL_strdup,\
SDL_strlcat,\
SDL_strlcpy,\
SDL_strlen,\
SDL_strlwr,\
SDL_strncasecmp,\
SDL_strncmp,\
SDL_strrchr,\
SDL_strrev,\
SDL_strstr,\
SDL_strtod,\
SDL_strtokr,\
SDL_strtol,\
SDL_strtoll,\
SDL_strtoul,\
SDL_strtoull,\
SDL_strupr,\
SDL_tan,\
SDL_tanf,\
SDL_tolower,\
SDL_toupper,\
SDL_trunc,\
SDL_truncf,\
SDL_uitoa,\
SDL_ulltoa,\
SDL_ultoa,\
SDL_utf8strlcpy,\
SDL_utf8strlen,\
SDL_utf8strnlen,\
SDL_vasprintf,\
SDL_vsnprintf,\
SDL_vsscanf,\
SDL_wcscasecmp,\
SDL_wcscmp,\
SDL_wcsdup,\
SDL_wcslcat,\
SDL_wcslcpy,\
SDL_wcslen,\
SDL_wcsncasecmp,\
SDL_wcsncmp,\
SDL_wcsstr

; equates largely based on conversion by Tomasz Grysztar

; TODO: correct all pointers

struct SDL_Point
	x		dd ?
	y		dd ?
ends

struct SDL_Rect
	x		dd ?
	y		dd ?
	w		dd ?
	h		dd ?
ends

struct SDL_Color
	r		db ?
	g		db ?
	b		db ?
	a		db ?
ends

;struct SDL_Colour SDL_Color
;ends

struct SDL_Palette
	ncolors 	dd ?
	colors		dd ?
	version 	dd ?
	refcount	dd ?
ends

struct SDL_DisplayMode
	_format		dd ?
	w		dd ?
	h		dd ?
	refresh_rate	dd ?
	driverdata	dd ?
ends

struct SDL_PixelFormat
	_format		dd ?
	palette 	dd ?
	BitsPerPixel	db ?
	BytesPerPixel	db ?
	padding 	rb 2
	Rmask		dd ?
	Gmask		dd ?
	Bmask		dd ?
	Amask		dd ?
	Rloss		db ?
	Gloss		db ?
	Bloss		db ?
	Aloss		db ?
	Rshift		db ?
	Gshift		db ?
	Bshift		db ?
	Ashift		db ?
	refcount	dd ?
	next		dd ?
ends

struct SDL_Surface
	flags		dd ?		; Read-only
	_format		dd ?		; Read-only
	w		dd ?		; Read-only
	h		dd ?		; Read-only
	pitch		dd ?		; Read-only
	pixels		dd ?		; Read-write
	userdata	dd ?		; Read-write
	locked		dd ?		; Read-only
	lock_data	dd ?		; Read-only
	clip_rect	SDL_Rect	; Read-only
	map		dd ?		; Private
	refcount	dd ?		; Read-mostly
ends

struct SDL_Keysym
	scancode	dd ?
	sym		dd ?
	mod		dw ?
			dw ?
	unused		dd ?
ends

struct SDL_CommonEvent
	type		dd ?
	timestamp	dd ?
ends

struct SDL_DisplayEvent
	type		dd ?
	timestamp	dd ?
	_display	dd ?
	event		db ?
	padding1	db ?
	padding2	db ?
	padding3	db ?
	data1		dd ?
ends

struct SDL_WindowEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	event		db ?
	padding1	db ?
	padding2	db ?
	padding3	db ?
	data1		dd ?
	data2		dd ?
ends

struct SDL_KeyboardEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	state		db ?
	_repeat		db ?
	padding2	db ?
	padding3	db ?
	keysym		SDL_Keysym
ends

SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32
struct SDL_TextEditingEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	text		rb SDL_TEXTEDITINGEVENT_TEXT_SIZE
	start		dd ?
	length		dd ?
ends

struct SDL_TextEditingExtEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
			dd ? ; *pointer padding*
	text		dq ? ; #AMD64#
	start		dd ?
	length		dd ?
ends

SDL_TEXTINPUTEVENT_TEXT_SIZE = 32
struct SDL_TextInputEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	text		rb SDL_TEXTINPUTEVENT_TEXT_SIZE
ends

struct SDL_MouseMotionEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	which		dd ?
	state		dd ?
	x		dd ?
	y		dd ?
	xrel		dd ?
	yrel		dd ?
ends

struct SDL_MouseButtonEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	which		dd ?
	button		db ?
	state		db ?
	clicks		db ?
	padding1	db ?
	x		dd ?
	y		dd ?
ends

struct SDL_MouseWheelEvent
	type		dd ?
	timestamp	dd ?
	windowID 	dd ?
	which		dd ?
	x		dd ?
	y		dd ?
	direction	dd ?
	preciseX	dd ? ; float
	preciseY	dd ? ; float
ends

struct SDL_JoyAxisEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	axis		db ?
	padding1	db ?
	padding2	db ?
	padding3	db ?
	value		dw ?
	padding4	dw ?
ends

struct SDL_JoyBallEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	ball		db ?
	padding1	db ?
	padding2	db ?
	padding3	db ?
	xrel		dw ?
	yrel		dw ?
ends

struct SDL_JoyHatEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	hat		db ?
	value		db ?
	padding1	db ?
	padding2	db ?
ends

struct SDL_JoyButtonEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	button		db ?
	state		db ?
	padding1	db ?
	padding2	db ?
ends

struct SDL_JoyDeviceEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
ends

struct SDL_JoyBatteryEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	level		dd ?
ends

struct SDL_ControllerAxisEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	axis		db ?
	padding1	db ?
	padding2	db ?
	padding3	db ?
	value		dw ?
	padding4	dw ?
ends

struct SDL_ControllerButtonEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
	button		db ?
	state		db ?
	padding1	db ?
	padding2	db ?
ends

struct SDL_ControllerDeviceEvent
	type		dd ?
	timestamp	dd ?
	which		dd ?
ends

struct SDL_TouchFingerEvent
	type		dd ?
	timestamp	dd ?
	touchId 	dd ?
	fingerId	dd ?
	x		dd ?
	y		dd ?
	dx		dd ?
	dy		dd ?
	pressure	dd ?
ends

struct SDL_MultiGestureEvent
	type		dd ?
	timestamp	dd ?
	touchId 	dd ?
	dTheta		dd ?
	dDist		dd ?
	x		dd ?
	y		dd ?
	numFingers	dw ?
	padding 	dw ?
ends

struct SDL_DollarGestureEvent
	type		dd ?
	timestamp	dd ?
	touchId 	dd ?
	gestureId	dd ?
	numFingers	dd ?
	error		dd ?
	x		dd ?
	y		dd ?
ends

struct SDL_DropEvent
	type		dd ?
	timestamp	dd ?
	file_		dq ?
	windowID	dd ?
ends

struct SDL_QuitEvent
	type		dd ?
	timestamp	dd ?
ends

struct SDL_OSEvent
	type		dd ?
	timestamp	dd ?
ends

struct SDL_UserEvent
	type		dd ?
	timestamp	dd ?
	windowID	dd ?
	code		dd ?
	data1		dd ?
	data2		dd ?
ends

struct SDL_SysWMEvent
	type		dd ?
	timestamp	dd ?
	msg		dd ?
ends

struct SDL_Event
    union
	type		dd ?
	common		SDL_CommonEvent
	window		SDL_WindowEvent
	key		SDL_KeyboardEvent
	edit		SDL_TextEditingEvent
	editExt		SDL_TextEditingExtEvent
	text		SDL_TextInputEvent
	motion		SDL_MouseMotionEvent
	button		SDL_MouseButtonEvent
	wheel		SDL_MouseWheelEvent
	jaxis		SDL_JoyAxisEvent
	jball		SDL_JoyBallEvent
	jhat		SDL_JoyHatEvent
	jbutton 	SDL_JoyButtonEvent
	jdevice 	SDL_JoyDeviceEvent
	jbattery	SDL_JoyBatteryEvent
	caxis		SDL_ControllerAxisEvent
	cbutton 	SDL_ControllerButtonEvent
	cdevice 	SDL_ControllerDeviceEvent
;	ctouchpad	SDL_ControllerTouchpadEvent
;	csensor		SDL_ControllerSensorEvent
;	adevice		SDL_AudioDeviceEvent
;	sensor		SDL_SensorEvent
	quit		SDL_QuitEvent
	user		SDL_UserEvent
	syswm		SDL_SysWMEvent
	tfinger 	SDL_TouchFingerEvent
	mgesture	SDL_MultiGestureEvent
	dgesture	SDL_DollarGestureEvent
	drop		SDL_DropEvent
	padding 	rb 56
    ends
ends

SDL_QUERY	:= -1
SDL_IGNORE	:= 0
SDL_DISABLE	:= 0
SDL_ENABLE	:= 1


struct SDL_RWops
	size	dd ?
	seek	dd ?
	read	dd ?
	write	dd ?
	close	dd ?
	type	dd ?
	hidden	dd ?
ends

; These are the flags which may be passed to SDL_Init().  You should
; specify the subsystems which you will be using in your application.

SDL_INIT_TIMER		= 0x00000001
SDL_INIT_AUDIO		= 0x00000010
SDL_INIT_VIDEO		= 0x00000020  ; SDL_INIT_VIDEO implies SDL_INIT_EVENTS
SDL_INIT_JOYSTICK	= 0x00000200  ; SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS
SDL_INIT_HAPTIC 	= 0x00001000
SDL_INIT_GAMECONTROLLER = 0x00002000  ; SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK
SDL_INIT_EVENTS 	= 0x00004000
SDL_INIT_NOPARACHUTE	= 0x00100000  ; Don't catch fatal signals
SDL_INIT_EVERYTHING	= \
	SDL_INIT_TIMER or SDL_INIT_AUDIO or SDL_INIT_VIDEO or SDL_INIT_EVENTS or \
	SDL_INIT_JOYSTICK or SDL_INIT_HAPTIC or SDL_INIT_GAMECONTROLLER

; The flags on a window

SDL_WINDOW_FULLSCREEN	      = 0x00000001	; fullscreen window
SDL_WINDOW_OPENGL	      = 0x00000002	; window usable with OpenGL context
SDL_WINDOW_SHOWN	      = 0x00000004	; window is visible
SDL_WINDOW_HIDDEN	      = 0x00000008	; window is not visible
SDL_WINDOW_BORDERLESS	      = 0x00000010	; no window decoration
SDL_WINDOW_RESIZABLE	      = 0x00000020	; window can be resized
SDL_WINDOW_MINIMIZED	      = 0x00000040	; window is minimized
SDL_WINDOW_MAXIMIZED	      = 0x00000080	; window is maximized
SDL_WINDOW_INPUT_GRABBED      = 0x00000100	; window has grabbed input focus
SDL_WINDOW_INPUT_FOCUS	      = 0x00000200	; window has input focus
SDL_WINDOW_MOUSE_FOCUS	      = 0x00000400	; window has mouse focus
SDL_WINDOW_FULLSCREEN_DESKTOP = SDL_WINDOW_FULLSCREEN or 0x00001000
SDL_WINDOW_FOREIGN	      = 0x00000800	; window not created by SDL
SDL_WINDOW_ALLOW_HIGHDPI      = 0x00002000	; window should be created

; Used to indicate that you don't care what the window position is.

SDL_WINDOWPOS_UNDEFINED_MASK  = 0x1FFF0000
SDL_WINDOWPOS_UNDEFINED       = SDL_WINDOWPOS_UNDEFINED_MASK or 0

; Used to indicate that the window position should be centered.

SDL_WINDOWPOS_CENTERED_MASK   = 0x2FFF0000
SDL_WINDOWPOS_CENTERED	      = SDL_WINDOWPOS_CENTERED_MASK or 0

; Flags used when creating a rendering context

SDL_RENDERER_SOFTWARE	   = 0x00000001 ; The renderer is a software fallback
SDL_RENDERER_ACCELERATED   = 0x00000002 ; The renderer uses hardware acceleration
SDL_RENDERER_PRESENTVSYNC  = 0x00000004 ; Present is synchronized with the refresh rate
SDL_RENDERER_TARGETTEXTURE = 0x00000008 ; The renderer supports rendering to texture


; The access pattern allowed for a texture.

SDL_TEXTUREACCESS_STATIC    = 0     ; Changes rarely, not lockable
SDL_TEXTUREACCESS_STREAMING = 1     ; Changes frequently, lockable
SDL_TEXTUREACCESS_TARGET    = 2     ; Texture can be used as a render target

; The texture channel modulation used in SDL_RenderCopy().

SDL_TEXTUREMODULATE_NONE  = 0x00000000	; No modulation
SDL_TEXTUREMODULATE_COLOR = 0x00000001	; srcC = srcC * color
SDL_TEXTUREMODULATE_ALPHA = 0x00000002	; srcA = srcA * alpha

; Flip constants for SDL_RenderCopyEx

SDL_FLIP_NONE	    = 0x00000000	; Do not flip
SDL_FLIP_HORIZONTAL = 0x00000001	; flip horizontally
SDL_FLIP_VERTICAL   = 0x00000002	; flip vertically

; The blend mode used in SDL_RenderCopy() and drawing operations.

SDL_BLENDMODE_NONE = 0x00000000 	; no blending
					; dstRGBA = srcRGBA
SDL_BLENDMODE_BLEND = 0x00000001	; alpha blending
					; dstRGB = (srcRGB * srcA) + (dstRGB * (1-srcA))
					; dstA = srcA + (dstA * (1-srcA))
SDL_BLENDMODE_ADD = 0x00000002		; additive blending
					; dstRGB = (srcRGB * srcA) + dstRGB
					; dstA = dstA
SDL_BLENDMODE_MOD = 0x00000004		; color modulate
					; dstRGB = srcRGB * dstRGB
					; dstA = dstA */

; Surface flags

SDL_SWSURFACE = 0	    ; Just here for compatibility
SDL_PREALLOC  = 0x00000001  ; Surface uses preallocated memory
SDL_RLEACCEL  = 0x00000002  ; Surface is RLE encoded
SDL_DONTFREE  = 0x00000004  ; Surface is referenced internally

; Transparency definitions

SDL_ALPHA_OPAQUE      = 255
SDL_ALPHA_TRANSPARENT = 0

; Pixel type

SDL_PIXELTYPE_UNKNOWN  = 0
SDL_PIXELTYPE_INDEX1   = 1
SDL_PIXELTYPE_INDEX4   = 2
SDL_PIXELTYPE_INDEX8   = 3
SDL_PIXELTYPE_PACKED8  = 4
SDL_PIXELTYPE_PACKED16 = 5
SDL_PIXELTYPE_PACKED32 = 6
SDL_PIXELTYPE_ARRAYU8  = 7
SDL_PIXELTYPE_ARRAYU16 = 8
SDL_PIXELTYPE_ARRAYU32 = 9
SDL_PIXELTYPE_ARRAYF16 = 10
SDL_PIXELTYPE_ARRAYF32 = 11

; Bitmap pixel order, high bit -> low bit

SDL_BITMAPORDER_NONE = 0
SDL_BITMAPORDER_4321 = 1
SDL_BITMAPORDER_1234 = 2

; Packed component order high bit -> low bit

SDL_PACKEDORDER_NONE = 0
SDL_PACKEDORDER_XRGB = 1
SDL_PACKEDORDER_RGBX = 2
SDL_PACKEDORDER_ARGB = 3
SDL_PACKEDORDER_RGBA = 4
SDL_PACKEDORDER_XBGR = 5
SDL_PACKEDORDER_BGRX = 6
SDL_PACKEDORDER_ABGR = 7
SDL_PACKEDORDER_BGRA = 8

; Array component order low byte -> high byte

SDL_ARRAYORDER_NONE = 0
SDL_ARRAYORDER_RGB  = 1
SDL_ARRAYORDER_RGBA = 2
SDL_ARRAYORDER_ARGB = 3
SDL_ARRAYORDER_BGR  = 4
SDL_ARRAYORDER_BGRA = 5
SDL_ARRAYORDER_ABGR = 6

; Packed component layout

SDL_PACKEDLAYOUT_NONE	 = 0
SDL_PACKEDLAYOUT_332	 = 1
SDL_PACKEDLAYOUT_4444	 = 2
SDL_PACKEDLAYOUT_1555	 = 3
SDL_PACKEDLAYOUT_5551	 = 4
SDL_PACKEDLAYOUT_565	 = 5
SDL_PACKEDLAYOUT_8888	 = 6
SDL_PACKEDLAYOUT_2101010 = 7
SDL_PACKEDLAYOUT_1010102 = 8

struc SDL_DEFINE_PIXELFORMAT type,order,layout,bits,bytes
    . = 1 shl 28 or (type) shl 24 or (order) shl 20 or (layout) shl 16 or (bits) shl 8 or (bytes)
end struc

SDL_PIXELFORMAT_UNKNOWN   = 0
SDL_PIXELFORMAT_INDEX1LSB \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, \
			   1, 0
SDL_PIXELFORMAT_INDEX1MSB \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, \
			   1, 0
SDL_PIXELFORMAT_INDEX4LSB \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, \
			   4, 0
SDL_PIXELFORMAT_INDEX4MSB \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, \
			   4, 0
SDL_PIXELFORMAT_INDEX8 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1
SDL_PIXELFORMAT_RGB332 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, \
			   SDL_PACKEDLAYOUT_332, 8, 1
SDL_PIXELFORMAT_RGB444 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, \
			   SDL_PACKEDLAYOUT_4444, 12, 2
SDL_PIXELFORMAT_RGB555 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, \
			   SDL_PACKEDLAYOUT_1555, 15, 2
SDL_PIXELFORMAT_BGR555 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, \
			   SDL_PACKEDLAYOUT_1555, 15, 2
SDL_PIXELFORMAT_ARGB4444 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, \
			   SDL_PACKEDLAYOUT_4444, 16, 2
SDL_PIXELFORMAT_RGBA4444 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, \
			   SDL_PACKEDLAYOUT_4444, 16, 2
SDL_PIXELFORMAT_ABGR4444 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, \
			   SDL_PACKEDLAYOUT_4444, 16, 2
SDL_PIXELFORMAT_BGRA4444 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, \
			   SDL_PACKEDLAYOUT_4444, 16, 2
SDL_PIXELFORMAT_ARGB1555 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, \
			   SDL_PACKEDLAYOUT_1555, 16, 2
SDL_PIXELFORMAT_RGBA5551 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, \
			   SDL_PACKEDLAYOUT_5551, 16, 2
SDL_PIXELFORMAT_ABGR1555 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, \
			   SDL_PACKEDLAYOUT_1555, 16, 2
SDL_PIXELFORMAT_BGRA5551 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, \
			   SDL_PACKEDLAYOUT_5551, 16, 2
SDL_PIXELFORMAT_RGB565 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, \
			   SDL_PACKEDLAYOUT_565, 16, 2
SDL_PIXELFORMAT_BGR565 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, \
			   SDL_PACKEDLAYOUT_565, 16, 2
SDL_PIXELFORMAT_RGB24 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, \
			   24, 3
SDL_PIXELFORMAT_BGR24 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, \
			   24, 3
SDL_PIXELFORMAT_RGB888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, \
			   SDL_PACKEDLAYOUT_8888, 24, 4
SDL_PIXELFORMAT_RGBX8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, \
			   SDL_PACKEDLAYOUT_8888, 24, 4
SDL_PIXELFORMAT_BGR888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, \
			   SDL_PACKEDLAYOUT_8888, 24, 4
SDL_PIXELFORMAT_BGRX8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, \
			   SDL_PACKEDLAYOUT_8888, 24, 4
SDL_PIXELFORMAT_ARGB8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, \
			   SDL_PACKEDLAYOUT_8888, 32, 4
SDL_PIXELFORMAT_RGBA8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, \
			   SDL_PACKEDLAYOUT_8888, 32, 4
SDL_PIXELFORMAT_ABGR8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, \
			   SDL_PACKEDLAYOUT_8888, 32, 4
SDL_PIXELFORMAT_BGRA8888 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, \
			   SDL_PACKEDLAYOUT_8888, 32, 4
SDL_PIXELFORMAT_ARGB2101010 \
    SDL_DEFINE_PIXELFORMAT SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, \
			   SDL_PACKEDLAYOUT_2101010, 32, 4

SDL_PIXELFORMAT_YV12 = 'YV12'
SDL_PIXELFORMAT_IYUV = 'IYUV'
SDL_PIXELFORMAT_YUY2 = 'YUY2'
SDL_PIXELFORMAT_UYVY = 'UYVY'
SDL_PIXELFORMAT_YVYU = 'YVYU'

; Audio format flags

AUDIO_U8     = 0x0008		; Unsigned 8-bit samples */
AUDIO_S8     = 0x8008		; Signed 8-bit samples */
AUDIO_U16LSB = 0x0010		; Unsigned 16-bit samples */
AUDIO_S16LSB = 0x8010		; Signed 16-bit samples */
AUDIO_U16MSB = 0x1010		; As above, but big-endian byte order */
AUDIO_S16MSB = 0x9010		; As above, but big-endian byte order */
AUDIO_U16    = AUDIO_U16LSB
AUDIO_S16    = AUDIO_S16LSB
AUDIO_S32LSB = 0x8020		; 32-bit integer samples */
AUDIO_S32MSB = 0x9020		; As above, but big-endian byte order */
AUDIO_S32    = AUDIO_S32LSB
AUDIO_F32LSB = 0x8120		; 32-bit floating point samples */
AUDIO_F32MSB = 0x9120		; As above, but big-endian byte order */
AUDIO_F32    = AUDIO_F32LSB
AUDIO_U16SYS = AUDIO_U16LSB
AUDIO_S16SYS = AUDIO_S16LSB
AUDIO_S32SYS = AUDIO_S32LSB
AUDIO_F32SYS = AUDIO_F32LSB

; The types of events that can be delivered

SDL_FIRSTEVENT		     = 0
SDL_QUIT		     = 0x100	 ; User-requested quit
SDL_APP_TERMINATING	     = 0x101	 ; The application is being terminated by the OS
					 ; Called on iOS in applicationWillTerminate()
					 ; Called on Android in onDestroy()
SDL_APP_LOWMEMORY	     = 0x102	 ; The application is low on memory free memory if possible.
					 ; Called on iOS in applicationDidReceiveMemoryWarning()
					 ; Called on Android in onLowMemory()
SDL_APP_WILLENTERBACKGROUND  = 0x103	 ; The application is about to enter the background
					 ; Called on iOS in applicationWillResignActive()
					 ; Called on Android in onPause()
SDL_APP_DIDENTERBACKGROUND   = 0x104	 ; The application did enter the background and may not get CPU for some time
					 ; Called on iOS in applicationDidEnterBackground()
					 ; Called on Android in onPause()
SDL_APP_WILLENTERFOREGROUND  = 0x105	 ; The application is about to enter the foreground
					 ; Called on iOS in applicationWillEnterForeground()
					 ; Called on Android in onResume()
SDL_APP_DIDENTERFOREGROUND   = 0x106	 ; The application is now interactive
					 ; Called on iOS in applicationDidBecomeActive()
					 ; Called on Android in onResume()
SDL_WINDOWEVENT 	     = 0x200	 ; Window state change
SDL_SYSWMEVENT		     = 0x201	 ; System specific event
SDL_KEYDOWN		     = 0x300	 ; Key pressed
SDL_KEYUP		     = 0x301	 ; Key released
SDL_TEXTEDITING 	     = 0x302	 ; Keyboard text editing (composition)
SDL_TEXTINPUT		     = 0x303	 ; Keyboard text input
SDL_MOUSEMOTION 	     = 0x400	 ; Mouse moved
SDL_MOUSEBUTTONDOWN	     = 0x401	 ; Mouse button pressed
SDL_MOUSEBUTTONUP	     = 0x402	 ; Mouse button released
SDL_MOUSEWHEEL		     = 0x403	 ; Mouse wheel motion
SDL_JOYAXISMOTION	     = 0x600	 ; Joystick axis motion
SDL_JOYBALLMOTION	     = 0x601	 ; Joystick trackball motion
SDL_JOYHATMOTION	     = 0x602	 ; Joystick hat position change
SDL_JOYBUTTONDOWN	     = 0x603	 ; Joystick button pressed
SDL_JOYBUTTONUP 	     = 0x604	 ; Joystick button released
SDL_JOYDEVICEADDED	     = 0x605	 ; A new joystick has been inserted into the system
SDL_JOYDEVICEREMOVED	     = 0x606	 ; An opened joystick has been removed
SDL_CONTROLLERAXISMOTION     = 0x650	 ; Game controller axis motion
SDL_CONTROLLERBUTTONDOWN     = 0x651	 ; Game controller button pressed
SDL_CONTROLLERBUTTONUP	     = 0x652	 ; Game controller button released
SDL_CONTROLLERDEVICEADDED    = 0x653	 ; A new Game controller has been inserted into the system
SDL_CONTROLLERDEVICEREMOVED  = 0x654	 ; An opened Game controller has been removed
SDL_CONTROLLERDEVICEREMAPPED = 0x655	 ; The controller mapping was updated
SDL_FINGERDOWN		     = 0x700
SDL_FINGERUP		     = 0x701
SDL_FINGERMOTION	     = 0x702
SDL_DOLLARGESTURE	     = 0x800
SDL_DOLLARRECORD	     = 0x801
SDL_MULTIGESTURE	     = 0x802
SDL_CLIPBOARDUPDATE	     = 0x900	 ; The clipboard changed
SDL_DROPFILE		     = 0x1000	 ; The system requests a file open
SDL_RENDER_TARGETS_RESET     = 0x2000	 ; The render targets have been reset
SDL_USEREVENT		     = 0x8000
SDL_LASTEVENT		     = 0xFFFF

; Keyboard scancodes

SDL_SCANCODE_UNKNOWN = 0
SDL_SCANCODE_A = 4
SDL_SCANCODE_B = 5
SDL_SCANCODE_C = 6
SDL_SCANCODE_D = 7
SDL_SCANCODE_E = 8
SDL_SCANCODE_F = 9
SDL_SCANCODE_G = 10
SDL_SCANCODE_H = 11
SDL_SCANCODE_I = 12
SDL_SCANCODE_J = 13
SDL_SCANCODE_K = 14
SDL_SCANCODE_L = 15
SDL_SCANCODE_M = 16
SDL_SCANCODE_N = 17
SDL_SCANCODE_O = 18
SDL_SCANCODE_P = 19
SDL_SCANCODE_Q = 20
SDL_SCANCODE_R = 21
SDL_SCANCODE_S = 22
SDL_SCANCODE_T = 23
SDL_SCANCODE_U = 24
SDL_SCANCODE_V = 25
SDL_SCANCODE_W = 26
SDL_SCANCODE_X = 27
SDL_SCANCODE_Y = 28
SDL_SCANCODE_Z = 29
SDL_SCANCODE_1 = 30
SDL_SCANCODE_2 = 31
SDL_SCANCODE_3 = 32
SDL_SCANCODE_4 = 33
SDL_SCANCODE_5 = 34
SDL_SCANCODE_6 = 35
SDL_SCANCODE_7 = 36
SDL_SCANCODE_8 = 37
SDL_SCANCODE_9 = 38
SDL_SCANCODE_0 = 39
SDL_SCANCODE_RETURN = 40
SDL_SCANCODE_ESCAPE = 41
SDL_SCANCODE_BACKSPACE = 42
SDL_SCANCODE_TAB = 43
SDL_SCANCODE_SPACE = 44
SDL_SCANCODE_MINUS = 45
SDL_SCANCODE_EQUALS = 46
SDL_SCANCODE_LEFTBRACKET = 47
SDL_SCANCODE_RIGHTBRACKET = 48
SDL_SCANCODE_BACKSLASH = 49
SDL_SCANCODE_NONUSHASH = 50
SDL_SCANCODE_SEMICOLON = 51
SDL_SCANCODE_APOSTROPHE = 52
SDL_SCANCODE_GRAVE = 53
SDL_SCANCODE_COMMA = 54
SDL_SCANCODE_PERIOD = 55
SDL_SCANCODE_SLASH = 56
SDL_SCANCODE_CAPSLOCK = 57
SDL_SCANCODE_F1 = 58
SDL_SCANCODE_F2 = 59
SDL_SCANCODE_F3 = 60
SDL_SCANCODE_F4 = 61
SDL_SCANCODE_F5 = 62
SDL_SCANCODE_F6 = 63
SDL_SCANCODE_F7 = 64
SDL_SCANCODE_F8 = 65
SDL_SCANCODE_F9 = 66
SDL_SCANCODE_F10 = 67
SDL_SCANCODE_F11 = 68
SDL_SCANCODE_F12 = 69
SDL_SCANCODE_PRINTSCREEN = 70
SDL_SCANCODE_SCROLLLOCK = 71
SDL_SCANCODE_PAUSE = 72
SDL_SCANCODE_INSERT = 73
SDL_SCANCODE_HOME = 74
SDL_SCANCODE_PAGEUP = 75
SDL_SCANCODE_DELETE = 76
SDL_SCANCODE_END = 77
SDL_SCANCODE_PAGEDOWN = 78
SDL_SCANCODE_RIGHT = 79
SDL_SCANCODE_LEFT = 80
SDL_SCANCODE_DOWN = 81
SDL_SCANCODE_UP = 82
SDL_SCANCODE_NUMLOCKCLEAR = 83
SDL_SCANCODE_KP_DIVIDE = 84
SDL_SCANCODE_KP_MULTIPLY = 85
SDL_SCANCODE_KP_MINUS = 86
SDL_SCANCODE_KP_PLUS = 87
SDL_SCANCODE_KP_ENTER = 88
SDL_SCANCODE_KP_1 = 89
SDL_SCANCODE_KP_2 = 90
SDL_SCANCODE_KP_3 = 91
SDL_SCANCODE_KP_4 = 92
SDL_SCANCODE_KP_5 = 93
SDL_SCANCODE_KP_6 = 94
SDL_SCANCODE_KP_7 = 95
SDL_SCANCODE_KP_8 = 96
SDL_SCANCODE_KP_9 = 97
SDL_SCANCODE_KP_0 = 98
SDL_SCANCODE_KP_PERIOD = 99
SDL_SCANCODE_NONUSBACKSLASH = 100
SDL_SCANCODE_APPLICATION = 101
SDL_SCANCODE_POWER = 102
SDL_SCANCODE_KP_EQUALS = 103
SDL_SCANCODE_F13 = 104
SDL_SCANCODE_F14 = 105
SDL_SCANCODE_F15 = 106
SDL_SCANCODE_F16 = 107
SDL_SCANCODE_F17 = 108
SDL_SCANCODE_F18 = 109
SDL_SCANCODE_F19 = 110
SDL_SCANCODE_F20 = 111
SDL_SCANCODE_F21 = 112
SDL_SCANCODE_F22 = 113
SDL_SCANCODE_F23 = 114
SDL_SCANCODE_F24 = 115
SDL_SCANCODE_EXECUTE = 116
SDL_SCANCODE_HELP = 117
SDL_SCANCODE_MENU = 118
SDL_SCANCODE_SELECT = 119
SDL_SCANCODE_STOP = 120
SDL_SCANCODE_AGAIN = 121
SDL_SCANCODE_UNDO = 122
SDL_SCANCODE_CUT = 123
SDL_SCANCODE_COPY = 124
SDL_SCANCODE_PASTE = 125
SDL_SCANCODE_FIND = 126
SDL_SCANCODE_MUTE = 127
SDL_SCANCODE_VOLUMEUP = 128
SDL_SCANCODE_VOLUMEDOWN = 129
SDL_SCANCODE_KP_COMMA = 133
SDL_SCANCODE_KP_EQUALSAS400 = 134
SDL_SCANCODE_INTERNATIONAL1 = 135
SDL_SCANCODE_INTERNATIONAL2 = 136
SDL_SCANCODE_INTERNATIONAL3 = 137
SDL_SCANCODE_INTERNATIONAL4 = 138
SDL_SCANCODE_INTERNATIONAL5 = 139
SDL_SCANCODE_INTERNATIONAL6 = 140
SDL_SCANCODE_INTERNATIONAL7 = 141
SDL_SCANCODE_INTERNATIONAL8 = 142
SDL_SCANCODE_INTERNATIONAL9 = 143
SDL_SCANCODE_LANG1 = 144
SDL_SCANCODE_LANG2 = 145
SDL_SCANCODE_LANG3 = 146
SDL_SCANCODE_LANG4 = 147
SDL_SCANCODE_LANG5 = 148
SDL_SCANCODE_LANG6 = 149
SDL_SCANCODE_LANG7 = 150
SDL_SCANCODE_LANG8 = 151
SDL_SCANCODE_LANG9 = 152
SDL_SCANCODE_ALTERASE = 153
SDL_SCANCODE_SYSREQ = 154
SDL_SCANCODE_CANCEL = 155
SDL_SCANCODE_CLEAR = 156
SDL_SCANCODE_PRIOR = 157
SDL_SCANCODE_RETURN2 = 158
SDL_SCANCODE_SEPARATOR = 159
SDL_SCANCODE_OUT = 160
SDL_SCANCODE_OPER = 161
SDL_SCANCODE_CLEARAGAIN = 162
SDL_SCANCODE_CRSEL = 163
SDL_SCANCODE_EXSEL = 164
SDL_SCANCODE_KP_00 = 176
SDL_SCANCODE_KP_000 = 177
SDL_SCANCODE_THOUSANDSSEPARATOR = 178
SDL_SCANCODE_DECIMALSEPARATOR = 179
SDL_SCANCODE_CURRENCYUNIT = 180
SDL_SCANCODE_CURRENCYSUBUNIT = 181
SDL_SCANCODE_KP_LEFTPAREN = 182
SDL_SCANCODE_KP_RIGHTPAREN = 183
SDL_SCANCODE_KP_LEFTBRACE = 184
SDL_SCANCODE_KP_RIGHTBRACE = 185
SDL_SCANCODE_KP_TAB = 186
SDL_SCANCODE_KP_BACKSPACE = 187
SDL_SCANCODE_KP_A = 188
SDL_SCANCODE_KP_B = 189
SDL_SCANCODE_KP_C = 190
SDL_SCANCODE_KP_D = 191
SDL_SCANCODE_KP_E = 192
SDL_SCANCODE_KP_F = 193
SDL_SCANCODE_KP_XOR = 194
SDL_SCANCODE_KP_POWER = 195
SDL_SCANCODE_KP_PERCENT = 196
SDL_SCANCODE_KP_LESS = 197
SDL_SCANCODE_KP_GREATER = 198
SDL_SCANCODE_KP_AMPERSAND = 199
SDL_SCANCODE_KP_DBLAMPERSAND = 200
SDL_SCANCODE_KP_VERTICALBAR = 201
SDL_SCANCODE_KP_DBLVERTICALBAR = 202
SDL_SCANCODE_KP_COLON = 203
SDL_SCANCODE_KP_HASH = 204
SDL_SCANCODE_KP_SPACE = 205
SDL_SCANCODE_KP_AT = 206
SDL_SCANCODE_KP_EXCLAM = 207
SDL_SCANCODE_KP_MEMSTORE = 208
SDL_SCANCODE_KP_MEMRECALL = 209
SDL_SCANCODE_KP_MEMCLEAR = 210
SDL_SCANCODE_KP_MEMADD = 211
SDL_SCANCODE_KP_MEMSUBTRACT = 212
SDL_SCANCODE_KP_MEMMULTIPLY = 213
SDL_SCANCODE_KP_MEMDIVIDE = 214
SDL_SCANCODE_KP_PLUSMINUS = 215
SDL_SCANCODE_KP_CLEAR = 216
SDL_SCANCODE_KP_CLEARENTRY = 217
SDL_SCANCODE_KP_BINARY = 218
SDL_SCANCODE_KP_OCTAL = 219
SDL_SCANCODE_KP_DECIMAL = 220
SDL_SCANCODE_KP_HEXADECIMAL = 221
SDL_SCANCODE_LCTRL = 224
SDL_SCANCODE_LSHIFT = 225
SDL_SCANCODE_LALT = 226
SDL_SCANCODE_LGUI = 227
SDL_SCANCODE_RCTRL = 228
SDL_SCANCODE_RSHIFT = 229
SDL_SCANCODE_RALT = 230
SDL_SCANCODE_RGUI = 231
SDL_SCANCODE_MODE = 257
SDL_SCANCODE_AUDIONEXT = 258
SDL_SCANCODE_AUDIOPREV = 259
SDL_SCANCODE_AUDIOSTOP = 260
SDL_SCANCODE_AUDIOPLAY = 261
SDL_SCANCODE_AUDIOMUTE = 262
SDL_SCANCODE_MEDIASELECT = 263
SDL_SCANCODE_WWW = 264
SDL_SCANCODE_MAIL = 265
SDL_SCANCODE_CALCULATOR = 266
SDL_SCANCODE_COMPUTER = 267
SDL_SCANCODE_AC_SEARCH = 268
SDL_SCANCODE_AC_HOME = 269
SDL_SCANCODE_AC_BACK = 270
SDL_SCANCODE_AC_FORWARD = 271
SDL_SCANCODE_AC_STOP = 272
SDL_SCANCODE_AC_REFRESH = 273
SDL_SCANCODE_AC_BOOKMARKS = 274
SDL_SCANCODE_BRIGHTNESSDOWN = 275
SDL_SCANCODE_BRIGHTNESSUP = 276
SDL_SCANCODE_DISPLAYSWITCH = 277
SDL_SCANCODE_KBDILLUMTOGGLE = 278
SDL_SCANCODE_KBDILLUMDOWN = 279
SDL_SCANCODE_KBDILLUMUP = 280
SDL_SCANCODE_EJECT = 281
SDL_SCANCODE_SLEEP = 282
SDL_SCANCODE_APP1 = 283
SDL_SCANCODE_APP2 = 284
SDL_NUM_SCANCODES = 512


; enum SDL_Keymod
KMOD_NONE	:= 0x0000
KMOD_LSHIFT	:= 0x0001
KMOD_RSHIFT	:= 0x0002
KMOD_LCTRL	:= 0x0040
KMOD_RCTRL	:= 0x0080
KMOD_LALT	:= 0x0100
KMOD_RALT	:= 0x0200
KMOD_LGUI	:= 0x0400
KMOD_RGUI	:= 0x0800
KMOD_NUM	:= 0x1000
KMOD_CAPS	:= 0x2000
KMOD_MODE	:= 0x4000
KMOD_SCROLL	:= 0x8000

KMOD_CTRL	:= KMOD_LCTRL+KMOD_RCTRL
KMOD_SHIFT	:= KMOD_LSHIFT+KMOD_RSHIFT
KMOD_ALT	:= KMOD_LALT+KMOD_RALT
KMOD_GUI	:= KMOD_LGUI+KMOD_RGUI

KMOD_RESERVED	:= KMOD_SCROLL ; This is for source-level compatibility with SDL 2.0.0.




; SDL_MessageBox flags

SDL_MESSAGEBOX_ERROR	    = 0x00000010
SDL_MESSAGEBOX_WARNING	    = 0x00000020
SDL_MESSAGEBOX_INFORMATION  = 0x00000040


