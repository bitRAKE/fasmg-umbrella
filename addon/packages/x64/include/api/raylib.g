; raylib.dll
; version 4.2.0.0
; GUID {b12db095-fa4c-4e44-ac72-40fe8de27f3f}

; TODO: convert API definitions

PE.__IMPORTS equ 'raylib',\
AttachAudioStreamProcessor,\
BeginBlendMode,\
BeginDrawing,\
BeginMode2D,\
BeginMode3D,\
BeginScissorMode,\
BeginShaderMode,\
BeginTextureMode,\
BeginVrStereoMode,\
ChangeDirectory,\
CheckCollisionBoxSphere,\
CheckCollisionBoxes,\
CheckCollisionCircleRec,\
CheckCollisionCircles,\
CheckCollisionLines,\
CheckCollisionPointCircle,\
CheckCollisionPointLine,\
CheckCollisionPointRec,\
CheckCollisionPointTriangle,\
CheckCollisionRecs,\
CheckCollisionSpheres,\
Clamp,\
ClearBackground,\
ClearWindowState,\
CloseAudioDevice,\
CloseWindow,\
CodepointToUTF8,\
ColorAlpha,\
ColorAlphaBlend,\
ColorFromHSV,\
ColorFromNormalized,\
ColorNormalize,\
ColorToHSV,\
ColorToInt,\
CompressData,\
DecodeDataBase64,\
DecompressData,\
DetachAudioStreamProcessor,\
DirectoryExists,\
DisableCursor,\
DisableEventWaiting,\
DrawBillboard,\
DrawBillboardPro,\
DrawBillboardRec,\
DrawBoundingBox,\
DrawCircle,\
DrawCircle3D,\
DrawCircleGradient,\
DrawCircleLines,\
DrawCircleSector,\
DrawCircleSectorLines,\
DrawCircleV,\
DrawCube,\
DrawCubeTexture,\
DrawCubeTextureRec,\
DrawCubeV,\
DrawCubeWires,\
DrawCubeWiresV,\
DrawCylinder,\
DrawCylinderEx,\
DrawCylinderWires,\
DrawCylinderWiresEx,\
DrawEllipse,\
DrawEllipseLines,\
DrawFPS,\
DrawGrid,\
DrawLine,\
DrawLine3D,\
DrawLineBezier,\
DrawLineBezierCubic,\
DrawLineBezierQuad,\
DrawLineEx,\
DrawLineStrip,\
DrawLineV,\
DrawMesh,\
DrawMeshInstanced,\
DrawModel,\
DrawModelEx,\
DrawModelWires,\
DrawModelWiresEx,\
DrawPixel,\
DrawPixelV,\
DrawPlane,\
DrawPoint3D,\
DrawPoly,\
DrawPolyLines,\
DrawPolyLinesEx,\
DrawRay,\
DrawRectangle,\
DrawRectangleGradientEx,\
DrawRectangleGradientH,\
DrawRectangleGradientV,\
DrawRectangleLines,\
DrawRectangleLinesEx,\
DrawRectanglePro,\
DrawRectangleRec,\
DrawRectangleRounded,\
DrawRectangleRoundedLines,\
DrawRectangleV,\
DrawRing,\
DrawRingLines,\
DrawSphere,\
DrawSphereEx,\
DrawSphereWires,\
DrawText,\
DrawTextCodepoint,\
DrawTextCodepoints,\
DrawTextEx,\
DrawTextPro,\
DrawTexture,\
DrawTextureEx,\
DrawTextureNPatch,\
DrawTexturePoly,\
DrawTexturePro,\
DrawTextureQuad,\
DrawTextureRec,\
DrawTextureTiled,\
DrawTextureV,\
DrawTriangle,\
DrawTriangle3D,\
DrawTriangleFan,\
DrawTriangleLines,\
DrawTriangleStrip,\
DrawTriangleStrip3D,\
EnableCursor,\
EnableEventWaiting,\
EncodeDataBase64,\
EndBlendMode,\
EndDrawing,\
EndMode2D,\
EndMode3D,\
EndScissorMode,\
EndShaderMode,\
EndTextureMode,\
EndVrStereoMode,\
ExportDataAsCode,\
ExportFontAsCode,\
ExportImage,\
ExportImageAsCode,\
ExportMesh,\
ExportWave,\
ExportWaveAsCode,\
Fade,\
FileExists,\
FloatEquals,\
GenImageCellular,\
GenImageChecked,\
GenImageColor,\
GenImageFontAtlas,\
GenImageGradientH,\
GenImageGradientRadial,\
GenImageGradientV,\
GenImageWhiteNoise,\
GenMeshCone,\
GenMeshCube,\
GenMeshCubicmap,\
GenMeshCylinder,\
GenMeshHeightmap,\
GenMeshHemiSphere,\
GenMeshKnot,\
GenMeshPlane,\
GenMeshPoly,\
GenMeshSphere,\
GenMeshTangents,\
GenMeshTorus,\
GenTextureMipmaps,\
GetApplicationDirectory,\
GetCameraMatrix,\
GetCameraMatrix2D,\
GetCharPressed,\
GetClipboardText,\
GetCodepoint,\
GetCodepointCount,\
GetCollisionRec,\
GetColor,\
GetCurrentMonitor,\
GetDirectoryPath,\
GetFPS,\
GetFileExtension,\
GetFileLength,\
GetFileModTime,\
GetFileName,\
GetFileNameWithoutExt,\
GetFontDefault,\
GetFrameTime,\
GetGamepadAxisCount,\
GetGamepadAxisMovement,\
GetGamepadButtonPressed,\
GetGamepadName,\
GetGestureDetected,\
GetGestureDragAngle,\
GetGestureDragVector,\
GetGestureHoldDuration,\
GetGesturePinchAngle,\
GetGesturePinchVector,\
GetGlyphAtlasRec,\
GetGlyphIndex,\
GetGlyphInfo,\
GetImageAlphaBorder,\
GetImageColor,\
GetKeyPressed,\
GetMeshBoundingBox,\
GetModelBoundingBox,\
GetMonitorCount,\
GetMonitorHeight,\
GetMonitorName,\
GetMonitorPhysicalHeight,\
GetMonitorPhysicalWidth,\
GetMonitorPosition,\
GetMonitorRefreshRate,\
GetMonitorWidth,\
GetMouseDelta,\
GetMousePosition,\
GetMouseRay,\
GetMouseWheelMove,\
GetMouseWheelMoveV,\
GetMouseX,\
GetMouseY,\
GetMusicTimeLength,\
GetMusicTimePlayed,\
GetPixelColor,\
GetPixelDataSize,\
GetPrevDirectoryPath,\
GetRandomValue,\
GetRayCollisionBox,\
GetRayCollisionMesh,\
GetRayCollisionQuad,\
GetRayCollisionSphere,\
GetRayCollisionTriangle,\
GetRenderHeight,\
GetRenderWidth,\
GetScreenHeight,\
GetScreenToWorld2D,\
GetScreenWidth,\
GetShaderLocation,\
GetShaderLocationAttrib,\
GetSoundsPlaying,\
GetTime,\
GetTouchPointCount,\
GetTouchPointId,\
GetTouchPosition,\
GetTouchX,\
GetTouchY,\
GetWindowHandle,\
GetWindowPosition,\
GetWindowScaleDPI,\
GetWorkingDirectory,\
GetWorldToScreen,\
GetWorldToScreen2D,\
GetWorldToScreenEx,\
HideCursor,\
ImageAlphaClear,\
ImageAlphaCrop,\
ImageAlphaMask,\
ImageAlphaPremultiply,\
ImageClearBackground,\
ImageColorBrightness,\
ImageColorContrast,\
ImageColorGrayscale,\
ImageColorInvert,\
ImageColorReplace,\
ImageColorTint,\
ImageCopy,\
ImageCrop,\
ImageDither,\
ImageDraw,\
ImageDrawCircle,\
ImageDrawCircleV,\
ImageDrawLine,\
ImageDrawLineV,\
ImageDrawPixel,\
ImageDrawPixelV,\
ImageDrawRectangle,\
ImageDrawRectangleLines,\
ImageDrawRectangleRec,\
ImageDrawRectangleV,\
ImageDrawText,\
ImageDrawTextEx,\
ImageFlipHorizontal,\
ImageFlipVertical,\
ImageFormat,\
ImageFromImage,\
ImageMipmaps,\
ImageResize,\
ImageResizeCanvas,\
ImageResizeNN,\
ImageRotateCCW,\
ImageRotateCW,\
ImageText,\
ImageTextEx,\
ImageToPOT,\
InitAudioDevice,\
InitWindow,\
IsAudioDeviceReady,\
IsAudioStreamPlaying,\
IsAudioStreamProcessed,\
IsCursorHidden,\
IsCursorOnScreen,\
IsFileDropped,\
IsFileExtension,\
IsGamepadAvailable,\
IsGamepadButtonDown,\
IsGamepadButtonPressed,\
IsGamepadButtonReleased,\
IsGamepadButtonUp,\
IsGestureDetected,\
IsKeyDown,\
IsKeyPressed,\
IsKeyReleased,\
IsKeyUp,\
IsModelAnimationValid,\
IsMouseButtonDown,\
IsMouseButtonPressed,\
IsMouseButtonReleased,\
IsMouseButtonUp,\
IsMusicStreamPlaying,\
IsPathFile,\
IsSoundPlaying,\
IsWindowFocused,\
IsWindowFullscreen,\
IsWindowHidden,\
IsWindowMaximized,\
IsWindowMinimized,\
IsWindowReady,\
IsWindowResized,\
IsWindowState,\
Lerp,\
LoadAudioStream,\
LoadCodepoints,\
LoadDirectoryFiles,\
LoadDirectoryFilesEx,\
LoadDroppedFiles,\
LoadFileData,\
LoadFileText,\
LoadFont,\
LoadFontData,\
LoadFontEx,\
LoadFontFromImage,\
LoadFontFromMemory,\
LoadImage,\
LoadImageAnim,\
LoadImageColors,\
LoadImageFromMemory,\
LoadImageFromScreen,\
LoadImageFromTexture,\
LoadImagePalette,\
LoadImageRaw,\
LoadMaterialDefault,\
LoadMaterials,\
LoadModel,\
LoadModelAnimations,\
LoadModelFromMesh,\
LoadMusicStream,\
LoadMusicStreamFromMemory,\
LoadRenderTexture,\
LoadShader,\
LoadShaderFromMemory,\
LoadSound,\
LoadSoundFromWave,\
LoadTexture,\
LoadTextureCubemap,\
LoadTextureFromImage,\
LoadVrStereoConfig,\
LoadWave,\
LoadWaveFromMemory,\
LoadWaveSamples,\
MatrixAdd,\
MatrixDeterminant,\
MatrixFrustum,\
MatrixIdentity,\
MatrixInvert,\
MatrixLookAt,\
MatrixMultiply,\
MatrixOrtho,\
MatrixPerspective,\
MatrixRotate,\
MatrixRotateX,\
MatrixRotateXYZ,\
MatrixRotateY,\
MatrixRotateZ,\
MatrixRotateZYX,\
MatrixScale,\
MatrixSubtract,\
MatrixToFloatV,\
MatrixTrace,\
MatrixTranslate,\
MatrixTranspose,\
MaximizeWindow,\
MeasureText,\
MeasureTextEx,\
MemAlloc,\
MemFree,\
MemRealloc,\
MinimizeWindow,\
Normalize,\
OpenURL,\
PauseAudioStream,\
PauseMusicStream,\
PauseSound,\
PlayAudioStream,\
PlayMusicStream,\
PlaySound,\
PlaySoundMulti,\
PollInputEvents,\
QuaternionAdd,\
QuaternionAddValue,\
QuaternionDivide,\
QuaternionEquals,\
QuaternionFromAxisAngle,\
QuaternionFromEuler,\
QuaternionFromMatrix,\
QuaternionFromVector3ToVector3,\
QuaternionIdentity,\
QuaternionInvert,\
QuaternionLength,\
QuaternionLerp,\
QuaternionMultiply,\
QuaternionNlerp,\
QuaternionNormalize,\
QuaternionScale,\
QuaternionSlerp,\
QuaternionSubtract,\
QuaternionSubtractValue,\
QuaternionToAxisAngle,\
QuaternionToEuler,\
QuaternionToMatrix,\
QuaternionTransform,\
Remap,\
RestoreWindow,\
ResumeAudioStream,\
ResumeMusicStream,\
ResumeSound,\
SaveFileData,\
SaveFileText,\
SeekMusicStream,\
SetAudioStreamBufferSizeDefault,\
SetAudioStreamCallback,\
SetAudioStreamPan,\
SetAudioStreamPitch,\
SetAudioStreamVolume,\
SetCameraAltControl,\
SetCameraMode,\
SetCameraMoveControls,\
SetCameraPanControl,\
SetCameraSmoothZoomControl,\
SetClipboardText,\
SetConfigFlags,\
SetExitKey,\
SetGamepadMappings,\
SetGesturesEnabled,\
SetLoadFileDataCallback,\
SetLoadFileTextCallback,\
SetMasterVolume,\
SetMaterialTexture,\
SetModelMeshMaterial,\
SetMouseCursor,\
SetMouseOffset,\
SetMousePosition,\
SetMouseScale,\
SetMusicPan,\
SetMusicPitch,\
SetMusicVolume,\
SetPixelColor,\
SetRandomSeed,\
SetSaveFileDataCallback,\
SetSaveFileTextCallback,\
SetShaderValue,\
SetShaderValueMatrix,\
SetShaderValueTexture,\
SetShaderValueV,\
SetShapesTexture,\
SetSoundPan,\
SetSoundPitch,\
SetSoundVolume,\
SetTargetFPS,\
SetTextureFilter,\
SetTextureWrap,\
SetTraceLogCallback,\
SetTraceLogLevel,\
SetWindowIcon,\
SetWindowMinSize,\
SetWindowMonitor,\
SetWindowOpacity,\
SetWindowPosition,\
SetWindowSize,\
SetWindowState,\
SetWindowTitle,\
ShowCursor,\
StopAudioStream,\
StopMusicStream,\
StopSound,\
StopSoundMulti,\
SwapScreenBuffer,\
TakeScreenshot,\
TextAppend,\
TextCodepointsToUTF8,\
TextCopy,\
TextFindIndex,\
TextFormat,\
TextInsert,\
TextIsEqual,\
TextJoin,\
TextLength,\
TextReplace,\
TextSplit,\
TextSubtext,\
TextToInteger,\
TextToLower,\
TextToPascal,\
TextToUpper,\
ToggleFullscreen,\
TraceLog,\
UnloadAudioStream,\
UnloadCodepoints,\
UnloadDirectoryFiles,\
UnloadDroppedFiles,\
UnloadFileData,\
UnloadFileText,\
UnloadFont,\
UnloadFontData,\
UnloadImage,\
UnloadImageColors,\
UnloadImagePalette,\
UnloadMaterial,\
UnloadMesh,\
UnloadModel,\
UnloadModelAnimation,\
UnloadModelAnimations,\
UnloadModelKeepMeshes,\
UnloadMusicStream,\
UnloadRenderTexture,\
UnloadShader,\
UnloadSound,\
UnloadTexture,\
UnloadVrStereoConfig,\
UnloadWave,\
UnloadWaveSamples,\
UpdateAudioStream,\
UpdateCamera,\
UpdateMeshBuffer,\
UpdateModelAnimation,\
UpdateMusicStream,\
UpdateSound,\
UpdateTexture,\
UpdateTextureRec,\
UploadMesh,\
Vector2Add,\
Vector2AddValue,\
Vector2Angle,\
Vector2Clamp,\
Vector2ClampValue,\
Vector2Distance,\
Vector2DistanceSqr,\
Vector2Divide,\
Vector2DotProduct,\
Vector2Equals,\
Vector2Invert,\
Vector2Length,\
Vector2LengthSqr,\
Vector2Lerp,\
Vector2MoveTowards,\
Vector2Multiply,\
Vector2Negate,\
Vector2Normalize,\
Vector2One,\
Vector2Reflect,\
Vector2Rotate,\
Vector2Scale,\
Vector2Subtract,\
Vector2SubtractValue,\
Vector2Transform,\
Vector2Zero,\
Vector3Add,\
Vector3AddValue,\
Vector3Angle,\
Vector3Barycenter,\
Vector3Clamp,\
Vector3ClampValue,\
Vector3CrossProduct,\
Vector3Distance,\
Vector3DistanceSqr,\
Vector3Divide,\
Vector3DotProduct,\
Vector3Equals,\
Vector3Invert,\
Vector3Length,\
Vector3LengthSqr,\
Vector3Lerp,\
Vector3Max,\
Vector3Min,\
Vector3Multiply,\
Vector3Negate,\
Vector3Normalize,\
Vector3One,\
Vector3OrthoNormalize,\
Vector3Perpendicular,\
Vector3Reflect,\
Vector3Refract,\
Vector3RotateByAxisAngle,\
Vector3RotateByQuaternion,\
Vector3Scale,\
Vector3Subtract,\
Vector3SubtractValue,\
Vector3ToFloatV,\
Vector3Transform,\
Vector3Unproject,\
Vector3Zero,\
WaitTime,\
WaveCopy,\
WaveCrop,\
WaveFormat,\
WindowShouldClose,\
Wrap,\
rlActiveDrawBuffers,\
rlActiveTextureSlot,\
rlBegin,\
rlBindImageTexture,\
rlBindShaderBuffer,\
rlCheckErrors,\
rlCheckRenderBatchLimit,\
rlClearColor,\
rlClearScreenBuffers,\
rlColor3f,\
rlColor4f,\
rlColor4ub,\
rlCompileShader,\
rlComputeShaderDispatch,\
rlCopyBuffersElements,\
rlDisableBackfaceCulling,\
rlDisableColorBlend,\
rlDisableDepthMask,\
rlDisableDepthTest,\
rlDisableFramebuffer,\
rlDisableScissorTest,\
rlDisableShader,\
rlDisableSmoothLines,\
rlDisableStereoRender,\
rlDisableTexture,\
rlDisableTextureCubemap,\
rlDisableVertexArray,\
rlDisableVertexAttribute,\
rlDisableVertexBuffer,\
rlDisableVertexBufferElement,\
rlDisableWireMode,\
rlDrawRenderBatch,\
rlDrawRenderBatchActive,\
rlDrawVertexArray,\
rlDrawVertexArrayElements,\
rlDrawVertexArrayElementsInstanced,\
rlDrawVertexArrayInstanced,\
rlEnableBackfaceCulling,\
rlEnableColorBlend,\
rlEnableDepthMask,\
rlEnableDepthTest,\
rlEnableFramebuffer,\
rlEnableScissorTest,\
rlEnableShader,\
rlEnableSmoothLines,\
rlEnableStereoRender,\
rlEnableTexture,\
rlEnableTextureCubemap,\
rlEnableVertexArray,\
rlEnableVertexAttribute,\
rlEnableVertexBuffer,\
rlEnableVertexBufferElement,\
rlEnableWireMode,\
rlEnd,\
rlFramebufferAttach,\
rlFramebufferComplete,\
rlFrustum,\
rlGenTextureMipmaps,\
rlGetFramebufferHeight,\
rlGetFramebufferWidth,\
rlGetGlTextureFormats,\
rlGetLineWidth,\
rlGetLocationAttrib,\
rlGetLocationUniform,\
rlGetMatrixModelview,\
rlGetMatrixProjection,\
rlGetMatrixProjectionStereo,\
rlGetMatrixTransform,\
rlGetMatrixViewOffsetStereo,\
rlGetPixelFormatName,\
rlGetShaderBufferSize,\
rlGetShaderIdDefault,\
rlGetShaderLocsDefault,\
rlGetTextureIdDefault,\
rlGetVersion,\
rlIsStereoRenderEnabled,\
rlLoadComputeShaderProgram,\
rlLoadDrawCube,\
rlLoadDrawQuad,\
rlLoadExtensions,\
rlLoadFramebuffer,\
rlLoadIdentity,\
rlLoadRenderBatch,\
rlLoadShaderBuffer,\
rlLoadShaderCode,\
rlLoadShaderProgram,\
rlLoadTexture,\
rlLoadTextureCubemap,\
rlLoadTextureDepth,\
rlLoadVertexArray,\
rlLoadVertexBuffer,\
rlLoadVertexBufferElement,\
rlMatrixMode,\
rlMultMatrixf,\
rlNormal3f,\
rlOrtho,\
rlPopMatrix,\
rlPushMatrix,\
rlReadScreenPixels,\
rlReadShaderBufferElements,\
rlReadTexturePixels,\
rlRotatef,\
rlScalef,\
rlScissor,\
rlSetBlendFactors,\
rlSetBlendMode,\
rlSetFramebufferHeight,\
rlSetFramebufferWidth,\
rlSetLineWidth,\
rlSetMatrixModelview,\
rlSetMatrixProjection,\
rlSetMatrixProjectionStereo,\
rlSetMatrixViewOffsetStereo,\
rlSetRenderBatchActive,\
rlSetShader,\
rlSetTexture,\
rlSetUniform,\
rlSetUniformMatrix,\
rlSetUniformSampler,\
rlSetVertexAttribute,\
rlSetVertexAttributeDefault,\
rlSetVertexAttributeDivisor,\
rlTexCoord2f,\
rlTextureParameters,\
rlTranslatef,\
rlUnloadFramebuffer,\
rlUnloadRenderBatch,\
rlUnloadShaderBuffer,\
rlUnloadShaderProgram,\
rlUnloadTexture,\
rlUnloadVertexArray,\
rlUnloadVertexBuffer,\
rlUpdateShaderBufferElements,\
rlUpdateTexture,\
rlUpdateVertexBuffer,\
rlUpdateVertexBufferElements,\
rlVertex2f,\
rlVertex2i,\
rlVertex3f,\
rlViewport,\
rlglClose,\
rlglInit


