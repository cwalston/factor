! Copyright (C) 2005, 2006 Doug Coleman.
! See http://factorcode.org/license.txt for BSD license.
USING: alien alien.c-types alien.syntax parser namespaces kernel
math math.bitwise windows.types init assocs splitting
sequences libc opengl.gl opengl.gl.extensions opengl.gl.windows ;
IN: windows.opengl32

CONSTANT: LPD_TYPE_RGBA        0
CONSTANT: LPD_TYPE_COLORINDEX  1

! wglSwapLayerBuffers flags
CONSTANT: WGL_SWAP_MAIN_PLANE     HEX: 00000001
CONSTANT: WGL_SWAP_OVERLAY1       HEX: 00000002
CONSTANT: WGL_SWAP_OVERLAY2       HEX: 00000004
CONSTANT: WGL_SWAP_OVERLAY3       HEX: 00000008
CONSTANT: WGL_SWAP_OVERLAY4       HEX: 00000010
CONSTANT: WGL_SWAP_OVERLAY5       HEX: 00000020
CONSTANT: WGL_SWAP_OVERLAY6       HEX: 00000040
CONSTANT: WGL_SWAP_OVERLAY7       HEX: 00000080
CONSTANT: WGL_SWAP_OVERLAY8       HEX: 00000100
CONSTANT: WGL_SWAP_OVERLAY9       HEX: 00000200
CONSTANT: WGL_SWAP_OVERLAY10      HEX: 00000400
CONSTANT: WGL_SWAP_OVERLAY11      HEX: 00000800
CONSTANT: WGL_SWAP_OVERLAY12      HEX: 00001000
CONSTANT: WGL_SWAP_OVERLAY13      HEX: 00002000
CONSTANT: WGL_SWAP_OVERLAY14      HEX: 00004000
CONSTANT: WGL_SWAP_OVERLAY15      HEX: 00008000
CONSTANT: WGL_SWAP_UNDERLAY1      HEX: 00010000
CONSTANT: WGL_SWAP_UNDERLAY2      HEX: 00020000
CONSTANT: WGL_SWAP_UNDERLAY3      HEX: 00040000
CONSTANT: WGL_SWAP_UNDERLAY4      HEX: 00080000
CONSTANT: WGL_SWAP_UNDERLAY5      HEX: 00100000
CONSTANT: WGL_SWAP_UNDERLAY6      HEX: 00200000
CONSTANT: WGL_SWAP_UNDERLAY7      HEX: 00400000
CONSTANT: WGL_SWAP_UNDERLAY8      HEX: 00800000
CONSTANT: WGL_SWAP_UNDERLAY9      HEX: 01000000
CONSTANT: WGL_SWAP_UNDERLAY10     HEX: 02000000
CONSTANT: WGL_SWAP_UNDERLAY11     HEX: 04000000
CONSTANT: WGL_SWAP_UNDERLAY12     HEX: 08000000
CONSTANT: WGL_SWAP_UNDERLAY13     HEX: 10000000
CONSTANT: WGL_SWAP_UNDERLAY14     HEX: 20000000
CONSTANT: WGL_SWAP_UNDERLAY15     HEX: 40000000


LIBRARY: gl


! FUNCTION: int ReleaseDC ( HWND hWnd, HDC hDC ) ;
! FUNCTION: HDC ResetDC ( HDC hdc, DEVMODE* lpInitData ) ;
! FUNCTION: BOOL RestoreDC ( HDC hdc, int nSavedDC ) ;
! FUNCTION: int SaveDC( HDC hDC ) ;
! FUNCTION: HGDIOBJ SelectObject ( HDC hDC, HGDIOBJ hgdiobj ) ;

FUNCTION: HGLRC wglCreateContext ( HDC hDC ) ;
FUNCTION: BOOL wglDeleteContext ( HGLRC hRC ) ;
FUNCTION: BOOL wglMakeCurrent ( HDC hDC, HGLRC hglrc ) ;

! WGL_ARB_extensions_string extension

GL-FUNCTION: c-string wglGetExtensionsStringARB { } ( HDC hDC ) ;

! WGL_ARB_pixel_format extension