iterate <COLOR,		RED,	GREEN,	BLUE,	ALPHA>,	\
	LIGHTGRAY,	200,	200,	200,	255,	\
	GRAY,		130,	130,	130,	255,	\
	DARKGRAY,	80,	80,	80,	255,	\
	YELLOW,		253,	249,	0,	255,	\
	GOLD,		255,	203,	0,	255,	\
	ORANGE,		255,	161,	0,	255,	\
	PINK,		255,	109,	194,	255,	\
	RED,		230,	41,	55,	255,	\
	MAROON,		190,	33,	55,	255,	\
	GREEN,		0,	228,	48,	255,	\
	LIME,		0,	158,	47,	255,	\
	DARKGREEN,	0,	117,	44,	255,	\
	SKYBLUE,	102,	191,	255,	255,	\
	BLUE,		0,	121,	241,	255,	\
	DARKBLUE,	0,	82,	172,	255,	\
	PURPLE,		200,	122,	255,	255,	\
	VIOLET,		135,	60,	190,	255,	\
	DARKPURPL,	112,	31,	126,	255,	\
	BEIGE,		211,	176,	131,	255,	\
	BROWN,		127,	106,	79,	255,	\
	DARKBROWN,	76,	63,	47,	255,	\
	\
	WHITE,		255,	255,	255,	255,	\
	RAYWHITE,	245,	245,	245,	255,	\
	MAGENTA,	255,	0,	255,	255,	\
	BLACK,		0,	0,	0,	255,	\
	BLANK,		0,	0,	0,	0

	COLOR := RED or (GREEN shl 8) or (BLUE shl 16) or (ALPHA shl 24)
end iterate



; ConfigFlags ; System/Window config flags
; NOTE: Every bit registers one state (use it with bit masks)
; By default all flags are set to 0
FLAG_FULLSCREEN_MODE		:= 0x00000002 ; Set to run program in fullscreen
FLAG_WINDOW_RESIZABLE		:= 0x00000004 ; Set to allow resizable window
FLAG_WINDOW_UNDECORATED		:= 0x00000008 ; Set to disable window decoration (frame and buttons)
FLAG_WINDOW_TRANSPARENT		:= 0x00000010 ; Set to allow transparent framebuffer
FLAG_MSAA_4X_HINT		:= 0x00000020 ; Set to try enabling MSAA 4X
FLAG_VSYNC_HINT			:= 0x00000040 ; Set to try enabling V-Sync on GPU
FLAG_WINDOW_HIDDEN		:= 0x00000080 ; Set to hide window
FLAG_WINDOW_ALWAYS_RUN		:= 0x00000100 ; Set to allow windows running while minimized
FLAG_WINDOW_MINIMIZED		:= 0x00000200 ; Set to minimize window (iconify)
FLAG_WINDOW_MAXIMIZED		:= 0x00000400 ; Set to maximize window (expanded to monitor)
FLAG_WINDOW_UNFOCUSED		:= 0x00000800 ; Set to window non focused
FLAG_WINDOW_TOPMOST		:= 0x00001000 ; Set to window always on top
FLAG_WINDOW_HIGHDPI		:= 0x00002000 ; Set to support HighDPI
FLAG_WINDOW_MOUSE_PASSTHROUGH	:= 0x00004000 ; Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
FLAG_INTERLACED_HINT		:= 0x00010000 ; Set to try enabling interlaced video format (for V3D)