CONSTANT: WGL_NUMBER_PIXEL_FORMATS_ARB    HEX: 2000
CONSTANT: WGL_DRAW_TO_WINDOW_ARB          HEX: 2001
CONSTANT: WGL_DRAW_TO_BITMAP_ARB          HEX: 2002
CONSTANT: WGL_ACCELERATION_ARB            HEX: 2003
CONSTANT: WGL_NEED_PALETTE_ARB            HEX: 2004
CONSTANT: WGL_NEED_SYSTEM_PALETTE_ARB     HEX: 2005
CONSTANT: WGL_SWAP_LAYER_BUFFERS_ARB      HEX: 2006
CONSTANT: WGL_SWAP_METHOD_ARB             HEX: 2007
CONSTANT: WGL_NUMBER_OVERLAYS_ARB         HEX: 2008
CONSTANT: WGL_NUMBER_UNDERLAYS_ARB        HEX: 2009
CONSTANT: WGL_TRANSPARENT_ARB             HEX: 200A
CONSTANT: WGL_TRANSPARENT_RED_VALUE_ARB   HEX: 2037
CONSTANT: WGL_TRANSPARENT_GREEN_VALUE_ARB HEX: 2038
CONSTANT: WGL_TRANSPARENT_BLUE_VALUE_ARB  HEX: 2039
CONSTANT: WGL_TRANSPARENT_ALPHA_VALUE_ARB HEX: 203A
CONSTANT: WGL_TRANSPARENT_INDEX_VALUE_ARB HEX: 203B
CONSTANT: WGL_SHARE_DEPTH_ARB             HEX: 200C
CONSTANT: WGL_SHARE_STENCIL_ARB           HEX: 200D
CONSTANT: WGL_SHARE_ACCUM_ARB             HEX: 200E
CONSTANT: WGL_SUPPORT_GDI_ARB             HEX: 200F
CONSTANT: WGL_SUPPORT_OPENGL_ARB          HEX: 2010
CONSTANT: WGL_DOUBLE_BUFFER_ARB           HEX: 2011
CONSTANT: WGL_STEREO_ARB                  HEX: 2012
CONSTANT: WGL_PIXEL_TYPE_ARB              HEX: 2013
CONSTANT: WGL_COLOR_BITS_ARB              HEX: 2014
CONSTANT: WGL_RED_BITS_ARB                HEX: 2015
CONSTANT: WGL_RED_SHIFT_ARB               HEX: 2016
CONSTANT: WGL_GREEN_BITS_ARB              HEX: 2017
CONSTANT: WGL_GREEN_SHIFT_ARB             HEX: 2018
CONSTANT: WGL_BLUE_BITS_ARB               HEX: 2019
CONSTANT: WGL_BLUE_SHIFT_ARB              HEX: 201A
CONSTANT: WGL_ALPHA_BITS_ARB              HEX: 201B
CONSTANT: WGL_ALPHA_SHIFT_ARB             HEX: 201C
CONSTANT: WGL_ACCUM_BITS_ARB              HEX: 201D
CONSTANT: WGL_ACCUM_RED_BITS_ARB          HEX: 201E
CONSTANT: WGL_ACCUM_GREEN_BITS_ARB        HEX: 201F
CONSTANT: WGL_ACCUM_BLUE_BITS_ARB         HEX: 2020
CONSTANT: WGL_ACCUM_ALPHA_BITS_ARB        HEX: 2021
CONSTANT: WGL_DEPTH_BITS_ARB              HEX: 2022
CONSTANT: WGL_STENCIL_BITS_ARB            HEX: 2023
CONSTANT: WGL_AUX_BUFFERS_ARB             HEX: 2024

CONSTANT: WGL_NO_ACCELERATION_ARB         HEX: 2025
CONSTANT: WGL_GENERIC_ACCELERATION_ARB    HEX: 2026
CONSTANT: WGL_FULL_ACCELERATION_ARB       HEX: 2027

CONSTANT: WGL_SWAP_EXCHANGE_ARB           HEX: 2028
CONSTANT: WGL_SWAP_COPY_ARB               HEX: 2029
CONSTANT: WGL_SWAP_UNDEFINED_ARB          HEX: 202A

CONSTANT: WGL_TYPE_RGBA_ARB               HEX: 202B
CONSTANT: WGL_TYPE_COLORINDEX_ARB         HEX: 202C

GL-FUNCTION: BOOL wglGetPixelFormatAttribivARB { } (
        HDC hdc,
        int iPixelFormat,
        int iLayerPlane,
        UINT nAttributes,
        int* piAttributes,
        int* piValues
    ) ;

GL-FUNCTION: BOOL wglGetPixelFormatAttribfvARB { } (
        HDC hdc,
        int iPixelFormat,
        int iLayerPlane,
        UINT nAttributes,
        int* piAttributes,
        FLOAT* pfValues
    ) ;

GL-FUNCTION: BOOL wglChoosePixelFormatARB { } (
        HDC hdc,
        int* piAttribIList,
        FLOAT* pfAttribFList,
        UINT nMaxFormats,
        int* piFormats,
        UINT* nNumFormats
    ) ;

! WGL_ARB_multisample extension

CONSTANT: WGL_SAMPLE_BUFFERS_ARB HEX: 2041
CONSTANT: WGL_SAMPLES_ARB        HEX: 2042

! WGL_ARB_pixel_format_float extension

CONSTANT: WGL_TYPE_RGBA_FLOAT_ARB HEX: 21A0

! wgl extensions querying

: has-wglGetExtensionsStringARB? ( -- ? )
    "wglGetExtensionsStringARB" wglGetProcAddress >boolean ;

: wgl-extensions ( hdc -- extensions )
    has-wglGetExtensionsStringARB? [ wglGetExtensionsStringARB " " split ] [ drop { } ] if ;

: has-wgl-extensions? ( hdc extensions -- ? )
    swap wgl-extensions [ member? ] curry all? ;

: has-wgl-pixel-format-extension? ( hdc -- ? )
    { "WGL_ARB_pixel_format" } has-wgl-extensions? ;