; TraceLogLevel ; Trace log level
; NOTE: Organized by priority level
LOG_ALL		:= 0 ; Display all logs
LOG_TRACE	:= 1 ; Trace logging, intended for internal use only
LOG_DEBUG	:= 2 ; Debug logging, used for internal debugging, it should be disabled on release builds
LOG_INFO	:= 3 ; Info logging, used for program execution info
LOG_WARNING	:= 4 ; Warning logging, used on recoverable failures
LOG_ERROR	:= 5 ; Error logging, used on unrecoverable failures
LOG_FATAL	:= 6 ; Fatal logging, used to abort program: exit(EXIT_FAILURE)
LOG_NONE	:= 7 ; Disable logging


; KeyboardKey ; Keyboard keys (US keyboard layout)
; NOTE: Use GetKeyPressed() to allow redefining
; required keys for alternative layouts
KEY_NULL		:= 0	; Key: NULL, used for no key pressed
; Alphanumeric keys
KEY_APOSTROPHE		:= 39	; Key: '
KEY_COMMA		:= 44	; Key: ,
KEY_MINUS		:= 45	; Key: -
KEY_PERIOD		:= 46	; Key: .
KEY_SLASH		:= 47	; Key: /
KEY_ZERO		:= 48	; Key: 0
KEY_ONE			:= 49	; Key: 1
KEY_TWO			:= 50	; Key: 2
KEY_THREE		:= 51	; Key: 3
KEY_FOUR		:= 52	; Key: 4
KEY_FIVE		:= 53	; Key: 5
KEY_SIX			:= 54	; Key: 6
KEY_SEVEN		:= 55	; Key: 7
KEY_EIGHT		:= 56	; Key: 8
KEY_NINE		:= 57	; Key: 9
KEY_SEMICOLON		:= 59	; Key: ;
KEY_EQUAL		:= 61	; Key: =
KEY_A			:= 65	; Key: A | a
KEY_B			:= 66	; Key: B | b
KEY_C			:= 67	; Key: C | c
KEY_D			:= 68	; Key: D | d
KEY_E			:= 69	; Key: E | e
KEY_F			:= 70	; Key: F | f
KEY_G			:= 71	; Key: G | g
KEY_H			:= 72	; Key: H | h
KEY_I			:= 73	; Key: I | i
KEY_J			:= 74	; Key: J | j
KEY_K			:= 75	; Key: K | k
KEY_L			:= 76	; Key: L | l
KEY_M			:= 77	; Key: M | m
KEY_N			:= 78	; Key: N | n
KEY_O			:= 79	; Key: O | o
KEY_P			:= 80	; Key: P | p
KEY_Q			:= 81	; Key: Q | q
KEY_R			:= 82	; Key: R | r
KEY_S			:= 83	; Key: S | s
KEY_T			:= 84	; Key: T | t
KEY_U			:= 85	; Key: U | u
KEY_V			:= 86	; Key: V | v
KEY_W			:= 87	; Key: W | w
KEY_X			:= 88	; Key: X | x
KEY_Y			:= 89	; Key: Y | y
KEY_Z			:= 90	; Key: Z | z
KEY_LEFT_BRACKET	:= 91	; Key: [
KEY_BACKSLASH		:= 92	; Key: '\'
KEY_RIGHT_BRACKET	:= 93	; Key: ]
KEY_GRAVE		:= 96	; Key: `
; Function keys
KEY_SPACE		:= 32	; Key: Space
KEY_ESCAPE		:= 256	; Key: Esc
KEY_ENTER		:= 257	; Key: Enter
KEY_TAB			:= 258	; Key: Tab
KEY_BACKSPACE		:= 259	; Key: Backspace
KEY_INSERT		:= 260	; Key: Ins
KEY_DELETE		:= 261	; Key: Del
KEY_RIGHT		:= 262	; Key: Cursor right
KEY_LEFT		:= 263	; Key: Cursor left
KEY_DOWN		:= 264	; Key: Cursor down
KEY_UP			:= 265	; Key: Cursor up
KEY_PAGE_UP		:= 266	; Key: Page up
KEY_PAGE_DOWN		:= 267	; Key: Page down
KEY_HOME		:= 268	; Key: Home
KEY_END			:= 269	; Key: End
KEY_CAPS_LOCK		:= 280	; Key: Caps lock
KEY_SCROLL_LOCK		:= 281	; Key: Scroll down
KEY_NUM_LOCK		:= 282	; Key: Num lock
KEY_PRINT_SCREEN	:= 283	; Key: Print screen
KEY_PAUSE		:= 284	; Key: Pause
KEY_F1			:= 290	; Key: F1
KEY_F2			:= 291	; Key: F2
KEY_F3			:= 292	; Key: F3
KEY_F4			:= 293	; Key: F4
KEY_F5			:= 294	; Key: F5
KEY_F6			:= 295	; Key: F6
KEY_F7			:= 296	; Key: F7
KEY_F8			:= 297	; Key: F8
KEY_F9			:= 298	; Key: F9
KEY_F10			:= 299	; Key: F10
KEY_F11			:= 300	; Key: F11
KEY_F12			:= 301	; Key: F12
KEY_LEFT_SHIFT		:= 340	; Key: Shift left
KEY_LEFT_CONTROL	:= 341	; Key: Control left
KEY_LEFT_ALT		:= 342	; Key: Alt left
KEY_LEFT_SUPER		:= 343	; Key: Super left
KEY_RIGHT_SHIFT		:= 344	; Key: Shift right
KEY_RIGHT_CONTROL	:= 345	; Key: Control right
KEY_RIGHT_ALT		:= 346	; Key: Alt right
KEY_RIGHT_SUPER		:= 347	; Key: Super right
KEY_KB_MENU		:= 348	; Key: KB menu
; Keypad keys
KEY_KP_0		:= 320	; Key: Keypad 0
KEY_KP_1		:= 321	; Key: Keypad 1
KEY_KP_2		:= 322	; Key: Keypad 2
KEY_KP_3		:= 323	; Key: Keypad 3
KEY_KP_4		:= 324	; Key: Keypad 4
KEY_KP_5		:= 325	; Key: Keypad 5
KEY_KP_6		:= 326	; Key: Keypad 6
KEY_KP_7		:= 327	; Key: Keypad 7
KEY_KP_8		:= 328	; Key: Keypad 8
KEY_KP_9		:= 329	; Key: Keypad 9
KEY_KP_DECIMAL		:= 330	; Key: Keypad .
KEY_KP_DIVIDE		:= 331	; Key: Keypad /
KEY_KP_MULTIPLY		:= 332	; Key: Keypad *
KEY_KP_SUBTRACT		:= 333	; Key: Keypad -
KEY_KP_ADD		:= 334	; Key: Keypad +
KEY_KP_ENTER		:= 335	; Key: Keypad Enter
KEY_KP_EQUAL		:= 336	; Key: Keypad =
; Android key buttons
KEY_BACK		:= 4	; Key: Android back button
KEY_MENU		:= 82	; Key: Android menu button
KEY_VOLUME_UP		:= 24	; Key: Android volume up button
KEY_VOLUME_DOWN		:= 25	; Key: Android volume down button

; MouseButton ; Mouse buttons
MOUSE_BUTTON_LEFT	:= 0 ; Mouse button left
MOUSE_BUTTON_RIGHT	:= 1 ; Mouse button right
MOUSE_BUTTON_MIDDLE	:= 2 ; Mouse button middle (pressed wheel)
MOUSE_BUTTON_SIDE	:= 3 ; Mouse button side (advanced mouse device)
MOUSE_BUTTON_EXTRA	:= 4 ; Mouse button extra (advanced mouse device)
MOUSE_BUTTON_FORWARD	:= 5 ; Mouse button fordward (advanced mouse device)
MOUSE_BUTTON_BACK	:= 6 ; Mouse button back (advanced mouse device)

; MouseCursor ; Mouse cursor
MOUSE_CURSOR_DEFAULT		:= 0	; Default pointer shape
MOUSE_CURSOR_ARROW		:= 1	; Arrow shape
MOUSE_CURSOR_IBEAM		:= 2	; Text writing cursor shape
MOUSE_CURSOR_CROSSHAIR		:= 3	; Cross shape
MOUSE_CURSOR_POINTING_HAND	:= 4	; Pointing hand cursor
MOUSE_CURSOR_RESIZE_EW		:= 5	; Horizontal resize/move arrow shape
MOUSE_CURSOR_RESIZE_NS		:= 6	; Vertical resize/move arrow shape
MOUSE_CURSOR_RESIZE_NWSE	:= 7	; Top-left to bottom-right diagonal resize/move arrow shape
MOUSE_CURSOR_RESIZE_NESW	:= 8	; The top-right to bottom-left diagonal resize/move arrow shape
MOUSE_CURSOR_RESIZE_ALL		:= 9	; The omni-directional resize/move cursor shape
MOUSE_CURSOR_NOT_ALLOWED	:= 10	; The operation-not-allowed shape

; GamepadButton ; Gamepad buttons
GAMEPAD_BUTTON_UNKNOWN		:= 0	; Unknown button, just for error checking
GAMEPAD_BUTTON_LEFT_FACE_UP	:= 1	; Gamepad left DPAD up button
GAMEPAD_BUTTON_LEFT_FACE_RIGHT	:= 2	; Gamepad left DPAD right button
GAMEPAD_BUTTON_LEFT_FACE_DOWN	:= 3	; Gamepad left DPAD down button
GAMEPAD_BUTTON_LEFT_FACE_LEFT	:= 4	; Gamepad left DPAD left button
GAMEPAD_BUTTON_RIGHT_FACE_UP	:= 5	; Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
GAMEPAD_BUTTON_RIGHT_FACE_RIGHT	:= 6	; Gamepad right button right (i.e. PS3: Square, Xbox: X)
GAMEPAD_BUTTON_RIGHT_FACE_DOWN	:= 7	; Gamepad right button down (i.e. PS3: Cross, Xbox: A)
GAMEPAD_BUTTON_RIGHT_FACE_LEFT	:= 8	; Gamepad right button left (i.e. PS3: Circle, Xbox: B)
GAMEPAD_BUTTON_LEFT_TRIGGER_1	:= 9	; Gamepad top/back trigger left (first), it could be a trailing button
GAMEPAD_BUTTON_LEFT_TRIGGER_2	:= 10	; Gamepad top/back trigger left (second), it could be a trailing button
GAMEPAD_BUTTON_RIGHT_TRIGGER_1	:= 11	; Gamepad top/back trigger right (one), it could be a trailing button
GAMEPAD_BUTTON_RIGHT_TRIGGER_2	:= 12	; Gamepad top/back trigger right (second), it could be a trailing button
GAMEPAD_BUTTON_MIDDLE_LEFT	:= 13	; Gamepad center buttons, left one (i.e. PS3: Select)
GAMEPAD_BUTTON_MIDDLE		:= 14	; Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
GAMEPAD_BUTTON_MIDDLE_RIGHT	:= 15	; Gamepad center buttons, right one (i.e. PS3: Start)
GAMEPAD_BUTTON_LEFT_THUMB	:= 16	; Gamepad joystick pressed button left
GAMEPAD_BUTTON_RIGHT_THUMB	:= 17	; Gamepad joystick pressed button right

; GamepadAxis ; Gamepad axis
GAMEPAD_AXIS_LEFT_X		= 0	; Gamepad left stick X axis
GAMEPAD_AXIS_LEFT_Y		= 1	; Gamepad left stick Y axis
GAMEPAD_AXIS_RIGHT_X		= 2	; Gamepad right stick X axis
GAMEPAD_AXIS_RIGHT_Y		= 3	; Gamepad right stick Y axis
GAMEPAD_AXIS_LEFT_TRIGGER	= 4	; Gamepad back trigger left, pressure level: [1..-1]
GAMEPAD_AXIS_RIGHT_TRIGGER	= 5	; Gamepad back trigger right, pressure level: [1..-1]

; MaterialMapIndex ; Material map index
MATERIAL_MAP_ALBEDO	:= 0	; Albedo material (same as: MATERIAL_MAP_DIFFUSE)
MATERIAL_MAP_METALNESS	:= 1	; Metalness material (same as: MATERIAL_MAP_SPECULAR)
MATERIAL_MAP_NORMAL	:= 2	; Normal material
MATERIAL_MAP_ROUGHNESS	:= 3	; Roughness material
MATERIAL_MAP_OCCLUSION	:= 4	; Ambient occlusion material
MATERIAL_MAP_EMISSION	:= 5	; Emission material
MATERIAL_MAP_HEIGHT	:= 6	; Heightmap material
MATERIAL_MAP_CUBEMAP	:= 7	; Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
MATERIAL_MAP_IRRADIANCE	:= 8	; Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
MATERIAL_MAP_PREFILTER	:= 9	; Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
MATERIAL_MAP_BRDF	:= 10	; Brdf material

MATERIAL_MAP_DIFFUSE	:= MATERIAL_MAP_ALBEDO
MATERIAL_MAP_SPECULAR	:= MATERIAL_MAP_METALNESS

; ShaderLocationIndex ; Shader location index
SHADER_LOC_VERTEX_POSITION	:= 0	; Shader location: vertex attribute: position
SHADER_LOC_VERTEX_TEXCOORD01	:= 1	; Shader location: vertex attribute: texcoord01
SHADER_LOC_VERTEX_TEXCOORD02	:= 2	; Shader location: vertex attribute: texcoord02
SHADER_LOC_VERTEX_NORMAL	:= 3	; Shader location: vertex attribute: normal
SHADER_LOC_VERTEX_TANGENT	:= 4	; Shader location: vertex attribute: tangent
SHADER_LOC_VERTEX_COLOR		:= 5	; Shader location: vertex attribute: color
SHADER_LOC_MATRIX_MVP		:= 6	; Shader location: matrix uniform: model-view-projection
SHADER_LOC_MATRIX_VIEW		:= 7	; Shader location: matrix uniform: view (camera transform)
SHADER_LOC_MATRIX_PROJECTION	:= 8	; Shader location: matrix uniform: projection
SHADER_LOC_MATRIX_MODEL		:= 9	; Shader location: matrix uniform: model (transform)
SHADER_LOC_MATRIX_NORMAL	:= 10	; Shader location: matrix uniform: normal
SHADER_LOC_VECTOR_VIEW		:= 11	; Shader location: vector uniform: view
SHADER_LOC_COLOR_DIFFUSE	:= 12	; Shader location: vector uniform: diffuse color
SHADER_LOC_COLOR_SPECULAR	:= 13	; Shader location: vector uniform: specular color
SHADER_LOC_COLOR_AMBIENT	:= 14	; Shader location: vector uniform: ambient color
SHADER_LOC_MAP_ALBEDO		:= 15	; Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
SHADER_LOC_MAP_METALNESS	:= 16	; Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
SHADER_LOC_MAP_NORMAL		:= 17	; Shader location: sampler2d texture: normal
SHADER_LOC_MAP_ROUGHNESS	:= 18	; Shader location: sampler2d texture: roughness
SHADER_LOC_MAP_OCCLUSION	:= 19	; Shader location: sampler2d texture: occlusion
SHADER_LOC_MAP_EMISSION		:= 20	; Shader location: sampler2d texture: emission
SHADER_LOC_MAP_HEIGHT		:= 21	; Shader location: sampler2d texture: height
SHADER_LOC_MAP_CUBEMAP		:= 22	; Shader location: samplerCube texture: cubemap
SHADER_LOC_MAP_IRRADIANCE	:= 23	; Shader location: samplerCube texture: irradiance
SHADER_LOC_MAP_PREFILTER	:= 24	; Shader location: samplerCube texture: prefilter
SHADER_LOC_MAP_BRDF		:= 25	; Shader location: sampler2d texture: brdf

SHADER_LOC_MAP_DIFFUSE	:= SHADER_LOC_MAP_ALBEDO
SHADER_LOC_MAP_SPECULAR	:= SHADER_LOC_MAP_METALNESS

; ShaderUniformDataType ; Shader uniform data type
SHADER_UNIFORM_FLOAT		:= 0	; Shader uniform type: float
SHADER_UNIFORM_VEC2		:= 1	; Shader uniform type: vec2 (2 float)
SHADER_UNIFORM_VEC3		:= 2	; Shader uniform type: vec3 (3 float)
SHADER_UNIFORM_VEC4		:= 3	; Shader uniform type: vec4 (4 float)
SHADER_UNIFORM_INT		:= 4	; Shader uniform type: int
SHADER_UNIFORM_IVEC2		:= 5	; Shader uniform type: ivec2 (2 int)
SHADER_UNIFORM_IVEC3		:= 6	; Shader uniform type: ivec3 (3 int)
SHADER_UNIFORM_IVEC4		:= 7	; Shader uniform type: ivec4 (4 int)
SHADER_UNIFORM_SAMPLER2D	:= 8	; Shader uniform type: sampler2d

; ShaderAttributeDataType ; Shader attribute data types
SHADER_ATTRIB_FLOAT	:= 0 ; Shader attribute type: float
SHADER_ATTRIB_VEC2	:= 1 ; Shader attribute type: vec2 (2 float)
SHADER_ATTRIB_VEC3	:= 2 ; Shader attribute type: vec3 (3 float)
SHADER_ATTRIB_VEC4	:= 3 ; Shader attribute type: vec4 (4 float)

; PixelFormat ; Pixel formats
; NOTE: Support depends on OpenGL version and platform
PIXELFORMAT_UNCOMPRESSED_GRAYSCALE	:= 1	; 8 bit per pixel (no alpha)
PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA	:= 2	; 8*2 bpp (2 channels)
PIXELFORMAT_UNCOMPRESSED_R5G6B5		:= 3	; 16 bpp
PIXELFORMAT_UNCOMPRESSED_R8G8B8		:= 4	; 24 bpp
PIXELFORMAT_UNCOMPRESSED_R5G5B5A1	:= 5	; 16 bpp (1 bit alpha)
PIXELFORMAT_UNCOMPRESSED_R4G4B4A4	:= 6	; 16 bpp (4 bit alpha)
PIXELFORMAT_UNCOMPRESSED_R8G8B8A8	:= 7	; 32 bpp
PIXELFORMAT_UNCOMPRESSED_R32		:= 8	; 32 bpp (1 channel - float)
PIXELFORMAT_UNCOMPRESSED_R32G32B32	:= 9	; 32*3 bpp (3 channels - float)
PIXELFORMAT_UNCOMPRESSED_R32G32B32A32	:= 10	; 32*4 bpp (4 channels - float)
PIXELFORMAT_COMPRESSED_DXT1_RGB		:= 11	; 4 bpp (no alpha)
PIXELFORMAT_COMPRESSED_DXT1_RGBA	:= 12	; 4 bpp (1 bit alpha)
PIXELFORMAT_COMPRESSED_DXT3_RGBA	:= 13	; 8 bpp
PIXELFORMAT_COMPRESSED_DXT5_RGBA	:= 14	; 8 bpp
PIXELFORMAT_COMPRESSED_ETC1_RGB		:= 15	; 4 bpp
PIXELFORMAT_COMPRESSED_ETC2_RGB		:= 16	; 4 bpp
PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA	:= 17	; 8 bpp
PIXELFORMAT_COMPRESSED_PVRT_RGB		:= 18	; 4 bpp
PIXELFORMAT_COMPRESSED_PVRT_RGBA	:= 19	; 4 bpp
PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA	:= 20	; 8 bpp
PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA	:= 21	; 2 bpp

; TextureFilter ; Texture parameters: filter mode
; NOTE 1: Filtering considers mipmaps if available in the texture
; NOTE 2: Filter is accordingly set for minification and magnification
TEXTURE_FILTER_POINT		:= 0 ; No filter, just pixel approximation
TEXTURE_FILTER_BILINEAR		:= 1 ; Linear filtering
TEXTURE_FILTER_TRILINEAR	:= 2 ; Trilinear filtering (linear with mipmaps)
TEXTURE_FILTER_ANISOTROPIC_4X	:= 3 ; Anisotropic filtering 4x
TEXTURE_FILTER_ANISOTROPIC_8X	:= 4 ; Anisotropic filtering 8x
TEXTURE_FILTER_ANISOTROPIC_16X	:= 5 ; Anisotropic filtering 16x

; TextureWrap ; Texture parameters: wrap mode
TEXTURE_WRAP_REPEAT		:= 0 ; Repeats texture in tiled mode
TEXTURE_WRAP_CLAMP		:= 1 ; Clamps texture to edge pixel in tiled mode
TEXTURE_WRAP_MIRROR_REPEAT	:= 2 ; Mirrors and repeats the texture in tiled mode
TEXTURE_WRAP_MIRROR_CLAMP	:= 3 ; Mirrors and clamps to border the texture in tiled mode

; CubemapLayout ; Cubemap layouts
CUBEMAP_LAYOUT_AUTO_DETECT		:= 0 ; Automatically detect layout type
CUBEMAP_LAYOUT_LINE_VERTICAL		:= 1 ; A vertical line with faces
CUBEMAP_LAYOUT_LINE_HORIZONTAL		:= 2 ; An horizontal line with faces
CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR	:= 3 ; A 3x4 cross with cubemap faces
CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE	:= 4 ; A 4x3 cross with cubemap faces
CUBEMAP_LAYOUT_PANORAMA			:= 5 ; A panorama image (equirectangular map)

; FontType ; Font type, defines generation method
FONT_DEFAULT	:= 0 ; Default font generation, anti-aliased
FONT_BITMAP	:= 1 ; Bitmap font generation, no anti-aliasing
FONT_SDF	:= 2 ; SDF font generation, requires external shader

; BlendMode ; Color blending modes (pre-defined)
BLEND_ALPHA		:= 0 ; Blend textures considering alpha (default)
BLEND_ADDITIVE		:= 1 ; Blend textures adding colors
BLEND_MULTIPLIED	:= 2 ; Blend textures multiplying colors
BLEND_ADD_COLORS	:= 3 ; Blend textures adding colors (alternative)
BLEND_SUBTRACT_COLORS	:= 4 ; Blend textures subtracting colors (alternative)
BLEND_ALPHA_PREMULTIPLY	:= 5 ; Blend premultiplied textures considering alpha
BLEND_CUSTOM		:= 6 ; Blend textures using custom src/dst factors (use rlSetBlendMode())

; Gesture ; Gesture
; NOTE: It could be used as flags to enable only some gestures
GESTURE_NONE		:= 0	; No gesture
GESTURE_TAP		:= 1	; Tap gesture
GESTURE_DOUBLETAP	:= 2	; Double tap gesture
GESTURE_HOLD		:= 4	; Hold gesture
GESTURE_DRAG		:= 8	; Drag gesture
GESTURE_SWIPE_RIGHT	:= 16	; Swipe right gesture
GESTURE_SWIPE_LEFT	:= 32	; Swipe left gesture
GESTURE_SWIPE_UP	:= 64	; Swipe up gesture
GESTURE_SWIPE_DOWN	:= 128	; Swipe down gesture
GESTURE_PINCH_IN	:= 256	; Pinch in gesture
GESTURE_PINCH_OUT	:= 512	; Pinch out gesture

; CameraMode ; Camera system modes
CAMERA_CUSTOM		:= 0 ; Custom camera
CAMERA_FREE		:= 1 ; Free camera
CAMERA_ORBITAL		:= 2 ; Orbital camera
CAMERA_FIRST_PERSON	:= 3 ; First person camera
CAMERA_THIRD_PERSON	:= 4 ; Third person camera

; CameraProjection ; Camera projection
CAMERA_PERSPECTIVE	:= 0 ; Perspective projection
CAMERA_ORTHOGRAPHIC	:= 1 ; Orthographic projection

; NPatchLayout ; N-patch layout
NPATCH_NINE_PATCH		:= 0 ; Npatch layout: 3x3 tiles
NPATCH_THREE_PATCH_VERTICAL	:= 1 ; Npatch layout: 1x3 tiles
NPATCH_THREE_PATCH_HORIZONTAL	:= 2 ; Npatch layout: 3x1 tiles


















