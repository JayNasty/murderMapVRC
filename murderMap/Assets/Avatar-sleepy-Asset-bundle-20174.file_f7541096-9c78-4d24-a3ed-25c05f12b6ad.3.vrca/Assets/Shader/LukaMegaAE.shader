Shader "Luka/MegaAE" {
	Properties {
		[Space(15)] [Space(10)] [Header(Uh oh)] [Header(Luka Shader Editor not detected)] [Header(Please reinstall the shader to use)] [Header(The shader WILL NOT WORK without it)] [Header(Please install the WHOLE unity project)] [Header(Make sure the ShaderEditor is in Editor folder)] [Header(Make sue the cginc is in the cginc folder)] [Header(Contact me at discord for further support)] [Header(luka 8375)] [Space(250)] [Space(250)] [Space(250)] [Space(250)] [Space(250)] [Space(250)] [Space(250)] [Space(10)] [Header(Lukas Mega Shader)] _VersionNumber ("Version", Float) = 9
		_Love ("<3", Float) = 100
		[Header(Render Options)] _FalloffRange ("Range", Float) = 10
		[MaterialToggle] _ToggleRenderLookAtMe ("Only Render If Looking", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 8
		[Header(Falloff)] [MaterialToggle] _AllowSmartFalloff ("Allow Falloff", Float) = 0
		_SmartFalloffMin ("Start Falloff Range", Float) = 5
		_SmartFalloffMax ("End Falloff Range", Float) = 9.5
		[MaterialToggle] _AllowFadingFalloff ("Use Fading Falloff (Suggested)", Float) = 1
		[MaterialToggle] _AllowScalarFalloff ("Use Scaling Falloff (Suggested) ", Float) = 1
		[Header(Screenspace Options)] [MaterialToggle] _ToggleScreenFlip ("Allow Screen Flip", Float) = 0
		[MaterialToggle] _ToggleUpsideDown ("Allow Upside Down", Float) = 0
		[Header(Black and White)] [MaterialToggle] _ToggleSepia ("Allow Black and White", Float) = 0
		_SepiaStrength ("Black and White Strength", Range(0, 1)) = 1
		[Header(Invert)] [MaterialToggle] _ToggleInvert ("Allow Invert Colors", Float) = 0
		_InvertStrength ("Invert Strength", Range(0, 1)) = 1
		[Header(Afterimage)] [MaterialToggle] _ToggleAfterimage ("Allow Afterimage", Float) = 0
		_Offset ("First Offset", Range(-0.5, 0.5)) = 0.023
		_ExtraOffset ("Second Offset", Range(-0.5, 0.5)) = 0.041
		_offsetthree ("Third Offset", Range(-0.5, 0.5)) = 0.063
		[Header(Blur)] [MaterialToggle] _ToggleBlur ("Allow Blur", Float) = 0
		[MaterialToggle] _ToggleSimpleBlur ("Smoothen Blur", Float) = 1
		_BlurNondistanceOffset ("Smooth Factor", Float) = 2
		_BlurOffset ("Blur Offset", Range(0, 0.011)) = 0
		[MaterialToggle] _ToggleAutoanimateBlur ("Animate Blur", Float) = 0
		_BlurAutoanimateSpeed ("Blur Speed", Range(0, 10)) = 0
		[Header(Bloom)] [MaterialToggle] _ToggleBloom ("Allow Bloom", Float) = 0
		_BloomGlow ("Bloom Glow", Range(0.1, 10)) = 0
		_BloomColorRGB ("Bloom Color", Vector) = (1,1,1,1)
		[Header(Bulge)] [MaterialToggle] _ToggleBulge ("Allow Bulge", Float) = 0
		_OwOStrength ("Bulge Strength", Range(1, 20)) = 5
		[Header(Centered Zoom)] [MaterialToggle] _ToggleZoom ("Allow Zoom", Float) = 0
		[MaterialToggle] _ToggleFlipZoom ("Flip Zoom", Float) = 0
		[MaterialToggle] _ToggleSmoothZoom ("Smooth Zoom", Float) = 0
		_ZoomInValue ("Zoom In", Range(1, 10)) = 1
		_ZoomOutValue ("Zoom Out", Range(0, 10)) = 0
		[MaterialToggle] _ToggleSmoothAdvanced ("Customize Smooth Zoom", Float) = 0
		_SmoothZoomClampMinONE ("Smooth Maximum", Range(1, 0)) = 0.2
		_SmoothZoomClampMaxONE ("Smooth Minimum", Range(0, 1)) = 5
		_SmoothZoomDistanceMod ("Distance Modifier", Float) = 2
		[Header(Circular Shake)] [MaterialToggle] _ToggleCircularShake ("Allow Circular Shake", Float) = 0
		_CircShakeSpeed ("Circular Shake Speed", Range(0, 5)) = 0
		_CircShakeStr ("Circular Shake Strength", Range(500, 0)) = 500
		[Header(Colors)] [MaterialToggle] _ToggleColorTint ("Allow Color", Float) = 0
		_ColorHue ("Hue", Range(0, 1)) = 0
		_ColorSaturation ("Saturation", Range(0, 1)) = 0
		_ColorValue ("Value", Range(0, 1)) = 0
		[MaterialToggle] _ToggleRGBTint ("Use RGB (HDR) Color", Float) = 0
		[HDR] _ColorRGB ("RGB Color Droplet", Vector) = (1,1,1,1)
		[Header(Color Split)] [MaterialToggle] _ToggleColorSplit ("Allow Color Split", Float) = 0
		_ColorSplitAmount ("Color Split", Range(-0.5, 0.5)) = 0
		_ColorSplitRGBone ("Left Color", Vector) = (1,1,1,1)
		_ColSpONEopacity ("Left Brightness", Range(0, 50)) = 1
		_ColorSplitRGBtwo ("Middle Color", Vector) = (1,1,1,1)
		_ColSpTWOopacity ("Middle Brightness", Range(0, 50)) = 1
		_ColorSplitRGBthree ("Right Color", Vector) = (1,1,1,1)
		_ColSpTHREEopacity ("Right Brightness", Range(0, 50)) = 1
		[MaterialToggle] _ToggleColorSplitStaySides ("Colors Dont Cross", Float) = 1
		[MaterialToggle] _ToggleAutoanimateColorSplit ("Animate Color Split", Float) = 0
		_ColorSplitSpeed ("Color Split Speed", Range(1, 5)) = 0
		_CSLX ("Left Horizontal Offset", Range(-0.5, 0.5)) = 0
		_CSLY ("Left Vertical Offset", Range(-0.5, 0.5)) = 0
		_CSMX ("Middle Horizontal Offset", Range(-0.5, 0.5)) = 0
		_CSMY ("Middle Vertical Offset", Range(-0.5, 0.5)) = 0
		_CSRX ("Right Horizontal Offset", Range(-0.5, 0.5)) = 0
		_CSRY ("Right Vertical Offset", Range(-0.5, 0.5)) = 0
		[Header(Darken)] [MaterialToggle] _ToggleDarken ("Allow Darken", Float) = 0
		_DarknessStrength ("Darkness", Range(0, 1)) = 0
		[Header(Divide)] [MaterialToggle] _ToggleDivide ("Allow Divide", Float) = 0
		_DivideR ("Right Divide", Range(-4, 4)) = 0
		_DivideL ("Left Divide", Range(-2, 2)) = 0
		[Header(Distort)] [MaterialToggle] _ToggleDistort ("Allow Distortion", Float) = 0
		_RedMap ("Distortion Map", 2D) = "RedMap" {}
		[MaterialToggle] _ToggleDistortAnimate ("Animate Distortion", Float) = 0
		[MaterialToggle] _ToggleDistortAdvControl ("Use Advanced Controls without Animate", Float) = 0
		_DistortAmount ("Amount", Range(-500, 500)) = 0
		_DistortOffset ("Offset", Range(-0.3, 0.3)) = 0
		_DistortRedSpeed ("Speed", Range(-10, 10)) = 0
		_DistortYAnim ("Y Animation", Range(-10, 10)) = 0
		_DistortXAnim ("X Animation", Range(-10, 10)) = 0
		_DistortTileAnim ("Tile Animation", Range(-10, 10)) = 0
		[Header(Dizzy)] [MaterialToggle] _ToggleDizzyEffect ("Allow Dizzy", Float) = 0
		[Enum(Dizzy,1,Move,2,Slide,3,Blink,4,Diagonal,5,Custom,6)] _DizzyMode ("Dizzy Mode", Float) = 1
		_DizzyScuffedWarning ("Dizzy in the mega shader is a bit scuffed", Float) = 0
		_DizzyAmountValue ("Dizzy Speed", Range(0, 100)) = 25
		_DizzyRotationSpeed ("Dizzy Strength", Float) = 20
		_DizzyDirection ("Dizzy Direction", Float) = -1
		[Header(Color Droplet)] [MaterialToggle] _ToggleDroplet ("Allow Droplet", Float) = 0
		[MaterialToggle] _ToggleUseHSVInstead ("Use HSV Instead (If off uses RGB) (Falloff only on HSV)", Float) = 1
		[MaterialToggle] _ToggleDropletSepia ("Allow Black and White Background", Float) = 0
		[Space(0)] [Header(Color One)] _DropletColOne ("Old Color", Vector) = (0,0,0,0)
		_DropletColTwo ("New Color", Vector) = (0,0,0,0)
		_DropletTolerance ("Tolerance", Range(0, 0.5)) = 0.01
		_DropletIntensity ("Intensity", Range(0, 1)) = 1
		[Space(0)] [Header(Color Two)] [MaterialToggle] _ToggleDropletTwo ("Allow Second Color", Float) = 0
		_TwoDropletColOne ("Old Color", Vector) = (0,0,0,0)
		_TwoDropletColTwo ("New Color", Vector) = (0,0,0,0)
		_TwoDropletTolerance ("Tolerance", Range(0, 0.05)) = 0.01
		_TwoDropletIntensity ("Intensity", Range(0, 1)) = 1
		[Space(0)] [Header(Color Three)] [MaterialToggle] _ToggleDropletThree ("Allow Third Color", Float) = 0
		_ThreeDropletColOne ("Old Color", Vector) = (0,0,0,0)
		_ThreeDropletColTwo ("New Color", Vector) = (0,0,0,0)
		_ThreeDropletTolerance ("Tolerance", Range(0, 0.05)) = 0.01
		_ThreeDropletIntensity ("Intensity", Range(0, 1)) = 1
		[Space(0)] [Header(Color Four)] [MaterialToggle] _ToggleDropletFourth ("Allow Fourth Color", Float) = 0
		_FourDropletColOne ("Old Color", Vector) = (0,0,0,0)
		_FourDropletColTwo ("New Color", Vector) = (0,0,0,0)
		_FourDropletTolerance ("Tolerance", Range(0, 0.05)) = 0.01
		_FourDropletIntensity ("Intensity", Range(0, 1)) = 1
		[Header(Duotone)] [MaterialToggle] _ToggleDuotone ("Allow Duotone", Float) = 0
		[MaterialToggle] _DuotoneHardEdges ("Use Hard Edges Only?", Float) = 0
		_DuotoneHardness ("Hardness", Range(1, 0.01)) = 0.01
		_DuotoneThreshold ("Threshold", Range(0, 1)) = 0.25
		_DuotoneColOne ("Old Color", Vector) = (0,0,0,1)
		_DuotoneColTwo ("New Color", Vector) = (1,1,1,1)
		[Header(Earthquake)] [MaterialToggle] _ToggleSplitShake ("Allow Earthquake", Float) = 0
		[MaterialToggle] _SSAllowVerticalShake ("Vertical Shake", Float) = 0
		[MaterialToggle] _SSAllowHorizontalShake ("Horizontal Shake", Float) = 0
		[MaterialToggle] _SSAllowVerticalBlur ("Vertical Motion Blur", Float) = 0
		[MaterialToggle] _SSAllowHorizontalBlur ("Horizontal Motion Blur", Float) = 0
		_SSValue ("Horizontal Shakiness", Range(0, 0.08)) = 0.0226
		_SSSpeed ("Horizontal Speed", Range(0, 15)) = 6.24
		_SSValueVert ("Vertical Shakiness", Range(0, 0.08)) = 0.0272
		_SSSpeedVert ("Vertical Speed", Range(0, 15)) = 3.14
		_SSTransparency ("Blur Transparency", Range(0, 1)) = 1
		[Header(Edge Detect)] [MaterialToggle] _ToggleED ("Allow Outline", Float) = 0
		_EDColor ("Outline Color", Vector) = (1,1,1,1)
		_EDIntensity ("Outline Intensity", Range(0, 1)) = 1
		_EDTolerance ("Outline Tolerance", Range(0, 5)) = 0.2
		_EDGlow ("Outline Glow", Range(1, 8)) = 1
		_EDTrans ("Outline Transparency", Range(0, 1)) = 1
		_EDXOffset ("Horizontal Offset", Range(-100, 100)) = 0
		_EDYOffset ("Vertical Offset", Range(-100, 100)) = 0
		[Header(Edge Distort)] [MaterialToggle] _ToggleEdgeDistort ("Allow Edge Distort", Float) = 0
		_EdgeDisX ("Horizontal Distort", Range(-2, 2)) = 0.1
		_EdgeDisY ("Vertical Distort", Range(-2, 2)) = 0.1
		[MaterialToggle] _ToggleEdgeDisRotate ("Allow Rotation", Float) = 1
		_EdgeDisRotStr ("Rotation Strength", Range(10, 0.1)) = 4.18
		_EdgeDisRotSpeed ("Rotation Speed", Range(-10, 10)) = 0.93
		[Header(Edgy World)] [MaterialToggle] _ToggleEdgy ("Allow Edgy World", Float) = 0
		_EdgyOffset ("Edgy Offset", Range(-0.35, 0.35)) = 0.005
		_EdgyOffsetTwo ("Edgy Two Offset", Range(-0.35, 0.35)) = -0.005
		_EdgyMulti ("Edgy Value", Float) = 0
		[Header(Fade Projection)] [MaterialToggle] _ToggleFadeProjection ("Allow Fade Projection", Float) = 0
		_FPZoom ("Zoom Amount", Range(1, 3.5)) = 1
		_FPFade ("Fade Amount", Range(0, 0.8)) = 0.4
		[Header(Filter)] [MaterialToggle] _ToggleFilter ("Allow Filter", Float) = 0
		[MaterialToggle] _ToggleHSVFilterDisableLock ("Use HSV (Disabled, Broken)", Float) = 0
		[MaterialToggle] _ToggleAdvancedFilter ("Use Advanced Options", Float) = 0
		[MaterialToggle] _ToggleColoredFilter ("Allow Colored Background", Float) = 0
		_FilterColor ("Filtered Colored", Vector) = (0,0,0,0)
		_FilterTolerance ("Filter Tolerance", Range(0, 1)) = 0.1
		_FilterMinR ("[Advanced] Filter Red Min", Range(0, 1)) = 0.1
		_FilterMaxR ("[Advanced] Filter Red Max", Range(0, 1)) = 0.1
		_FilterMinG ("[Advanced] Filter Green Min", Range(0, 1)) = 0.1
		_FilterMaxG ("[Advanced] Filter Green Max", Range(0, 1)) = 0.1
		_FilterMinB ("[Advanced] Filter Blue Min", Range(0, 1)) = 0.1
		_FilterMaxB ("[Advanced] Filter Blue Max", Range(0, 1)) = 0.1
		_FilterIntensity ("Color Strength", Range(0, 1)) = 1
		_BackgroundFilterIntensity ("Background Color Strength", Range(0, 1)) = 0.5
		_BackgroundFilterColor ("Background Color", Vector) = (0,0,0,0)
		[Header(Fisheye)] [MaterialToggle] _ToggleFisheye ("Allow Fisheye", Float) = 0
		_FisheyeSize ("Lens Size", Range(0.1, 10)) = 0.8
		[Header(Gaussian Blur (Unfocus))] [MaterialToggle] _ToggleUnfocusBlur ("Allow Unfocus", Float) = 0
		_UnfocusBlurOffset ("Unfocus Strength", Range(0, 0.0015)) = 0
		[Header(Gamma Correction)] [MaterialToggle] _ToggleGammaCorrect ("Allow Gamma Correction", Float) = 0
		_GammaRed ("Red Gamma", Range(-1, 1)) = 0
		_GammaGreen ("Green Gamma", Range(-1, 1)) = 0
		_GammaBlue ("Gamma Blue", Range(-1, 1)) = 0
		[Header(CRT Glitch)] [MaterialToggle] _ToggleGlitch ("Allow CRT Glitch", Float) = 0
		_GlitchRedMap ("Glitch Map", 2D) = "white" {}
		_GlitchRedDistort ("Glitch Strength", Range(-0.05, 0.05)) = 0
		_RedYGlitch ("Y Glitch", Range(3, 15)) = 10
		_RedXGlitch ("X Glitch", Range(0.05, 0.8)) = 0.35
		_RedTileGlitch ("Tile Glitch", Range(0, 10)) = 1
		[MaterialToggle] _ToggleRandomGlitch ("Animate Glitch [Beta, Mostly Testing]", Float) = 0
		[MaterialToggle] _ToggleRandomSideGlitch ("Randomize Direction", Float) = 0
		_XGAnimate ("X Animate", Range(-0.8, 0.8)) = 0.35
		_YGAnimate ("Y Animate", Range(4, 15)) = 0
		_TileGAnimate ("Tile Animate", Range(0, 10)) = 0
		_GlitchSideFactor ("Direction Randomize", Range(0, 5)) = 0
		[Header(Glitch RGB)] [MaterialToggle] _ToggleGlitchChromatic ("Allow Glitch RGB", Float) = 0
		_GlitchRGBStrength ("Glitch RGB Strength", Range(0, 0.25)) = 0
		_GlitchRGBSpeed ("Glitch RGB Speed", Range(0, 2)) = 0
		_GlitchRGB ("Glitch RGB Randomness", Range(0, 1)) = 0
		[Header(Block Glitch)] [MaterialToggle] _ToggleBlockyGlitch ("Allow Blocky Glitch", Float) = 0
		_BlockGlitchMap ("Block Glitch Map", 2D) = "white" {}
		[MaterialToggle] _AllowBGX ("Allow Horizontal Glitch", Float) = 1
		[MaterialToggle] _AllowBGY ("Allow Vertical Glitch", Float) = 0
		_BlockyGlitchStrength ("Strength", Range(0, 5)) = 0.5
		_BlockyGlitchSpeed ("Speed", Range(0, 5)) = 1.2
		_BDepthX ("Horizontal Depth", Range(0, 1000)) = 25
		_BDepthY ("Vertical Depth", Range(75, 1750)) = 111
		[MaterialToggle] _AllowRandomnessIncrease ("Allow More Randomness", Float) = 0
		_BGRandomnessInc ("Randomness Amount", Range(0, 5)) = 0
		[MaterialToggle] _ToggleBlockyRGB ("Allow Blocky RGB", Float) = 1
		_BlockyRGBPush ("RGB Strength", Range(0, 10)) = 0.3
		_BlockyRGBSpeed ("RGB Speed", Range(0, 10)) = 3.7
		[MaterialToggle] _AllowBGColors ("Allow Broken Colors", Float) = 1
		_BGOverlayColor ("Overlay Color", Vector) = (0.1,0.1,0.1,1)
		_BGOverlayIntensity ("Color Overlay Intensity", Range(0, 0.25)) = 0.01
		_BGBrokenColorIntensity ("Broken Color Intensity", Range(0, 0.5)) = 0.1
		[Header(Scanline Glitch)] [MaterialToggle] _ToggleScanline ("Allow Scanline", Float) = 0
		_ScanlineMap ("Scanline Map", 2D) = "white" {}
		_ScanlinePush ("Scanline Push", Range(0, 0.3)) = 0.1
		_ScanlineSize ("Scanline Size", Range(1, 5)) = 1
		_ScanlineSpeed ("Scanline Speed", Range(-1.5, 1.5)) = 0.3
		[Header(Static Glitch)] [MaterialToggle] _ToggleStaticGlitch ("Allow Static Glitch", Float) = 0
		_StaticGlitchMap ("Static Glitch Map", 2D) = "white" {}
		_StaticGlitchPush ("Static Push", Range(-0.1, 0.1)) = 0.03
		_StaticGlitchRange ("Static Spread", Range(0, 5000)) = 3
		[Header(Magnitude (Random Shake))] [MaterialToggle] _ToggleMagnitude ("Allow Magnitude", Float) = 0
		[MaterialToggle] _ToggleMagRanZoom ("Randomize Zoom?", Float) = 0
		_MagnitudeZoom ("Zoom Factor", Range(0, 5)) = 0
		_MagnitudeShake ("Shake Factor", Range(0, 10)) = 0
		[Header(Multiple Screens)] [MaterialToggle] _ToggleMultiScreen ("Allow Multiple Screens", Float) = 0
		[MaterialToggle] _ToggleMultiFalloff ("Allow Multiscreen Falloff?", Float) = 1
		_ScreensXRow ("Horizontal Amount of Screens", Float) = 1
		_ScreensYRow ("Vertical Amount of Screens", Float) = 1
		[Header(Image Overlay)] [MaterialToggle] _ToggleOverlay ("Allow Overlay", Float) = 0
		[MaterialToggle] _UseSepOverlay ("Use Different Image for VR", Float) = 0
		_OverlayTexture ("Overlay Texture", 2D) = "OverlayTexture" {}
		_VROverlayTexture ("VR Overlay Texture", 2D) = "VROverlayTexture" {}
		_OverlayTransparency ("Transparency", Range(0, 1)) = 1
		_OverlayYAdjust ("Height", Range(0, 3)) = 0.75
		_OverlayXAdjust ("Width", Range(0, 3)) = 0.75
		_OverlayTiling ("Tiling", Range(-1, 1)) = -0.5
		_OverlayXShift ("X Shift", Range(-3, 3)) = 0
		_OverlayYShift ("Y Shift", Range(-3, 3)) = 0
		[MaterialToggle] _OverlayTrans ("Allow Transistion", Float) = 0
		_OverlayTransX ("Horizontal Transistion", Range(-2, 2)) = 0
		_OverlayTransY ("Vertical Transistion", Range(-2, 2)) = 0
		[MaterialToggle] _ToggleOverlayTwo ("Allow Second Overlay", Float) = 0
		_OverlayTextureTwo ("Second Overlay Texture", 2D) = "OverlayTexture" {}
		_OverlayTransparencyTwo ("Second Transparency", Range(0, 1)) = 1
		_OverlayYAdjustTwo ("Second Height", Range(0, 3)) = 0.75
		_OverlayXAdjustTwo ("Second Width", Range(0, 3)) = 0.75
		_OverlayTilingTwo ("Second Tiling", Range(-1, 1)) = -0.5
		_OverlayXShiftTwo ("Second X Shift", Range(-3, 3)) = 0
		_OverlayYShiftTwo ("Second Y Shift", Range(-3, 3)) = 0
		[MaterialToggle] _OverlayTransTwo ("Allow Transistion", Float) = 0
		_OverlayTransXTwo ("Horizontal Transistion", Range(-2, 2)) = 0
		_OverlayTransYTwo ("Vertical Transistion", Range(-2, 2)) = 0
		[MaterialToggle] _ToggleOverlayThree ("Allow Third Overlay", Float) = 0
		_OverlayTextureThree ("Third Overlay Texture", 2D) = "OverlayTexture" {}
		_OverlayTransparencyThree ("Third Transparency", Range(0, 1)) = 1
		_OverlayYAdjustThree ("Third Height", Range(0, 3)) = 0.75
		_OverlayXAdjustThree ("Third Width", Range(0, 3)) = 0.75
		_OverlayTilingThree ("Third Tiling", Range(-1, 1)) = -0.5
		_OverlayXShiftThree ("Third X Shift", Range(-3, 3)) = 0
		_OverlayYShiftThree ("Third Y Shift", Range(-3, 3)) = 0
		[MaterialToggle] _OverlayTransThree ("Allow Transistion", Float) = 0
		_OverlayTransXThree ("Horizontal Transistion", Range(-2, 2)) = 0
		_OverlayTransYThree ("Vertical Transistion", Range(-2, 2)) = 0
		[Header(GIF Overlay)] [MaterialToggle] _ToggleGifOverlay ("Allow Gif Overlay", Float) = 0
		_OverlaySpritesheet ("Overlay Spritesheet", 2D) = "OverlaySpritesheet" {}
		_OSSRows ("Rows", Float) = 0
		_OSSColumns ("Columns", Float) = 0
		_OSSSpeed ("Speed", Float) = 0
		_GifTransparency ("Transparency", Range(0, 1)) = 1
		_GifYAdjust ("Height", Range(0, 3)) = 0.75
		_GifXAdjust ("Width", Range(0, 3)) = 0.75
		_GifTiling ("Tiling", Range(-1, 1)) = -0.5
		_GifXShift ("X Shift", Range(-3, 3)) = 0
		_GifYShift ("Y Shift", Range(-3, 3)) = 0
		[MaterialToggle] _ToggleTransparentGif ("Cutout Background Color", Float) = 0
		_GifColorToCut ("Background Color", Vector) = (1,1,1,1)
		_GifBackgroundTolerance ("Tolerance", Range(-3, 3)) = 0.1
		[Header(Horizontal Blur)] [MaterialToggle] _ToggleHorizontalBlur ("Allow Horizontal Blur", Float) = 0
		_HorizontalBlurOffset ("Offset", Range(-0.05, 0.05)) = 0
		[MaterialToggle] _ToggleAnimateHorizontalBlur ("Animate Horizontal Blur", Float) = 0
		_HorizontalBlurAnimateSpeed ("Animate Speed", Range(0, 10)) = 0
		[Header(Linocut)] [MaterialToggle] _ToggleLinocut ("Allow Linocut", Float) = 0
		_LinocutPower ("Linocut Power", Range(0, 10)) = 1
		_LinocutOpacity ("Linocut Opacity", Range(0, 1)) = 1
		[Header(Outline)] [MaterialToggle] _ToggleOutline ("Allow Outline", Float) = 0
		[MaterialToggle] _ToggleSepiaOutline ("Desaturate Outline", Float) = 0
		_OutlineOffset ("Outline Coverage", Range(-0.03, 0.03)) = 0.0043
		_OutlineActualOffset ("Outline Offset", Range(-0.01, 0.01)) = 0.00505
		_OutlineModOne ("Outline Darkness", Float) = 1
		_OutlineModTwo ("Outline Value One", Float) = 0.5
		_OutlineModThree ("Outline Value Two", Float) = 1
		_OutlineModFour ("Outline Value Three", Float) = 3
		[Header(Radial Blur)] [MaterialToggle] _ToggleRadialBlur ("Allow Radial Blur", Float) = 0
		_RadialBlurThanks ("Thanks Harry Alisavakis for his wonderful tutorial", Float) = 100
		_RadialBlurThanksTwo ("taught me how to make this effect.", Float) = 100
		_RadialBlurDistance ("Blur Strentgh", Range(0, 0.5)) = 0.174
		_RadialBlurCenterRadius ("Center Radius", Range(0, 1)) = 0.27
		_RadialBlurVerticalCenter ("Center (Vertical Axis)", Range(0, 1)) = 0.5
		_RadialBlurHorizontalCenter ("Center (Horizontal Axis)", Range(0, 1)) = 0.5
		[Header(Rainbow)] [MaterialToggle] _ToggleHSVRainbow ("Allow Rainbow", Float) = 0
		[MaterialToggle] _ToggleHSVRainbowX ("Allow Horizontal", Float) = 0
		[MaterialToggle] _ToggleHSVRainbowY ("Allow Vertical", Float) = 0
		_HSVRainbowHue ("Hue", Range(0, 1.5)) = 0.1
		_HSVRainbowSat ("Saturation", Range(0, 3)) = 1
		_HSVRainbowLight ("Lightness", Range(0.1, 3)) = 1
		_HSVRainbowTime ("Time", Range(0, 3)) = 0.8
		[Header(Ramp)] [MaterialToggle] _ToggleRampEffect ("Allow Ramp", Float) = 0
		[MaterialToggle] _ToggleRampRed ("Red Channel", Float) = 1
		[MaterialToggle] _ToggleRampBlue ("Blue Channel", Float) = 0
		[MaterialToggle] _ToggleRampGreen ("Green Channel", Float) = 0
		_RampMap ("Ramp Map One", 2D) = "white" {}
		_RampOneLighting ("Ramp Lighting", Range(1, 10)) = 4
		_RampOneDepth ("Ramp One Depth", Range(1, 50)) = 1
		_RampOneStrength ("Ramp One Value", Range(1, 5)) = 1
		[MaterialToggle] _ToggleRampOneAnimate ("Autoanimate Ramp One", Float) = 1
		_RampOneSpeed ("Ramp One Speed", Range(-10, 10)) = 0
		[Header(Hue Shift)] [MaterialToggle] _ToggleRecolor ("Allow Hue Shift", Float) = 0
		[MaterialToggle] _ToggleRecolorAnimate ("Automatically Shift Values?", Float) = 0
		_RecolorBright ("Brightness", Float) = 1
		_RecolorSat ("Saturation", Float) = 2
		_RecolorHue ("Hue", Float) = 3
		_RecolorSpeed ("Speed", Float) = 1
		[Header(RGB Split)] [MaterialToggle] _ToggleRGB ("Allow RGB Split", Float) = 0
		_AmountValue ("Strength", Range(0, 2)) = 0.35
		[MaterialToggle] _ToggleVerticalRGB ("Allow Vertical RGB Split", Float) = 0
		[MaterialToggle] _ToggleAutoanimate ("Autoanimate Normal RGB", Float) = 0
		_RGBAutoanimateSpeed ("RGB Autoanimate Speed", Range(0, 10)) = 0
		[Space(10)] [Header(Rotating RGB Split)] [MaterialToggle] _ToggleRotation ("Allow Rotation [Autoanimated]", Float) = 0
		_RotationSpeedRed ("Rotation Speed for the Red", Float) = 30
		_RotationSpeedBlue ("Rotation Speed for the Blue", Float) = -30
		_DirectionRed ("Rotation Direction for the Red", Float) = -1
		_DirectionBlue ("Rotation Direction for the Blue", Float) = 1
		[Space(20)] [Header((RGB) Rotating Green Options)] [MaterialToggle] _ToggleGreenMovement ("Allow Green Movement [Rotating Only]", Float) = 0
		_RotationSpeedGreen ("Rotation Speed for the Green", Float) = 30
		_DirectionGreen ("Rotation Direction for the Green", Float) = 1
		[Header((RGB) Force Users Screen To Follow)] _ScreenFollowInfo ("Will not preview in Unity, rotating RGB only.", Float) = 0
		[MaterialToggle] _ToggleScreenFollow ("Allow Screen Follow", Float) = 0
		_StrengthMod ("Icrease Screen Follow Strength", Range(0, 10)) = 0
		[Header((RGB) Custom Colors and Visbility)] _CustomColorInfo ("[wip] Color blending still weird. sorry.", Float) = 0
		_CustomVisbiltiyInfo ("[wip] Change color black-white value to change visbility.", Float) = 0
		[MaterialToggle] _ToggleColor ("Allow Custom Colors", Float) = 0
		_RedCustomColor ("Red Custom Color", Vector) = (173,46,46,1)
		_BlueCustomColor ("Blue Custom Color", Vector) = (34,72,153,1)
		_GreenCustomColor ("Green Custom Color", Vector) = (11,116,21,1)
		[Header(RGB Hide)] [MaterialToggle] _ToggleRGBHide ("Allow RGB Hide", Float) = 0
		_RGBHideOffset ("Colors Offset", Range(-1, 1)) = 0
		_HideRedTrans ("Red Transparency", Range(0, 1)) = 1
		_HideGreenTrans ("Green Transparency", Range(0, 1)) = 1
		_HideBlueTrans ("Blue Transparency", Range(0, 1)) = 1
		[Header(RGB Zoom)] [MaterialToggle] _ToggleRGBZoom ("Allow RGB Zoom", Float) = 0
		_RedZoom ("Red Zoom", Range(1, 3.5)) = 1.094
		_GreenZoom ("Green Zoom", Range(1, 3.5)) = 1.187
		_BlueZoom ("Blue Zoom", Range(1, 3.5)) = 1.319
		_RGBZoomTrans ("Zoom Transparency", Range(0, 0.8)) = 0.4
		[Header(Ripple)] [MaterialToggle] _ToggleRipple ("Allow Ripple", Float) = 0
		_ShockCenterX ("Ripple Horizontal Center", Range(-650, 800)) = 350
		_ShockCenterY ("Ripple Vertical Center", Range(-650, 800)) = 350
		_ShockDis ("Shock Distortion", Range(-100, 100)) = 0
		_ShockSpread ("Shock Spread", Range(0, 1)) = 0
		_ShockMag ("Shock Magnitude", Range(0, 0.25)) = 0
		[Header(Rotater)] [MaterialToggle] _ToggleRotater ("Allow Rotation", Float) = 0
		_RotaterValue ("Rotation Degree", Range(-7.5, 7.5)) = 0
		[MaterialToggle] _ToggleRotaterAnimate ("Animate Rotation", Float) = 0
		_RotaterSpin ("Rotation Speed", Range(-2, 2)) = 0
		[Header(Pixelate)] [MaterialToggle] _TogglePixelate ("Allow Pixelation", Float) = 0
		[MaterialToggle] _ToggleAdvPixelate ("Seperate Controls?", Float) = 0
		_PixelateStrength ("Pixelation X", Range(2000, 15)) = 185
		_PixelateStrengthY ("Pixelation Y", Range(2000, 15)) = 185
		[Header(Posterize)] [MaterialToggle] _TogglePosterize ("Allow Posterize", Float) = 0
		_PosterizeValue ("Posterization", Range(-100, -2)) = 0
		[Header(Projection)] [MaterialToggle] _ToggleProjection ("Allow Projection", Float) = 0
		_ProjectionStrength ("Projection Strength", Range(0, 1000)) = 30
		_ProjectionCopies ("Projection Copies", Range(1, 30)) = 3
		_ProjectionDirection ("Projection Direction", Range(0, 10)) = 1
		_ProjectionBright ("Brighntess Modifier", Range(0, 15)) = 0
		_ProjectionFade ("Fade Amount", Range(0, 1)) = 1
		[MaterialToggle] _ProjectionAdv ("Use Manual Controls", Float) = 0
		_ProjAdvX ("X Shift", Range(-10, 10)) = 0
		_ProjAdvY ("Y Shift", Range(-10, 10)) = 0
		_ProjScaleX ("X Scale", Range(0, 10)) = 0
		_ProjScaleY ("Y Scale", Range(0, 10)) = 0
		[Header(Saturation)] [MaterialToggle] _ToggleSaturation ("Allow Saturation", Float) = 0
		_SaturationValue ("Saturation", Range(-15, 15)) = 1
		[Header(Screen Squish)] [MaterialToggle] _ToggleScreenSquish ("Screen Squish", Float) = 0
		_ScreenSquishX ("Horizontal Squish", Range(0, 5000)) = 0
		_ScreenSquishY ("Vertical Squish", Range(0, 1000)) = 0
		[Header(Screenpull)] [MaterialToggle] _ToggleScreenpull ("Allow Screenpull", Float) = 0
		_ScreenpullStrength ("Screenpull Strength", Range(-1, 1)) = 0
		_ScreenpullStrengthTwo ("Screenpull Strength Two", Range(-1, 1)) = 0
		[Enum(Axis, 1, Diagonal, 2, User Map, 3)] _ScreenpullMode ("Direction", Float) = 1
		_ScreenpullMap ("Screenpull Map", 2D) = "ScreenpullMap" {}
		[Header(Screen Zoom)] [MaterialToggle] _ToggleScreenZoom ("Screen Zoom", Float) = 0
		_ScreenZoomInValue ("Screen Zoom In", Range(0, 5)) = 0
		[MaterialToggle] _ToggleAutoanimateScreenZoom ("Animate Screen Zoom", Float) = 0
		_ScreenZoomSpeed ("Screen Zoom Speed", Range(0, 1)) = 0
		[Header(Shake)] [MaterialToggle] _ToggleShake ("Allow Shake", Float) = 0
		[Enum(Diagonal, 0, XYShake, 1)] _ToggleXYShake ("Use Axis Shake Instead", Float) = 1
		_ShakeStrength ("Shake Strength", Range(0, 0.5)) = 0
		_ShakeSpeed ("Shake Speed", Range(0, 30)) = 0
		_emptyTex ("Optional Shake Map", 2D) = "EmptyTex" {}
		_ShakeStrength2 ("Shake Strength", Range(0, 0.5)) = 0
		_ShakeSpeed2 ("Shake Speed", Range(0, 30)) = 0
		[Header(Smear)] [MaterialToggle] _ToggleSmear ("Allow Smear", Float) = 0
		_CSDirection ("Direction", Range(-5, 5)) = 0
		_CSRed ("Red Smear", Range(-10, 10)) = 0
		_CSGreen ("Green Smear", Range(-10, 10)) = 0
		_CSBlue ("Blue Smear", Range(-10, 10)) = 0
		[MaterialToggle] _CSAutoRotate ("Rotate Smear", Float) = 0
		_CSRotateSpeed ("Rotate Speed", Range(-100, 100)) = 0
		_CSRotateDirection ("Rotate Direction", Float) = 1
		[MaterialToggle] _CSUseAdvanced ("Use Advanced Options", Float) = 0
		_CSRotateSpeedSinXR ("SinXR Speed", Float) = 0
		_CSRotateSpeedCosXR ("CosXR Speed", Float) = 0
		_CSRotateSpeedSinYR ("SinYR Speed", Float) = 0
		[MaterialToggle] _ToggleCSColor ("Tint Smear", Float) = 0
		_CSColorTint ("Color", Vector) = (1,1,1,1)
		[Header(Static)] [MaterialToggle] _ToggleNoise ("Allow Static", Float) = 0
		_StaticIntensity ("Static Intensity", Range(0, 1)) = 0
		[MaterialToggle] _ToggleAnimatedNoise ("Animate Static", Float) = 0
		_StaticSpeed ("Static Speed", Range(0, 15)) = 1
		_StaticColor ("Static Color", Vector) = (1,1,1,1)
		[Header(Swirl)] [MaterialToggle] _ToggleSwirl ("Allow Swirl", Float) = 0
		_SwirlPower ("Swirl Power", Range(0, 10)) = 0
		_SwirlAngle ("Swirl Angle", Range(-1, 1)) = 1
		_SwirlCenterX ("Swirl X Center", Range(0, 1)) = 0.5
		_SwirlCenterY ("Swirl Y Center", Range(0, 1)) = 0.5
		_SwirlRadius ("Swirl Radius", Range(0, 1)) = 0.5
		[Header(Split)] [MaterialToggle] _ToggleSplice ("Allow Split", Float) = 0
		[MaterialToggle] _SpliceFix ("Fix Splice Ends?", Float) = 0
		_SpliceTop ("Top Shift", Range(-1, 1)) = 0
		_SpliceBot ("Bot Shift", Range(-1, 1)) = 0
		_SpliceXLimit ("Horizontal Cut Placement", Range(0, 1)) = 0.5
		_SpliceLeft ("Left Shift", Range(-1, 1)) = 0
		_SpliceRight ("Right Shift", Range(-1, 1)) = 0
		_SpliceYLimit ("Vertical Cut Placement", Range(0, 1)) = 0.5
		[Header(Transistion)] [MaterialToggle] _ToggleTransistion ("Allow Transistion", Float) = 0
		_TransX ("Horizontal Transistion", Range(1, -1)) = 0.3
		_TransY ("Vertical Transistion", Range(1, -1)) = -1
		[MaterialToggle] _ToggleDiagTrans ("Allow Diagonal Transistion", Float) = 0
		_TransDL ("Left Diagonal Transistion", Range(-2, 2)) = 0.5
		_TransDR ("Right Diagonal Transition", Range(-2, 2)) = 0.5
		[Header(Twist)] [MaterialToggle] _ToggleTwist ("Allow Twist", Float) = 0
		_TwistValue ("Twist Value", Range(-10, 10)) = 0
		_TwistOffset ("Twist OFfset", Range(-10, 10)) = 0
		[Header(Vertical Blur)] [MaterialToggle] _ToggleVerticalBlur ("Allow Vertical Blur", Float) = 0
		_VerticalBlurOffset ("Offset", Range(-0.05, 0.05)) = 0
		[MaterialToggle] _ToggleAnimateVerticalBlur ("Animate Vertical Blur", Float) = 0
		_VerticalBlurAnimateSpeed ("Animate Speed", Range(0, 10)) = 0
		[Header(VHS)] [MaterialToggle] _ToggleVHS ("Allow VHS", Float) = 0
		[MaterialToggle] _ToggleSmoothWave ("Use Smooth Wave", Float) = 0
		_VHSXDisplacement ("Horizontal Displacement", Vector) = (0,0,0,0)
		_VHSYDisplacement ("Vertical Displacement", Vector) = (0,0,0,0)
		_shadowMin ("Shadow Minimum Strength", Float) = 0.5
		_shadowStrength ("Shadow Average Strength", Range(-30, 5)) = 2
		_shadowMax ("Shadow Maximum Strength", Float) = 2
		_shadowFlicker ("Shadow Flicker", Float) = 1
		_darkness ("Darkness", Float) = 12
		_waveyness ("Waveyness", Float) = 1
		[Header(Vignette)] [MaterialToggle] _ToggleVignette ("Allow Vignette", Float) = 0
		[MaterialToggle] _VigAdv ("Use Seperate Controls?", Float) = 0
		_VigX ("Vignette Horizontal Strength", Range(0, 4.5)) = 0
		_VigY ("Vignette Vertical Strength", Range(0, 4.5)) = 0
		[Header(Deepfry)] [MaterialToggle] _ToggleDeepfry ("Allow World Effects", Float) = 0
		_DeepfryValue ("Effect (1 to 34)", Float) = 0
		_DeepfryBrightness ("Brightness", Range(0, 25)) = 1
		[MaterialToggle] _ToggleSuperSpeedyMode ("Super Speedy Mode (Not Recommended)", Float) = 0
		[MaterialToggle] [HideInInspector] _runPassOneToggle ("DO NOT TOUCH", Float) = 0
		[MaterialToggle] [HideInInspector] _runPassTwoToggle ("DO NOT TOUCH", Float) = 0
		[MaterialToggle] [HideInInspector] _runPassThreeToggle ("DO NOT TOUCH", Float) = 0
		[MaterialToggle] [HideInInspector] _runPassFourToggle ("DO NOT TOUCH", Float) = 0
		[MaterialToggle] [HideInInspector] _runPassFiveToggle ("DO NOT TOUCH", Float) = 0
	}
	SubShader {
		Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
		GrabPass {
			"_LukaFirstPass"
		}
		Pass {
			Name "LSONGPASSMAINBF"
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 42136
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _ZoomRangeIncrease;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_4[16];
						float _ToggleZoom;
						float _ToggleFlipZoom;
						float _ZoomInValue;
						float _ZoomOutValue;
						float _ToggleSmoothZoom;
						float _ToggleSmoothAdvanced;
						float _SmoothZoomClampMinONE;
						float _SmoothZoomClampMaxONE;
						float _SmoothZoomDistanceMod;
						float _ToggleScreenZoom;
						float _ScreenZoomInValue;
						float _ToggleAutoanimateScreenZoom;
						float _ScreenZoomSpeed;
						vec4 unused_0_18[6];
						float _ToggleScreenSquish;
						float _ScreenSquishX;
						float _ScreenSquishY;
						vec4 unused_0_22[35];
						float _runPassOneToggle;
						vec4 unused_0_24[26];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerCameraRare {
						vec4 unused_2_0[18];
						mat4x4 unity_CameraToWorld;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_3_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec3 u_xlatb2;
					float u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					float u_xlat11;
					bool u_xlatb12;
					vec2 u_xlat19;
					bvec2 u_xlatb19;
					float u_xlat20;
					vec2 u_xlat21;
					vec2 u_xlat23;
					bool u_xlatb23;
					float u_xlat28;
					bool u_xlatb28;
					float u_xlat29;
					float u_xlat34;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassOneToggle);
					    if(u_xlatb2.x){
					        u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					        u_xlat29 = dot(u_xlat2.xyz, u_xlat2.xyz);
					        u_xlat3 = sqrt(u_xlat29);
					        u_xlatb12 = u_xlat3>=_FalloffRange;
					        if(u_xlatb12){
					            u_xlat4.xy = u_xlat1.xy;
					            u_xlat4.zw = u_xlat0.zw;
					            u_xlat21.xy = u_xlat0.xy;
					            u_xlat5.xy = u_xlat0.zw;
					        } else {
					            u_xlatb23 = _ToggleRenderLookAtMe==1.0;
					            if(u_xlatb23){
					                u_xlat21.xy = in_POSITION0.xy + in_POSITION0.xy;
					                u_xlat6.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					                u_xlat4.xy = u_xlat6.xx + u_xlat6.yz;
					                u_xlat4.zw = in_POSITION0.zw;
					                u_xlat5.xy = in_POSITION0.zw;
					            } else {
					                u_xlat1.zw = u_xlat0.zw;
					                u_xlat4 = u_xlat1;
					                u_xlat21.xy = u_xlat0.xy;
					                u_xlat5.xy = u_xlat0.zw;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlat19.x = _ZoomRangeIncrease + _FalloffRange;
					        u_xlatb19.x = u_xlat3>=u_xlat19.x;
					        if(u_xlatb19.x){
					            vs_TEXCOORD0 = u_xlat4;
					            gl_Position.zw = u_xlat5.xy;
					        } else {
					            u_xlatb19.x = _ToggleZoom==1.0;
					            if(u_xlatb19.x){
					                u_xlat21.xy = in_POSITION0.xy + in_POSITION0.xy;
					                u_xlat6.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					                u_xlat6.xy = u_xlat6.xx + u_xlat6.yz;
					                u_xlat0.xy = u_xlat1.xy;
					                u_xlat6.zw = in_POSITION0.zw;
					                u_xlat6 = (-u_xlat0) + u_xlat6;
					                u_xlatb19.x = _ToggleFlipZoom==1.0;
					                u_xlatb28 = 0.0<_ZoomOutValue;
					                u_xlatb23 = 1.0>=_ZoomInValue;
					                u_xlatb28 = u_xlatb28 && u_xlatb23;
					                u_xlat23.x = _ZoomOutValue + 1.0;
					                u_xlat7 = (-u_xlat23.xxxx) * u_xlat6;
					                u_xlat8 = u_xlat6 / (-vec4(vec4(_ZoomInValue, _ZoomInValue, _ZoomInValue, _ZoomInValue)));
					                u_xlat7 = (bool(u_xlatb28)) ? u_xlat7 : u_xlat8;
					                u_xlat8 = u_xlat23.xxxx * u_xlat6;
					                u_xlat6 = u_xlat6 / vec4(vec4(_ZoomInValue, _ZoomInValue, _ZoomInValue, _ZoomInValue));
					                u_xlat6 = (bool(u_xlatb28)) ? u_xlat8 : u_xlat6;
					                u_xlat6 = (u_xlatb19.x) ? u_xlat7 : u_xlat6;
					                u_xlatb19.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSmoothZoom);
					                u_xlatb28 = _ToggleSmoothAdvanced==0.0;
					                u_xlat23.xy = (bool(u_xlatb28)) ? vec2(0.200000003, 5.0) : vec2(_SmoothZoomClampMinONE, _SmoothZoomClampMaxONE);
					                u_xlat28 = (u_xlatb28) ? 2.0 : _SmoothZoomDistanceMod;
					                u_xlat7.xyz = unity_CameraToWorld[2].xyz + unity_CameraToWorld[3].xyz;
					                u_xlat7.xyz = (-u_xlat7.xyz) + unity_CameraToWorld[3].xyz;
					                u_xlat34 = dot(u_xlat7.xyz, u_xlat7.xyz);
					                u_xlat34 = inversesqrt(u_xlat34);
					                u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
					                u_xlat29 = inversesqrt(u_xlat29);
					                u_xlat2.xyz = vec3(u_xlat29) * u_xlat2.xyz;
					                u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
					                u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					                u_xlat11 = (-u_xlat2.x) + 1.0;
					                u_xlat11 = sqrt(u_xlat11);
					                u_xlat20 = u_xlat2.x * -0.0187292993 + 0.0742610022;
					                u_xlat20 = u_xlat20 * u_xlat2.x + -0.212114394;
					                u_xlat2.x = u_xlat20 * u_xlat2.x + 1.57072878;
					                u_xlat2.x = u_xlat11 * u_xlat2.x;
					                u_xlat28 = u_xlat3 * u_xlat28;
					                u_xlat28 = u_xlat28 * u_xlat2.x;
					                u_xlat28 = max(u_xlat23.x, u_xlat28);
					                u_xlat28 = min(u_xlat23.y, u_xlat28);
					                u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
					                u_xlat2 = vec4(u_xlat28) * u_xlat6;
					                u_xlat2 = (u_xlatb19.x) ? u_xlat2 : u_xlat6;
					                vs_TEXCOORD0 = u_xlat0 + u_xlat2;
					                gl_Position.zw = in_POSITION0.zw;
					            } else {
					                vs_TEXCOORD0 = u_xlat4;
					                gl_Position.zw = u_xlat5.xy;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlatb19.xy = equal(vec4(_ToggleScreenZoom, _ToggleAutoanimateScreenZoom, _ToggleScreenZoom, _ToggleAutoanimateScreenZoom), vec4(1.0, 1.0, 1.0, 1.0)).xy;
					        u_xlat2.x = _ScreenZoomSpeed * _Time.w;
					        u_xlat2.x = sin(u_xlat2.x);
					        u_xlat2.x = abs(u_xlat2.x) + _ScreenZoomInValue;
					        u_xlat2.x = u_xlat2.x + 1.0;
					        u_xlat2.z = _ScreenZoomInValue + 1.0;
					        u_xlat2 = u_xlat21.xyxy * u_xlat2.xxzz;
					        u_xlat2.xy = (u_xlatb19.y) ? u_xlat2.xy : u_xlat2.zw;
					        u_xlat19.xy = (u_xlatb19.x) ? u_xlat2.xy : u_xlat21.xy;
					        u_xlatb2.xyz = equal(vec4(_ToggleScreenSquish, _ScreenSquishX, _ScreenSquishY, _ToggleScreenSquish), vec4(1.0, 0.0, 0.0, 0.0)).xyz;
					        u_xlat4.xy = vec2(_ScreenSquishX, _ScreenSquishY) + vec2(100.0, 100.0);
					        u_xlat29 = (-u_xlat4.x) / u_xlat19.x;
					        u_xlat5.x = (u_xlatb2.y) ? u_xlat19.x : u_xlat29;
					        u_xlat11 = u_xlat4.y / u_xlat19.y;
					        u_xlat5.y = (u_xlatb2.z) ? u_xlat19.y : u_xlat11;
					        u_xlat19.xy = (u_xlatb2.x) ? u_xlat5.xy : u_xlat19.xy;
					        gl_Position.xy = (bool(u_xlatb12)) ? u_xlat21.xy : u_xlat19.xy;
					    } else {
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _ZoomRangeIncrease;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_4[16];
						float _ToggleZoom;
						float _ToggleFlipZoom;
						float _ZoomInValue;
						float _ZoomOutValue;
						float _ToggleSmoothZoom;
						float _ToggleSmoothAdvanced;
						float _SmoothZoomClampMinONE;
						float _SmoothZoomClampMaxONE;
						float _SmoothZoomDistanceMod;
						float _ToggleScreenZoom;
						float _ScreenZoomInValue;
						float _ToggleAutoanimateScreenZoom;
						float _ScreenZoomSpeed;
						vec4 unused_0_18[6];
						float _ToggleScreenSquish;
						float _ScreenSquishX;
						float _ScreenSquishY;
						vec4 unused_0_22[35];
						float _runPassOneToggle;
						vec4 unused_0_24[26];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_3_2[28];
						mat4x4 unity_StereoCameraToWorld[2];
						vec4 unused_3_4[4];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_6;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_3_8;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					int u_xlati1;
					bvec3 u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec3 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					bool u_xlatb9;
					float u_xlat14;
					vec2 u_xlat17;
					int u_xlati17;
					bool u_xlatb17;
					vec2 u_xlat18;
					bool u_xlatb18;
					vec2 u_xlat21;
					float u_xlat22;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlati17 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati17].zw;
					    u_xlat2.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati17].xy + u_xlat2.xy;
					    u_xlatb1.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassOneToggle);
					    if(u_xlatb1.x){
					        u_xlat1.xyw = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati17].xyz;
					        u_xlat1.x = dot(u_xlat1.xyw, u_xlat1.xyw);
					        u_xlat1.x = sqrt(u_xlat1.x);
					        u_xlatb9 = u_xlat1.x>=_FalloffRange;
					        if(u_xlatb9){
					            u_xlat3.xy = u_xlat2.xy;
					            u_xlat3.zw = u_xlat0.zw;
					            u_xlat4 = u_xlat0;
					        } else {
					            u_xlatb25 = _ToggleRenderLookAtMe==1.0;
					            if(u_xlatb25){
					                u_xlat4.xy = in_POSITION0.xy + in_POSITION0.xy;
					                u_xlat5.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					                u_xlat5.xy = u_xlat5.xx + u_xlat5.yz;
					                u_xlat21.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati17].zw;
					                u_xlat3.xy = u_xlat5.xy * unity_StereoScaleOffset[u_xlati17].xy + u_xlat21.xy;
					                u_xlat3.zw = in_POSITION0.zw;
					                u_xlat4.zw = in_POSITION0.zw;
					            } else {
					                u_xlat2.zw = u_xlat0.zw;
					                u_xlat3 = u_xlat2;
					                u_xlat4 = u_xlat0;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlat25 = _ZoomRangeIncrease + _FalloffRange;
					        u_xlatb25 = u_xlat1.x>=u_xlat25;
					        if(u_xlatb25){
					            vs_TEXCOORD0 = u_xlat3;
					            gl_Position.zw = u_xlat4.zw;
					        } else {
					            u_xlatb25 = _ToggleZoom==1.0;
					            if(u_xlatb25){
					                u_xlat4.xy = in_POSITION0.xy + in_POSITION0.xy;
					                u_xlat5.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					                u_xlat18.xy = u_xlat5.xx + u_xlat5.yz;
					                u_xlat5.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati17].zw;
					                u_xlat5.xy = u_xlat18.xy * unity_StereoScaleOffset[u_xlati17].xy + u_xlat5.xy;
					                u_xlat0.xy = u_xlat2.xy;
					                u_xlat5.zw = in_POSITION0.zw;
					                u_xlat5 = (-u_xlat0) + u_xlat5;
					                u_xlatb17 = _ToggleFlipZoom==1.0;
					                u_xlatb25 = 0.0<_ZoomOutValue;
					                u_xlatb18 = 1.0>=_ZoomInValue;
					                u_xlatb25 = u_xlatb25 && u_xlatb18;
					                u_xlat18.x = _ZoomOutValue + 1.0;
					                u_xlat6 = (-u_xlat18.xxxx) * u_xlat5;
					                u_xlat7 = u_xlat5 / (-vec4(vec4(_ZoomInValue, _ZoomInValue, _ZoomInValue, _ZoomInValue)));
					                u_xlat6 = (bool(u_xlatb25)) ? u_xlat6 : u_xlat7;
					                u_xlat7 = u_xlat18.xxxx * u_xlat5;
					                u_xlat5 = u_xlat5 / vec4(vec4(_ZoomInValue, _ZoomInValue, _ZoomInValue, _ZoomInValue));
					                u_xlat5 = (bool(u_xlatb25)) ? u_xlat7 : u_xlat5;
					                u_xlat5 = (bool(u_xlatb17)) ? u_xlat6 : u_xlat5;
					                u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSmoothZoom);
					                u_xlatb25 = _ToggleSmoothAdvanced==0.0;
					                u_xlat18.xy = (bool(u_xlatb25)) ? vec2(0.200000003, 5.0) : vec2(_SmoothZoomClampMinONE, _SmoothZoomClampMaxONE);
					                u_xlat25 = (u_xlatb25) ? 2.0 : _SmoothZoomDistanceMod;
					                u_xlat6.xyz = unity_StereoCameraToWorld[2 / 4][2 % 4].xyz + unity_StereoCameraToWorld[3 / 4][3 % 4].xyz;
					                u_xlat6.xyz = (-u_xlat6.xyz) + unity_StereoCameraToWorld[3 / 4][3 % 4].xyz;
					                u_xlat30 = dot(u_xlat6.xyz, u_xlat6.xyz);
					                u_xlat30 = inversesqrt(u_xlat30);
					                u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
					                u_xlat7.xyz = unity_StereoWorldSpaceCameraPos[0].xyz + unity_StereoWorldSpaceCameraPos[1].xyz;
					                u_xlat7.xyz = u_xlat7.xyz * vec3(0.5, 0.5, 0.5) + (-unity_ObjectToWorld[3].xyz);
					                u_xlat30 = dot(u_xlat7.xyz, u_xlat7.xyz);
					                u_xlat30 = inversesqrt(u_xlat30);
					                u_xlat7.xyz = vec3(u_xlat30) * u_xlat7.xyz;
					                u_xlat6.x = dot(u_xlat6.xyz, u_xlat7.xyz);
					                u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					                u_xlat14 = (-u_xlat6.x) + 1.0;
					                u_xlat14 = sqrt(u_xlat14);
					                u_xlat22 = u_xlat6.x * -0.0187292993 + 0.0742610022;
					                u_xlat22 = u_xlat22 * u_xlat6.x + -0.212114394;
					                u_xlat6.x = u_xlat22 * u_xlat6.x + 1.57072878;
					                u_xlat6.x = u_xlat14 * u_xlat6.x;
					                u_xlat1.x = u_xlat1.x * u_xlat25;
					                u_xlat1.x = u_xlat1.x * u_xlat6.x;
					                u_xlat1.x = max(u_xlat18.x, u_xlat1.x);
					                u_xlat1.x = min(u_xlat18.y, u_xlat1.x);
					                u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					                u_xlat6 = u_xlat1.xxxx * u_xlat5;
					                u_xlat5 = (bool(u_xlatb17)) ? u_xlat6 : u_xlat5;
					                vs_TEXCOORD0 = u_xlat0 + u_xlat5;
					                gl_Position.zw = in_POSITION0.zw;
					            } else {
					                vs_TEXCOORD0 = u_xlat3;
					                gl_Position.zw = u_xlat4.zw;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlatb1.xz = equal(vec4(_ToggleScreenZoom, _ToggleScreenZoom, _ToggleAutoanimateScreenZoom, _ToggleScreenZoom), vec4(1.0, 0.0, 1.0, 0.0)).xz;
					        u_xlat25 = _ScreenZoomSpeed * _Time.w;
					        u_xlat25 = sin(u_xlat25);
					        u_xlat25 = abs(u_xlat25) + _ScreenZoomInValue;
					        u_xlat25 = u_xlat25 + 1.0;
					        u_xlat18.xy = u_xlat4.xy * vec2(u_xlat25);
					        u_xlat25 = _ScreenZoomInValue + 1.0;
					        u_xlat3.xy = u_xlat4.xy * vec2(u_xlat25);
					        u_xlat17.xy = (u_xlatb1.z) ? u_xlat18.xy : u_xlat3.xy;
					        u_xlat1.xz = (u_xlatb1.x) ? u_xlat17.xy : u_xlat4.xy;
					        u_xlatb3.xyz = equal(vec4(_ToggleScreenSquish, _ScreenSquishX, _ScreenSquishY, _ToggleScreenSquish), vec4(1.0, 0.0, 0.0, 0.0)).xyz;
					        u_xlat18.xy = vec2(_ScreenSquishX, _ScreenSquishY) + vec2(100.0, 100.0);
					        u_xlat25 = (-u_xlat18.x) / u_xlat1.x;
					        u_xlat5.x = (u_xlatb3.y) ? u_xlat1.x : u_xlat25;
					        u_xlat25 = u_xlat18.y / u_xlat1.z;
					        u_xlat5.y = (u_xlatb3.z) ? u_xlat1.z : u_xlat25;
					        u_xlat1.xz = (u_xlatb3.x) ? u_xlat5.xy : u_xlat1.xz;
					        gl_Position.xy = (bool(u_xlatb9)) ? u_xlat4.xy : u_xlat1.xz;
					    } else {
					        vs_TEXCOORD0.xy = u_xlat2.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					vec3 ImmCB_0_0_0[4];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleInvert;
						float _ToggleSepia;
						float _InvertStrength;
						float _SepiaStrength;
						float _ToggleColorTint;
						float _ColorHue;
						float _ColorSaturation;
						float _ColorValue;
						float _ToggleRGBTint;
						vec4 _ColorRGB;
						float _ToggleNoise;
						float _StaticIntensity;
						float _ToggleAnimatedNoise;
						float _StaticSpeed;
						vec4 _StaticColor;
						float _ToggleDarken;
						float _DarknessStrength;
						float _TogglePixelate;
						float _PixelateStrength;
						float _PixelateStrengthY;
						float _ToggleAdvPixelate;
						float _ToggleDeepfry;
						float _DeepfryValue;
						float _DeepfryBrightness;
						vec4 unused_0_31[2];
						float _ToggleRampEffect;
						float _ToggleRampBlue;
						float _ToggleRampGreen;
						float _ToggleRampRed;
						float _RampOneLighting;
						float _ToggleRampOneAnimate;
						float _RampOneStrength;
						float _RampOneSpeed;
						float _RampOneDepth;
						vec4 unused_0_41[4];
						float _ToggleGlitch;
						float _GlitchRedDistort;
						float _RedYGlitch;
						float _RedXGlitch;
						float _RedTileGlitch;
						float _ToggleRandomGlitch;
						float _XGAnimate;
						float _YGAnimate;
						float _GlitchSideFactor;
						float _TileGAnimate;
						float _ToggleRandomSideGlitch;
						vec4 _GlitchRedMap_ST;
						vec4 unused_0_54[2];
						float _ToggleEdgy;
						float _EdgyOffset;
						float _EdgyOffsetTwo;
						float _EdgyMulti;
						float _ToggleOutline;
						float _ToggleSepiaOutline;
						float _OutlineOffset;
						float _OutlineModOne;
						float _OutlineModTwo;
						float _OutlineModThree;
						float _OutlineModFour;
						float _OutlineActualOffset;
						float _ToggleRadialBlur;
						float _RadialBlurCenterRadius;
						float _RadialBlurDistance;
						float _RadialBlurHorizontalCenter;
						float _RadialBlurVerticalCenter;
						float _ToggleRecolor;
						float _RecolorBright;
						float _RecolorSat;
						float _RecolorHue;
						float _RecolorSpeed;
						float _ToggleRecolorAnimate;
						vec4 _DropletColOne;
						vec4 _DropletColTwo;
						float _DropletTolerance;
						float _DropletIntensity;
						float _ToggleDroplet;
						float _ToggleDropletSepia;
						vec4 _TwoDropletColOne;
						vec4 _TwoDropletColTwo;
						float _ToggleDropletTwo;
						float _TwoDropletTolerance;
						float _TwoDropletIntensity;
						vec4 _ThreeDropletColOne;
						vec4 _ThreeDropletColTwo;
						float _ToggleDropletThree;
						float _ThreeDropletTolerance;
						float _ThreeDropletIntensity;
						vec4 _FourDropletColOne;
						vec4 _FourDropletColTwo;
						float _ToggleDropletFourth;
						float _FourDropletTolerance;
						float _FourDropletIntensity;
						float _ToggleFilter;
						float _ToggleAdvancedFilter;
						float _ToggleColoredFilter;
						float _FilterTolerance;
						float _FilterMinR;
						float _FilterMaxR;
						float _FilterMinG;
						float _FilterMaxG;
						float _FilterMinB;
						float _FilterMaxB;
						float _FilterIntensity;
						float _BackgroundFilterIntensity;
						vec4 _FilterColor;
						vec4 _BackgroundFilterColor;
						float _ToggleBloom;
						float _BloomGlow;
						vec4 _BloomColorRGB;
						float _ToggleSmear;
						float _CSDirection;
						float _CSAutoRotate;
						float _CSRotateSpeed;
						float _CSRed;
						float _CSGreen;
						float _CSBlue;
						float _CSUseAdvanced;
						float _CSRotateSpeedCosXR;
						float _CSRotateSpeedSinYR;
						float _ToggleCSColor;
						vec4 _CSColorTint;
						vec4 _VHSXDisplacement;
						vec4 _VHSYDisplacement;
						float _ToggleVHS;
						float _shadowStrength;
						float _shadowFlicker;
						float _shadowMin;
						float _shadowMax;
						float _darkness;
						float _waveyness;
						float _ToggleSmoothWave;
						float _TogglePosterize;
						float _PosterizeValue;
						float _runPassOneToggle;
						float _ToggleProjection;
						float _ProjectionStrength;
						float _ProjectionCopies;
						float _ProjectionDirection;
						float _ProjectionFade;
						float _ProjectionBright;
						float _ProjectionAdv;
						float _ProjAdvX;
						float _ProjAdvY;
						float _ProjScaleX;
						float _ProjScaleY;
						float _ToggleLinocut;
						float _LinocutPower;
						float _LinocutOpacity;
						float _ToggleFisheye;
						float _FisheyeSize;
						float _ToggleED;
						float _EDIntensity;
						float _EDTolerance;
						float _EDGlow;
						float _EDTrans;
						float _EDXOffset;
						float _EDYOffset;
						vec4 _EDColor;
						float _ToggleScanline;
						float _ScanlinePush;
						float _ScanlineSize;
						float _ScanlineSpeed;
						vec4 _ScanlineMap_ST;
						float _ToggleStaticGlitch;
						float _StaticGlitchPush;
						float _StaticGlitchRange;
						vec4 _StaticGlitchMap_ST;
						float _ToggleBlockyGlitch;
						float _AllowBGX;
						float _AllowBGY;
						float _BDepthX;
						float _BDepthY;
						float _BlockyGlitchStrength;
						float _BlockyGlitchSpeed;
						vec4 unused_0_181;
						float _ToggleFadeProjection;
						float _FPFade;
						float _FPZoom;
						float _ToggleDuotone;
						float _DuotoneHardness;
						float _DuotoneThreshold;
						float _DuotoneHardEdges;
						vec4 _DuotoneColOne;
						vec4 _DuotoneColTwo;
						float _ToggleSaturation;
						float _SaturationValue;
						float _ToggleGammaCorrect;
						float _GammaRed;
						float _GammaGreen;
						float _GammaBlue;
						float _ToggleVignette;
						float _VigX;
						float _VigY;
						float _VigAdv;
						float _ToggleRGBZoom;
						float _RedZoom;
						float _GreenZoom;
						float _BlueZoom;
						float _RGBZoomTrans;
						float _ToggleHSVRainbow;
						float _ToggleHSVRainbowX;
						float _ToggleHSVRainbowY;
						float _HSVRainbowHue;
						float _HSVRainbowSat;
						float _HSVRainbowLight;
						float _HSVRainbowTime;
						float _ToggleRipple;
						float _ShockCenterX;
						float _ShockCenterY;
						float _ShockDis;
						float _ShockMag;
						float _ShockSpread;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 _SinTime;
						vec4 unused_1_2[2];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_4;
						vec4 _ScreenParams;
						vec4 unused_1_6[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _ScanlineMap;
					uniform  sampler2D _StaticGlitchMap;
					uniform  sampler2D _BlockGlitchMap;
					uniform  sampler2D _GlitchRedMap;
					uniform  sampler2D _RampMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					bvec3 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					bvec3 u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					int u_xlati6;
					bvec3 u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					bvec2 u_xlatb7;
					vec4 u_xlat8;
					vec4 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec2 u_xlat10;
					vec4 u_xlat10_10;
					float u_xlat11;
					bool u_xlatb11;
					vec3 u_xlat13;
					bvec3 u_xlatb13;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					vec2 u_xlat16;
					bool u_xlatb16;
					vec3 u_xlat17;
					int u_xlati17;
					bool u_xlatb17;
					vec3 u_xlat18;
					vec3 u_xlat19;
					float u_xlat22;
					vec2 u_xlat24;
					bvec2 u_xlatb24;
					vec2 u_xlat26;
					vec2 u_xlat27;
					bool u_xlatb27;
					vec2 u_xlat28;
					int u_xlati28;
					vec2 u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					int u_xlati30;
					vec2 u_xlat31;
					bool u_xlatb33;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat39;
					int u_xlati39;
					bool u_xlatb39;
					float u_xlat41;
					bool u_xlatb41;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaFirstPass, u_xlat0.xy);
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlatb33 = u_xlat22>=_FalloffRange;
					    if(u_xlatb33){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlatb33 = _AllowSmartFalloff==1.0;
					        u_xlat22 = max(u_xlat22, _SmartFalloffMin);
					        u_xlat22 = min(u_xlat22, _SmartFalloffMax);
					        u_xlat22 = u_xlat22 + (-_SmartFalloffMin);
					        u_xlat22 = u_xlat22 / _SmartFalloffMin;
					        u_xlat22 = (-u_xlat22) + 1.0;
					        u_xlatb2.x = u_xlat22<0.0;
					        u_xlatb13.x = 1.0<u_xlat22;
					        u_xlat22 = (u_xlatb13.x) ? 1.0 : u_xlat22;
					        u_xlat22 = (u_xlatb2.x) ? 0.0 : u_xlat22;
					        u_xlat22 = (u_xlatb33) ? u_xlat22 : 1.0;
					        u_xlatb2.x = _TogglePixelate==1.0;
					        u_xlatb13.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowSmartFalloff);
					        u_xlatb24.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowScalarFalloff);
					        u_xlatb13.x = u_xlatb24.x && u_xlatb13.x;
					        u_xlat24.x = _PixelateStrength + -2000.0;
					        u_xlat3.x = u_xlat22 * u_xlat24.x + 2000.0;
					        u_xlat24.x = _PixelateStrengthY + -2000.0;
					        u_xlat3.y = u_xlat22 * u_xlat24.x + 2000.0;
					        u_xlat4.x = _PixelateStrength;
					        u_xlat4.y = _PixelateStrengthY;
					        u_xlat3.xy = (u_xlatb13.x) ? u_xlat3.xy : u_xlat4.xy;
					        u_xlatb24.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAdvPixelate);
					        u_xlat3.z = (u_xlatb24.x) ? u_xlat3.y : u_xlat3.x;
					        u_xlat24.xy = ceil(abs(u_xlat3.xz));
					        u_xlat3.xy = u_xlat0.xy * u_xlat24.xy;
					        u_xlat3.xy = floor(u_xlat3.xy);
					        u_xlat24.xy = u_xlat3.xy / u_xlat24.xy;
					        u_xlat3.zw = (u_xlatb2.x) ? u_xlat24.yx : u_xlat0.yx;
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleScanline);
					        if(u_xlatb0){
					            u_xlat0.x = _ScanlinePush + 100.0;
					            u_xlat0.x = u_xlat22 * u_xlat0.x + -100.0;
					            u_xlat0.x = (u_xlatb13.x) ? u_xlat0.x : _ScanlinePush;
					            u_xlat4.x = 0.169779286;
					            u_xlat4.y = float(1.0) / _ScanlineSize;
					            u_xlat2.xz = u_xlat3.wz + vec2(1.66999996, 0.0);
					            u_xlat11 = _ScanlineSpeed * _Time.y;
					            u_xlat26.xy = vec2(u_xlat11) * vec2(0.0, 1.0);
					            u_xlat2.xz = u_xlat2.xz * u_xlat4.xy + u_xlat26.xy;
					            u_xlat2.xz = u_xlat2.xz * _ScanlineMap_ST.xy + _ScanlineMap_ST.zw;
					            u_xlat10_4 = texture(_ScanlineMap, u_xlat2.xz);
					            u_xlat3.zw = u_xlat10_4.yx * u_xlat0.xx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleStaticGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = _StaticGlitchPush * _Time.y;
					            u_xlat4.x = 0.169779286;
					            u_xlat4.y = float(1.0) / _StaticGlitchPush;
					            u_xlat2.xz = u_xlat3.wz + vec2(1.66999996, 0.0);
					            u_xlat26.xy = u_xlat4.xy * u_xlat2.xz;
					            u_xlat5.xy = u_xlat2.xz * u_xlat4.xy + u_xlat0.xx;
					            u_xlat27.xy = u_xlat5.xy + vec2(0.212699994, 0.212699994);
					            u_xlat11 = u_xlat5.y * u_xlat5.x;
					            u_xlat5.xy = vec2(u_xlat11) * vec2(0.371300012, 0.371300012) + u_xlat27.xy;
					            u_xlat16.xy = u_xlat5.xy * vec2(489.122986, 489.122986);
					            u_xlat16.xy = sin(u_xlat16.xy);
					            u_xlat16.xy = u_xlat16.xy * vec2(4.78900003, 4.78900003);
					            u_xlat11 = u_xlat16.y * u_xlat16.x;
					            u_xlat35 = u_xlat5.x + 1.0;
					            u_xlat11 = u_xlat11 * u_xlat35;
					            u_xlat11 = fract(u_xlat11);
					            u_xlat2.xz = u_xlat2.xz * u_xlat4.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = u_xlat26.y * u_xlat26.x;
					            u_xlat2.xz = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat2.xz;
					            u_xlat24.xy = u_xlat2.xz * vec2(489.122986, 489.122986);
					            u_xlat24.xy = sin(u_xlat24.xy);
					            u_xlat24.xy = u_xlat24.xy * vec2(4.78900003, 4.78900003);
					            u_xlat24.x = u_xlat24.y * u_xlat24.x;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = u_xlat2.x * u_xlat24.x;
					            u_xlat2.x = fract(u_xlat2.x);
					            u_xlat11 = u_xlat11 * u_xlat2.x;
					            u_xlat2.xz = vec2(u_xlat11) * u_xlat26.xy;
					            u_xlat0.xy = u_xlat0.xx * vec2(0.0, 1.0);
					            u_xlat0.xy = u_xlat2.xz * vec2(vec2(_StaticGlitchRange, _StaticGlitchRange)) + u_xlat0.xy;
					            u_xlat2.xz = u_xlat0.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = u_xlat0.y * u_xlat0.x;
					            u_xlat2.xz = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat2.xz;
					            u_xlat24.xy = u_xlat2.xz * vec2(489.122986, 489.122986);
					            u_xlat24.xy = sin(u_xlat24.xy);
					            u_xlat24.xy = u_xlat24.xy * vec2(4.78900003, 4.78900003);
					            u_xlat24.x = u_xlat24.y * u_xlat24.x;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = u_xlat2.x * u_xlat24.x;
					            u_xlat2.x = fract(u_xlat2.x);
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat0.xy = u_xlat0.xy + (-u_xlat2.xx);
					            u_xlat0.xy = u_xlat0.xy * _StaticGlitchMap_ST.xy + _StaticGlitchMap_ST.zw;
					            u_xlat10_4 = texture(_StaticGlitchMap, u_xlat0.xy);
					            u_xlat3.zw = u_xlat10_4.yx * u_xlat10_4.yx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBlockyGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = _BlockyGlitchSpeed * _Time.y;
					            u_xlat0.x = sin(u_xlat0.x);
					            u_xlat11 = u_xlat0.x * u_xlat0.x;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat0.x = u_xlat11 * u_xlat0.x;
					            u_xlat0.x = u_xlat0.x * _BlockyGlitchStrength;
					            u_xlat11 = _Time.y * 11.0;
					            u_xlat11 = sin(u_xlat11);
					            u_xlat11 = u_xlat11 + _Time.y;
					            u_xlat2.x = sin(_Time.y);
					            u_xlat11 = u_xlat11 + u_xlat2.x;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat2.x = u_xlat3.z / _BDepthX;
					            u_xlat2.x = u_xlat11 * 0.769999981 + u_xlat2.x;
					            u_xlat10_4 = texture(_BlockGlitchMap, u_xlat2.xx);
					            u_xlat2.x = u_xlat10_4.x * 20.0;
					            u_xlat2.x = floor(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x + 66.5999985;
					            u_xlat2.x = floor(u_xlat2.x);
					            u_xlat24.x = sin(u_xlat2.x);
					            u_xlat2.z = u_xlat24.x * 43758.5469;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x * 43758.5469;
					            u_xlat2.xz = fract(u_xlat2.xz);
					            u_xlat2.x = (-u_xlat2.z) + u_xlat2.x;
					            u_xlat2.x = u_xlat2.x * 0.599998474 + u_xlat2.z;
					            u_xlat2.x = u_xlat2.x + -0.5;
					            u_xlatb24.x = u_xlat0.x<abs(u_xlat2.x);
					            u_xlat2.x = (u_xlatb24.x) ? 0.0 : u_xlat2.x;
					            u_xlat24.x = u_xlat3.w + u_xlat3.w;
					            u_xlat24.x = u_xlat24.x / _BDepthY;
					            u_xlat11 = u_xlat11 * 0.769999981 + u_xlat24.x;
					            u_xlat10_4 = texture(_BlockGlitchMap, vec2(u_xlat11));
					            u_xlat11 = u_xlat10_4.x * 20.0;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat11 = u_xlat11 + 13.6999998;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat24.x = sin(u_xlat11);
					            u_xlat24.x = u_xlat24.x * 43758.5469;
					            u_xlat24.x = fract(u_xlat24.x);
					            u_xlat11 = u_xlat11 + 1.0;
					            u_xlat11 = sin(u_xlat11);
					            u_xlat11 = u_xlat11 * 43758.5469;
					            u_xlat11 = fract(u_xlat11);
					            u_xlat11 = (-u_xlat24.x) + u_xlat11;
					            u_xlat11 = u_xlat11 * 0.699999809 + u_xlat24.x;
					            u_xlat11 = u_xlat11 + -0.5;
					            u_xlatb0 = u_xlat0.x<abs(u_xlat11);
					            u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat11;
					            u_xlatb24.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_AllowBGX, _AllowBGY, _AllowBGX, _AllowBGY)).xy;
					            u_xlat0.xy = u_xlat2.xx * u_xlat0.xx + u_xlat3.wz;
					            {
					                vec4 hlslcc_movcTemp = u_xlat3;
					                hlslcc_movcTemp.z = (u_xlatb24.y) ? u_xlat0.y : u_xlat3.z;
					                hlslcc_movcTemp.w = (u_xlatb24.x) ? u_xlat0.x : u_xlat3.w;
					                u_xlat3 = hlslcc_movcTemp;
					            }
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = u_xlat22 * _GlitchRedDistort;
					            u_xlat0.x = (u_xlatb33) ? u_xlat0.x : _GlitchRedDistort;
					            u_xlatb2.x = _ToggleRandomGlitch==1.0;
					            if(u_xlatb2.x){
					                u_xlatb2.x = _ToggleRandomSideGlitch==1.0;
					                u_xlat24.x = _GlitchSideFactor * _Time.w;
					                u_xlat24.x = sin(u_xlat24.x);
					                u_xlatb35 = u_xlat24.x>=0.0;
					                u_xlatb24.x = 0.5>=u_xlat24.x;
					                u_xlatb24.x = u_xlatb24.x && u_xlatb35;
					                u_xlat24.x = (u_xlatb24.x) ? (-u_xlat0.x) : u_xlat0.x;
					                u_xlat0.x = (u_xlatb2.x) ? u_xlat24.x : u_xlat0.x;
					                u_xlat2.x = _Time.x * 0.5;
					                u_xlat2.x = sin(u_xlat2.x);
					                u_xlat2.w = sin(_Time.w);
					                u_xlat2.xzw = u_xlat2.xxw * vec3(_YGAnimate, _XGAnimate, _TileGAnimate);
					                u_xlat4.xy = vec2(1.0, 1.0) / u_xlat2.xz;
					                u_xlat24.x = u_xlat2.w * u_xlat4.x;
					                u_xlat5.y = floor(u_xlat24.x);
					                u_xlat5.x = (-u_xlat2.x) * u_xlat5.y + u_xlat2.w;
					                u_xlat2.xz = u_xlat3.wz + u_xlat5.xy;
					                u_xlat2.xz = u_xlat4.xy * u_xlat2.xz;
					                u_xlat2.xz = u_xlat2.xz * _GlitchRedMap_ST.xy + _GlitchRedMap_ST.zw;
					                u_xlat10_4 = texture(_GlitchRedMap, u_xlat2.xz);
					                u_xlat11 = u_xlat10_4.x;
					            } else {
					                u_xlat4.x = float(1.0) / _RedYGlitch;
					                u_xlat4.y = float(1.0) / _RedXGlitch;
					                u_xlat2.x = u_xlat4.x * _RedTileGlitch;
					                u_xlat5.y = floor(u_xlat2.x);
					                u_xlat5.x = (-_RedYGlitch) * u_xlat5.y + _RedTileGlitch;
					                u_xlat2.xz = u_xlat3.wz + u_xlat5.xy;
					                u_xlat2.xz = u_xlat4.xy * u_xlat2.xz;
					                u_xlat2.xz = u_xlat2.xz * _GlitchRedMap_ST.xy + _GlitchRedMap_ST.zw;
					                u_xlat10_4 = texture(_GlitchRedMap, u_xlat2.xz);
					                u_xlat11 = u_xlat10_4.x;
					            //ENDIF
					            }
					            u_xlat3.zw = vec2(u_xlat11) * u_xlat0.xx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRipple);
					        if(u_xlatb0){
					            u_xlat2.xzw = vec3(u_xlat22) * vec3(_ShockDis, _ShockMag, _ShockSpread);
					            u_xlat2.xzw = (bool(u_xlatb33)) ? u_xlat2.xzw : vec3(_ShockDis, _ShockMag, _ShockSpread);
					            u_xlat0.x = _ShockCenterX / _ScreenParams.x;
					            u_xlat0.y = _ShockCenterY / _ScreenParams.y;
					            u_xlat4.xy = (-u_xlat3.wz) + u_xlat0.xy;
					            u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					            u_xlat4.x = sqrt(u_xlat4.x);
					            u_xlat35 = u_xlat2.w * _ScreenParams.x;
					            u_xlat35 = u_xlat35 / _ScreenParams.y;
					            u_xlat35 = (-u_xlat2.z) + u_xlat35;
					            u_xlat15 = (-u_xlat2.z) + 1.0;
					            u_xlat35 = u_xlat35 / u_xlat15;
					            u_xlat15 = u_xlat2.z + u_xlat35;
					            u_xlatb15 = u_xlat15>=u_xlat4.x;
					            u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					            u_xlat24.x = (-u_xlat2.z) + u_xlat35;
					            u_xlatb24.x = u_xlat24.x<u_xlat4.x;
					            u_xlat24.x = u_xlatb24.x ? 1.0 : float(0.0);
					            u_xlat0.xy = (-u_xlat0.xy) + u_xlat3.wz;
					            u_xlat26.x = dot(u_xlat0.xy, u_xlat0.xy);
					            u_xlat26.x = inversesqrt(u_xlat26.x);
					            u_xlat0.xy = u_xlat0.xy * u_xlat26.xx;
					            u_xlat35 = (-u_xlat35) + u_xlat4.x;
					            u_xlat24.x = u_xlat24.x * u_xlat15;
					            u_xlatb24.x = 0.0>=u_xlat24.x;
					            u_xlat2.x = u_xlat2.x * u_xlat35;
					            u_xlat2.x = log2(abs(u_xlat2.x));
					            u_xlat2.x = u_xlat2.x * 0.800000012;
					            u_xlat2.x = exp2(u_xlat2.x);
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat2.x = u_xlat35 * u_xlat2.x;
					            u_xlat0.xy = u_xlat0.xy * u_xlat2.xx + u_xlat3.wz;
					            u_xlat3.zw = (u_xlatb24.x) ? u_xlat3.zw : u_xlat0.yx;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVHS);
					        if(u_xlatb0){
					            u_xlat2.xz = u_xlat3.wz + vec2(-0.5, -0.5);
					            u_xlat4.xy = u_xlat2.xz * vec2(1.20000005, 1.20000005);
					            u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
					            u_xlat11 = dot(u_xlat2.zz, u_xlat2.xx);
					            u_xlat11 = u_xlat11 + 0.833333313;
					            u_xlat2.xz = u_xlat4.xy * vec2(u_xlat11) + vec2(0.5, 0.5);
					            u_xlat4.xy = _Time.yy * vec2(0.25, 80.0);
					            u_xlatb11 = u_xlat4.x>=(-u_xlat4.x);
					            u_xlat35 = fract(abs(u_xlat4.x));
					            u_xlat11 = (u_xlatb11) ? u_xlat35 : (-u_xlat35);
					            u_xlat11 = (-u_xlat11) + u_xlat2.z;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat11 = u_xlat11 * 20.0 + 1.0;
					            u_xlat11 = float(1.0) / u_xlat11;
					            u_xlat11 = u_xlat11 + _waveyness;
					            u_xlatb35 = _ToggleSmoothWave==0.0;
					            u_xlat4.x = u_xlat2.z * 10.0 + _Time.y;
					            u_xlat4.x = sin(u_xlat4.x);
					            u_xlat4.x = u_xlat4.x * _VHSXDisplacement.x;
					            u_xlat4.x = u_xlat4.x * 0.0199999996;
					            u_xlat15 = cos(u_xlat4.y);
					            u_xlat15 = u_xlat15 + 1.0;
					            u_xlat4.x = u_xlat15 * u_xlat4.x;
					            u_xlat4.x = u_xlat4.x * u_xlat11 + u_xlat2.x;
					            u_xlat15 = u_xlat2.z + _Time.y;
					            u_xlat15 = sin(u_xlat15);
					            u_xlat15 = u_xlat15 * _VHSXDisplacement.x;
					            u_xlat5.x = sin(_Time.y);
					            u_xlat6.x = cos(_Time.y);
					            u_xlat15 = u_xlat15 * u_xlat6.x;
					            u_xlat11 = u_xlat15 * u_xlat11 + u_xlat2.x;
					            u_xlat3.w = (u_xlatb35) ? u_xlat4.x : u_xlat11;
					            u_xlat11 = _VHSYDisplacement.x * 0.400000006;
					            u_xlat2.x = u_xlat5.x * u_xlat6.x + u_xlat5.x;
					            u_xlat11 = u_xlat11 * u_xlat2.x + u_xlat2.z;
					            u_xlatb2.x = u_xlat11>=(-u_xlat11);
					            u_xlat11 = fract(abs(u_xlat11));
					            u_xlat3.z = (u_xlatb2.x) ? u_xlat11 : (-u_xlat11);
					        //ENDIF
					        }
					        u_xlat4 = texture(_LukaFirstPass, u_xlat3.wz);
					        u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassOneToggle);
					        if(u_xlatb11){
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleFadeProjection);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _FPZoom;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _FPZoom;
					                u_xlat2.xz = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.xz = u_xlat2.xz / vec2(u_xlat11);
					                u_xlat2.xz = u_xlat2.xz + vec2(0.5, 0.5);
					                u_xlat10_5 = texture(_LukaFirstPass, u_xlat2.xz);
					                u_xlat5 = (-u_xlat4) + u_xlat10_5;
					                u_xlat5 = vec4(vec4(_FPFade, _FPFade, _FPFade, _FPFade)) * u_xlat5 + u_xlat4;
					            } else {
					                u_xlat5 = u_xlat4;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGBZoom);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat6.x = u_xlat22 * _RedZoom;
					                u_xlat6.yz = vec2(u_xlat22) * vec2(_GreenZoom, _BlueZoom);
					                u_xlat7.x = _RedZoom;
					                u_xlat7.yz = vec2(_GreenZoom, _BlueZoom);
					                u_xlat2.xzw = (bool(u_xlatb11)) ? u_xlat6.xyz : u_xlat7.xyz;
					                u_xlat6.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat7 = u_xlat6.xyxy / u_xlat2.xxzz;
					                u_xlat7 = u_xlat7 + vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat2.xz = u_xlat6.xy / u_xlat2.ww;
					                u_xlat2.xz = u_xlat2.xz + vec2(0.5, 0.5);
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat7.xy);
					                u_xlat10_7 = texture(_LukaFirstPass, u_xlat7.zw);
					                u_xlat10_8 = texture(_LukaFirstPass, u_xlat2.xz);
					                u_xlat4.x = u_xlat10_6.x;
					                u_xlat4.y = u_xlat10_7.x;
					                u_xlat4.z = u_xlat10_8.x;
					                u_xlat6 = (-u_xlat5) + u_xlat4;
					                u_xlat5 = vec4(vec4(_RGBZoomTrans, _RGBZoomTrans, _RGBZoomTrans, _RGBZoomTrans)) * u_xlat6 + u_xlat5;
					            //ENDIF
					            }
					            u_xlatb2.xz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleProjection, _ToggleProjection, _TogglePosterize, _ToggleProjection)).xz;
					            if(u_xlatb2.x){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _ProjectionStrength;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _ProjectionStrength;
					                u_xlat2.x = sin(_ProjectionDirection);
					                u_xlat6.x = cos(_ProjectionDirection);
					                u_xlat7.x = sin((-_ProjectionDirection));
					                u_xlat7.y = u_xlat6.x;
					                u_xlat7.z = u_xlat2.x;
					                u_xlat2.x = dot(vec2(0.707106769, 0.707106769), u_xlat7.yz);
					                u_xlat35 = dot(vec2(0.707106769, 0.707106769), u_xlat7.xy);
					                u_xlatb6.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ProjectionAdv);
					                u_xlat7 = u_xlat5;
					                u_xlati17 = 0;
					                while(true){
					                    u_xlat28.x = float(u_xlati17);
					                    u_xlatb39 = u_xlat28.x>=_ProjectionCopies;
					                    if(u_xlatb39){break;}
					                    u_xlat28.x = u_xlat11 * u_xlat28.x;
					                    u_xlat28.xy = u_xlat28.xx / _ScreenParams.xy;
					                    u_xlat8.x = u_xlat28.x * u_xlat2.x + u_xlat3.w;
					                    u_xlat8.y = u_xlat28.y * u_xlat35 + u_xlat3.z;
					                    u_xlat28.xy = u_xlat3.wz + u_xlat28.xy;
					                    u_xlat28.xy = u_xlat28.xy + vec2(_ProjAdvX, _ProjAdvY);
					                    u_xlat28.xy = u_xlat28.xy / vec2(_ProjScaleX, _ProjScaleY);
					                    u_xlat28.xy = (u_xlatb6.x) ? u_xlat28.xy : u_xlat8.xy;
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat28.xy);
					                    u_xlat16_8 = (-u_xlat10_1) + u_xlat10_8;
					                    u_xlat8 = vec4(vec4(_ProjectionFade, _ProjectionFade, _ProjectionFade, _ProjectionFade)) * u_xlat16_8 + u_xlat10_1;
					                    u_xlat7 = u_xlat7 + u_xlat8;
					                    u_xlati17 = u_xlati17 + 1;
					                }
					                u_xlat11 = _ProjectionCopies + _ProjectionBright;
					                u_xlat11 = u_xlat11 + 1.0;
					                u_xlat5 = u_xlat7 / vec4(u_xlat11);
					            //ENDIF
					            }
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleFisheye, _ToggleFisheye, _ToggleFisheye, _ToggleED)).xw;
					            if(u_xlatb2.x){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _FisheyeSize;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _FisheyeSize;
					                u_xlat6.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.x = dot(u_xlat6.xy, u_xlat6.xy);
					                u_xlat6.xy = u_xlat2.xx * u_xlat6.xy;
					                u_xlat7 = u_xlat5;
					                u_xlat2.x = 0.0;
					                for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					                {
					                    u_xlat8.xy = u_xlat2.xx * u_xlat6.xy;
					                    u_xlat8.xy = u_xlat8.xy * vec2(u_xlat11) + u_xlat3.wz;
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat8.xy);
					                    u_xlat7 = u_xlat7 + u_xlat10_8;
					                    u_xlat2.x = u_xlat2.x + 0.100000001;
					                }
					                u_xlat5 = u_xlat7 * vec4(0.0833333358, 0.0833333358, 0.0833333358, 0.0833333358);
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSmear);
					            if(u_xlatb11){
					                u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CSAutoRotate);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CSUseAdvanced);
					                u_xlat6.xy = (u_xlatb2.x) ? vec2(_CSRotateSpeedCosXR, _CSRotateSpeedSinYR) : vec2(vec4(_CSRotateSpeed, _CSRotateSpeed, _CSRotateSpeed, _CSRotateSpeed));
					                u_xlat6.xy = u_xlat6.xy * _Time.xx;
					                u_xlat2.x = cos(u_xlat6.x);
					                u_xlat6.x = sin(u_xlat6.y);
					                u_xlat17.x = _CSDirection * _CSDirection;
					                u_xlat17.x = inversesqrt(u_xlat17.x);
					                u_xlat17.x = u_xlat17.x * _CSDirection;
					                u_xlat6.x = u_xlat6.x * u_xlat17.x;
					                u_xlat2.x = u_xlat2.x * u_xlat17.x;
					                u_xlat17.xy = vec2(_CSGreen, _CSBlue) + vec2(2.09439516, 4.18879032);
					                u_xlat7.x = sin(_CSDirection);
					                u_xlat8.x = cos(_CSDirection);
					                u_xlat9.x = sin((-_CSDirection));
					                u_xlat10.x = _CSDirection;
					                u_xlat10.y = 1.0;
					                u_xlat39 = dot(u_xlat10.xy, u_xlat10.xy);
					                u_xlat39 = inversesqrt(u_xlat39);
					                u_xlat18.xy = vec2(u_xlat39) * u_xlat10.xy;
					                u_xlat9.y = u_xlat8.x;
					                u_xlat9.z = u_xlat7.x;
					                u_xlat39 = dot(u_xlat18.xy, u_xlat9.yz);
					                u_xlat7.x = dot(u_xlat18.xy, u_xlat9.xy);
					                u_xlat18.x = float(0.0);
					                u_xlat18.y = float(0.0);
					                u_xlat18.z = float(0.0);
					                u_xlat8.x = float(-1e+10);
					                u_xlat8.y = float(10.0);
					                for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<30 ; u_xlati_loop_2++)
					                {
					                    if(u_xlatb11){
					                        u_xlat9.y = float(u_xlati_loop_2);
					                        u_xlat31.xy = u_xlat9.yy / _ScreenParams.xy;
					                        u_xlat10.x = u_xlat31.x * u_xlat6.x + u_xlat3.w;
					                        u_xlat10.y = u_xlat31.y * u_xlat2.x + u_xlat3.z;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat10.xy);
					                        u_xlat41 = u_xlat17.x * u_xlat10_10.y;
					                        u_xlat41 = u_xlat10_10.x * _CSRed + u_xlat41;
					                        u_xlat41 = u_xlat10_10.z * u_xlat17.y + u_xlat41;
					                        u_xlat9.x = (-u_xlat9.y) * 0.00999999978 + u_xlat41;
					                        u_xlatb41 = u_xlat8.x<u_xlat9.x;
					                        u_xlat18.xyz = (bool(u_xlatb41)) ? u_xlat10_10.xyz : u_xlat18.xyz;
					                        u_xlat8.xy = (bool(u_xlatb41)) ? u_xlat9.xy : u_xlat8.xy;
					                    } else {
					                        u_xlat9.y = float(u_xlati_loop_2);
					                        u_xlat31.xy = u_xlat9.yy / _ScreenParams.xy;
					                        u_xlat10.x = u_xlat31.x * u_xlat39 + u_xlat3.w;
					                        u_xlat10.y = u_xlat31.y * u_xlat7.x + u_xlat3.z;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat10.xy);
					                        u_xlat41 = u_xlat17.x * u_xlat10_10.y;
					                        u_xlat41 = u_xlat10_10.x * _CSRed + u_xlat41;
					                        u_xlat41 = u_xlat10_10.z * u_xlat17.y + u_xlat41;
					                        u_xlat9.x = (-u_xlat9.y) * 0.00999999978 + u_xlat41;
					                        u_xlatb41 = u_xlat8.x<u_xlat9.x;
					                        u_xlat18.xyz = (bool(u_xlatb41)) ? u_xlat10_10.xyz : u_xlat18.xyz;
					                        u_xlat8.xy = (bool(u_xlatb41)) ? u_xlat9.xy : u_xlat8.xy;
					                    //ENDIF
					                    }
					                }
					                u_xlat11 = u_xlat8.y * 0.0333333351;
					                u_xlat2.x = (-u_xlat8.y) * 0.0333333351 + 1.0;
					                u_xlat6.xyz = u_xlat18.xyz * u_xlat2.xxx;
					                u_xlat6.xyz = vec3(u_xlat11) * u_xlat5.xyz + u_xlat6.xyz;
					                u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleCSColor);
					                u_xlat6.w = 1.0;
					                u_xlat7 = u_xlat6 * _CSColorTint;
					                u_xlat5 = (bool(u_xlatb11)) ? u_xlat7 : u_xlat6;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRadialBlur);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _RadialBlurDistance;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _RadialBlurDistance;
					                u_xlat6.xy = u_xlat3.wz + (-vec2(_RadialBlurHorizontalCenter, _RadialBlurVerticalCenter));
					                u_xlat2.x = dot(u_xlat6.xy, u_xlat6.xy);
					                u_xlat2.x = sqrt(u_xlat2.x);
					                u_xlat2.x = u_xlat2.x / _RadialBlurCenterRadius;
					                u_xlat7 = u_xlat5;
					                for(int u_xlati_loop_3 = 0 ; u_xlati_loop_3<24 ; u_xlati_loop_3++)
					                {
					                    u_xlat39 = float(u_xlati_loop_3);
					                    u_xlat39 = u_xlat11 * u_xlat39;
					                    u_xlat39 = u_xlat2.x * u_xlat39;
					                    u_xlat39 = (-u_xlat39) * 0.0416666679 + 1.0;
					                    u_xlat8.xy = u_xlat6.xy * vec2(u_xlat39) + vec2(_RadialBlurHorizontalCenter, _RadialBlurVerticalCenter);
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat8.xy);
					                    u_xlat7 = u_xlat7 + u_xlat10_8;
					                }
					                u_xlat5 = u_xlat7 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
					            //ENDIF
					            }
					            if(u_xlatb2.w){
					                u_xlat11 = u_xlat22 * _EDIntensity;
					                u_xlat11 = (u_xlatb13.x) ? u_xlat11 : _EDIntensity;
					                u_xlat2.x = float(0.0);
					                u_xlat2.w = float(0.0);
					                for(int u_xlati_loop_4 = 0 ; u_xlati_loop_4<3 ; u_xlati_loop_4++)
					                {
					                    u_xlat17.x = float(u_xlati_loop_4);
					                    u_xlat7.x = u_xlat17.x + _EDXOffset;
					                    u_xlat8.x = dot(vec3(-1.0, -2.0, -1.0), ImmCB_0_0_0[u_xlati_loop_4].xyz);
					                    u_xlat8.y = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xyz);
					                    u_xlat9.x = dot(vec2(-1.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat9.y = dot(vec2(-2.0, 2.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat9.z = dot(vec2(-1.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat17.xy = u_xlat2.xw;
					                    for(int u_xlati_loop_5 = 0 ; u_xlati_loop_5<3 ; u_xlati_loop_5++)
					                    {
					                        u_xlat29.x = float(u_xlati_loop_5);
					                        u_xlat7.y = u_xlat29.x + _EDYOffset;
					                        u_xlat18.xy = u_xlat7.xy / _ScreenParams.xy;
					                        u_xlat18.xy = u_xlat3.wz + u_xlat18.xy;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat18.xy);
					                        u_xlat18.x = dot(u_xlat10_10, vec4(_EDTolerance, _EDTolerance, _EDTolerance, _EDTolerance));
					                        u_xlat29.x = dot(u_xlat8.xy, ImmCB_0_0_0[u_xlati_loop_5].xz);
					                        u_xlat17.x = u_xlat18.x * u_xlat29.x + u_xlat17.x;
					                        u_xlat29.x = dot(u_xlat9.xyz, ImmCB_0_0_0[u_xlati_loop_5].xyz);
					                        u_xlat17.y = u_xlat18.x * u_xlat29.x + u_xlat17.y;
					                    }
					                    u_xlat2.xw = u_xlat17.xy;
					                }
					                u_xlat2.xw = u_xlat2.xw * u_xlat2.xw;
					                u_xlat2.xw = vec2(u_xlat11) * u_xlat2.xw;
					                u_xlat11 = u_xlat2.w + u_xlat2.x;
					                u_xlat11 = sqrt(u_xlat11);
					                u_xlat6 = vec4(vec4(_EDGlow, _EDGlow, _EDGlow, _EDGlow)) * _EDColor;
					                u_xlat11 = (-u_xlat11) + 1.0;
					                u_xlat7 = (-_EDColor) * vec4(vec4(_EDGlow, _EDGlow, _EDGlow, _EDGlow)) + u_xlat5;
					                u_xlat6 = vec4(u_xlat11) * u_xlat7 + u_xlat6;
					                u_xlat6 = (-u_xlat5) + u_xlat6;
					                u_xlat5 = vec4(vec4(_EDTrans, _EDTrans, _EDTrans, _EDTrans)) * u_xlat6 + u_xlat5;
					            //ENDIF
					            }
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleInvert, _ToggleInvert, _ToggleInvert, _ToggleSepia)).xw;
					            u_xlat6.xyz = u_xlat5.xyz * vec3(-2.0, -2.0, -2.0) + vec3(vec3(_InvertStrength, _InvertStrength, _InvertStrength));
					            u_xlat6.xyz = vec3(vec3(_InvertStrength, _InvertStrength, _InvertStrength)) * u_xlat6.xyz + u_xlat5.xyz;
					            u_xlat6.xyz = (u_xlatb2.x) ? u_xlat6.xyz : u_xlat5.xyz;
					            u_xlatb7.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleSaturation, _ToggleGammaCorrect, _ToggleSaturation, _ToggleSaturation)).xy;
					            u_xlatb11 = u_xlat6.y>=u_xlat6.z;
					            u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
					            u_xlat8.xy = u_xlat6.zy;
					            u_xlat8.z = float(-1.0);
					            u_xlat8.w = float(0.666666687);
					            u_xlat9.xy = u_xlat6.yz + (-u_xlat8.xy);
					            u_xlat9.z = float(1.0);
					            u_xlat9.w = float(-1.0);
					            u_xlat8 = vec4(u_xlat11) * u_xlat9 + u_xlat8;
					            u_xlatb11 = u_xlat6.x>=u_xlat8.x;
					            u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
					            u_xlat9.xyz = u_xlat8.xyw;
					            u_xlat9.w = u_xlat6.x;
					            u_xlat8.xyw = u_xlat9.wyx;
					            u_xlat8 = (-u_xlat9) + u_xlat8;
					            u_xlat8 = vec4(u_xlat11) * u_xlat8 + u_xlat9;
					            u_xlat11 = min(u_xlat8.y, u_xlat8.w);
					            u_xlat11 = (-u_xlat11) + u_xlat8.x;
					            u_xlat2.x = (-u_xlat8.y) + u_xlat8.w;
					            u_xlat39 = u_xlat11 * 6.0 + 1.00000001e-10;
					            u_xlat2.x = u_xlat2.x / u_xlat39;
					            u_xlat2.x = u_xlat2.x + u_xlat8.z;
					            u_xlat39 = u_xlat8.x + 1.00000001e-10;
					            u_xlat11 = u_xlat11 / u_xlat39;
					            u_xlat19.xyz = abs(u_xlat2.xxx) + vec3(0.0, -0.333333343, 0.333333343);
					            u_xlat19.xyz = fract(u_xlat19.xyz);
					            u_xlat19.xyz = (-u_xlat19.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					            u_xlat19.xyz = abs(u_xlat19.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					            u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
					            u_xlat11 = u_xlat11 * _SaturationValue;
					            u_xlat19.xyz = u_xlat19.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat19.xyz = vec3(u_xlat11) * u_xlat19.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xxx * u_xlat19.xyz;
					            u_xlat6.xyz = (u_xlatb7.x) ? u_xlat8.xyz : u_xlat6.xyz;
					            u_xlat11 = (-_GammaRed) + 1.0;
					            u_xlat8.x = float(1.0) / u_xlat11;
					            u_xlat7.xz = (-vec2(_GammaGreen, _GammaBlue)) + vec2(1.0, 1.0);
					            u_xlat8.yz = vec2(1.0, 1.0) / u_xlat7.xz;
					            u_xlat7.xzw = log2(u_xlat6.xyz);
					            u_xlat7.xzw = u_xlat7.xzw * u_xlat8.xyz;
					            u_xlat7.xzw = exp2(u_xlat7.xzw);
					            u_xlat6.xyz = (u_xlatb7.y) ? u_xlat7.xzw : u_xlat6.xyz;
					            u_xlat11 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					            u_xlat7.xyz = (-u_xlat6.xyz) + vec3(u_xlat11);
					            u_xlat7.xyz = vec3(_SepiaStrength) * u_xlat7.xyz + u_xlat6.xyz;
					            u_xlat6.xyz = (u_xlatb2.w) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleColorTint);
					            u_xlatb2.x = _ToggleRGBTint==1.0;
					            u_xlat7.xyz = u_xlat6.xyz * _ColorRGB.xyz;
					            u_xlat8.xyz = vec3(vec3(_ColorHue, _ColorHue, _ColorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					            u_xlat8.xyz = fract(u_xlat8.xyz);
					            u_xlat8.xyz = (-u_xlat8.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = abs(u_xlat8.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					            u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat8.xyz = vec3(vec3(_ColorSaturation, _ColorSaturation, _ColorSaturation)) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xyz * vec3(_ColorValue) + u_xlat6.xyz;
					            u_xlat7.xyz = (u_xlatb2.x) ? u_xlat7.xyz : u_xlat8.xyz;
					            u_xlat6.xyz = (bool(u_xlatb11)) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDarken);
					            u_xlat2.x = u_xlat22 * _DarknessStrength;
					            u_xlat2.x = (u_xlatb13.x) ? u_xlat2.x : _DarknessStrength;
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat7.xyz = u_xlat2.xxx * u_xlat6.xyz;
					            u_xlat5.xyz = (bool(u_xlatb11)) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRecolor);
					            if(u_xlatb11){
					                u_xlatb11 = _ToggleRecolorAnimate==0.0;
					                u_xlatb2.x = u_xlat5.y>=u_xlat5.z;
					                u_xlat2.x = u_xlatb2.x ? 1.0 : float(0.0);
					                u_xlat6.xy = u_xlat5.zy;
					                u_xlat6.z = float(-1.0);
					                u_xlat6.w = float(0.666666687);
					                u_xlat7.xy = u_xlat5.yz + (-u_xlat6.xy);
					                u_xlat7.z = float(1.0);
					                u_xlat7.w = float(-1.0);
					                u_xlat6 = u_xlat2.xxxx * u_xlat7 + u_xlat6;
					                u_xlatb2.x = u_xlat5.x>=u_xlat6.x;
					                u_xlat2.x = u_xlatb2.x ? 1.0 : float(0.0);
					                u_xlat7.xyz = u_xlat6.xyw;
					                u_xlat7.w = u_xlat5.x;
					                u_xlat6.xyw = u_xlat7.wyx;
					                u_xlat6 = (-u_xlat7) + u_xlat6;
					                u_xlat6 = u_xlat2.xxxx * u_xlat6 + u_xlat7;
					                u_xlat2.x = min(u_xlat6.y, u_xlat6.w);
					                u_xlat2.x = (-u_xlat2.x) + u_xlat6.x;
					                u_xlat35 = (-u_xlat6.y) + u_xlat6.w;
					                u_xlat17.x = u_xlat2.x * 6.0 + 1.00000001e-10;
					                u_xlat35 = u_xlat35 / u_xlat17.x;
					                u_xlat35 = u_xlat35 + u_xlat6.z;
					                u_xlat17.x = u_xlat6.x + 1.00000001e-10;
					                u_xlat2.x = u_xlat2.x / u_xlat17.x;
					                u_xlat17.xyz = abs(vec3(u_xlat35)) * vec3(vec3(_RecolorHue, _RecolorHue, _RecolorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					                u_xlat17.xyz = fract(u_xlat17.xyz);
					                u_xlat17.xyz = (-u_xlat17.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					                u_xlat17.xyz = abs(u_xlat17.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					                u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
					                u_xlat2.x = u_xlat2.x * _RecolorSat;
					                u_xlat17.xyz = u_xlat17.xyz + vec3(-1.0, -1.0, -1.0);
					                u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz + vec3(1.0, 1.0, 1.0);
					                u_xlat6.x = u_xlat6.x * _RecolorBright;
					                u_xlat17.xyz = u_xlat6.xxx * u_xlat17.xyz;
					                u_xlat7.x = _RecolorSpeed * _SinTime.x;
					                u_xlat35 = abs(u_xlat35) * u_xlat7.x;
					                u_xlat7.xyz = vec3(u_xlat35) * vec3(vec3(_RecolorHue, _RecolorHue, _RecolorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					                u_xlat7.xyz = fract(u_xlat7.xyz);
					                u_xlat7.xyz = (-u_xlat7.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					                u_xlat7.xyz = abs(u_xlat7.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					                u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
					                u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
					                u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
					                u_xlat7.xyz = u_xlat6.xxx * u_xlat7.xyz;
					                u_xlat5.xyz = (bool(u_xlatb11)) ? u_xlat17.xyz : u_xlat7.xyz;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBloom);
					            u_xlatb2.x = _AllowScalarFalloff==1.0;
					            u_xlatb2.x = u_xlatb33 && u_xlatb2.x;
					            u_xlat35 = u_xlat22 * _BloomGlow;
					            u_xlat35 = (u_xlatb2.x) ? u_xlat35 : _BloomGlow;
					            u_xlat6 = vec4(u_xlat35) * u_xlat5;
					            u_xlat6 = u_xlat6 * _BloomColorRGB;
					            u_xlat5 = (bool(u_xlatb11)) ? u_xlat6.xwyz : u_xlat5.xwyz;
					            u_xlat11 = _PosterizeValue + 100.0;
					            u_xlat11 = u_xlat22 * u_xlat11 + -100.0;
					            u_xlat11 = (u_xlatb13.x) ? u_xlat11 : _PosterizeValue;
					            u_xlat6.xyz = vec3(u_xlat11) * u_xlat5.xzw;
					            u_xlat6.xyz = floor(u_xlat6.xyz);
					            u_xlat11 = u_xlat11 + -1.0;
					            u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat11);
					            u_xlat6.xyz = (u_xlatb2.z) ? u_xlat6.xyz : u_xlat5.xzw;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDeepfry);
					            if(u_xlatb11){
					                u_xlatb11 = _DeepfryValue==1.0;
					                if(u_xlatb11){
					                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                    u_xlat11 = (-_Time.w) + 1.0;
					                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                    u_xlat6.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat7.xyz;
					                } else {
					                    u_xlatb11 = _DeepfryValue==2.0;
					                    if(u_xlatb11){
					                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                        u_xlat11 = (-_Time.w) + 1.0;
					                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                        u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                        u_xlat6.xyz = u_xlat7.xyz * _Time.xyz + u_xlat13.xyz;
					                    } else {
					                        u_xlatb11 = _DeepfryValue==3.0;
					                        if(u_xlatb11){
					                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                            u_xlat13.xyz = sin(u_xlat13.xyz);
					                            u_xlat11 = (-_Time.w) + 1.0;
					                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                            u_xlat6.xyz = cos(u_xlat13.xyz);
					                        } else {
					                            u_xlatb11 = _DeepfryValue==4.0;
					                            if(u_xlatb11){
					                                u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                u_xlat11 = (-_Time.w) + 1.0;
					                                u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                u_xlat6.xyz = cos(u_xlat13.xyz);
					                            } else {
					                                u_xlatb11 = _DeepfryValue==5.0;
					                                if(u_xlatb11){
					                                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                    u_xlat13.xyz = cos(u_xlat13.xyz);
					                                    u_xlat11 = (-_Time.w) + 1.0;
					                                    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                    u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                    u_xlat13.xyz = sin(u_xlat13.xyz);
					                                    u_xlat7.xyz = sin(u_xlat13.xyz);
					                                    u_xlat8.xyz = cos(u_xlat13.xyz);
					                                    u_xlat6.xyz = u_xlat7.xyz / u_xlat8.xyz;
					                                } else {
					                                    u_xlatb11 = _DeepfryValue==6.0;
					                                    if(u_xlatb11){
					                                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                        u_xlat11 = (-_Time.w) + 1.0;
					                                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                        u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                        u_xlat7.xyz = -abs(u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                        u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                        u_xlat8.xyz = abs(u_xlat13.xyz) * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                        u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                        u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(1.57072878, 1.57072878, 1.57072878);
					                                        u_xlat9.xyz = u_xlat7.xyz * u_xlat8.xyz;
					                                        u_xlat9.xyz = u_xlat9.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.14159274, 3.14159274, 3.14159274);
					                                        u_xlatb13.xyz = lessThan(u_xlat13.xyzz, (-u_xlat13.xyzz)).xyz;
					                                        u_xlat13.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat9.xyz, vec3(u_xlatb13.xyz));
					                                        u_xlat6.xyz = u_xlat8.xyz * u_xlat7.xyz + u_xlat13.xyz;
					                                    } else {
					                                        u_xlatb11 = _DeepfryValue==7.0;
					                                        if(u_xlatb11){
					                                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                            u_xlat11 = (-_Time.w) + 1.0;
					                                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                            u_xlat13.xyz = cos(u_xlat13.xyz);
					                                            u_xlat7.xyz = -abs(u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                            u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                            u_xlat8.xyz = abs(u_xlat13.xyz) * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                            u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                            u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(1.57072878, 1.57072878, 1.57072878);
					                                            u_xlat9.xyz = u_xlat7.xyz * u_xlat8.xyz;
					                                            u_xlat9.xyz = u_xlat9.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.14159274, 3.14159274, 3.14159274);
					                                            u_xlatb13.xyz = lessThan(u_xlat13.xyzz, (-u_xlat13.xyzz)).xyz;
					                                            u_xlat13.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat9.xyz, vec3(u_xlatb13.xyz));
					                                            u_xlat6.xyz = u_xlat8.xyz * u_xlat7.xyz + u_xlat13.xyz;
					                                        } else {
					                                            u_xlatb11 = _DeepfryValue==8.0;
					                                            if(u_xlatb11){
					                                                u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                u_xlat7.xyz = sin(u_xlat13.xyz);
					                                                u_xlat8.xyz = cos(u_xlat13.xyz);
					                                                u_xlat13.xyz = u_xlat7.xyz / u_xlat8.xyz;
					                                                u_xlat11 = (-_Time.w) + 1.0;
					                                                u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                u_xlat13.xyz = sin(u_xlat13.xyz);
					                                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                                u_xlat7.xyz = (-u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                                u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                                u_xlat8.xyz = u_xlat13.xyz * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                                u_xlat8.xyz = u_xlat8.xyz * u_xlat13.xyz + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                                u_xlat13.xyz = u_xlat8.xyz * u_xlat13.xyz + vec3(1.57072878, 1.57072878, 1.57072878);
					                                                u_xlat6.xyz = u_xlat7.xyz * u_xlat13.xyz;
					                                            } else {
					                                                u_xlatb11 = _DeepfryValue==9.0;
					                                                if(u_xlatb11){
					                                                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                    u_xlat11 = (-_Time.w) + 1.0;
					                                                    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                    u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                    u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					                                                    u_xlat7.xyz = exp2(u_xlat13.xyz);
					                                                    u_xlat13.xyz = exp2((-u_xlat13.xyz));
					                                                    u_xlat8.xyz = (-u_xlat13.xyz) + u_xlat7.xyz;
					                                                    u_xlat13.xyz = u_xlat13.xyz + u_xlat7.xyz;
					                                                    u_xlat13.xyz = vec3(1.0, 1.0, 1.0) / u_xlat13.xyz;
					                                                    u_xlat6.xyz = u_xlat13.xyz * u_xlat8.xyz;
					                                                } else {
					                                                    u_xlatb11 = _DeepfryValue==10.0;
					                                                    if(u_xlatb11){
					                                                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                        u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                                                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat7.xyz;
					                                                        u_xlat6.xyz = u_xlat13.xyz * vec3(-2.40299797, -2.40299797, -2.40299797);
					                                                    } else {
					                                                        u_xlatb11 = _DeepfryValue==11.0;
					                                                        if(u_xlatb11){
					                                                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					                                                            u_xlat7.xyz = exp2(u_xlat13.xyz);
					                                                            u_xlat13.xyz = exp2((-u_xlat13.xyz));
					                                                            u_xlat8.xyz = (-u_xlat13.xyz) + u_xlat7.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz + u_xlat7.xyz;
					                                                            u_xlat13.xyz = vec3(1.0, 1.0, 1.0) / u_xlat13.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz * u_xlat8.xyz;
					                                                            u_xlat6.xyz = u_xlat13.xyz / _Time.xyz;
					                                                        } else {
					                                                            u_xlatb11 = _DeepfryValue==12.0;
					                                                            if(u_xlatb11){
					                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                u_xlat11 = sin(u_xlat11);
					                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                u_xlat6.x = cos(u_xlat11);
					                                                            } else {
					                                                                u_xlatb11 = _DeepfryValue==13.0;
					                                                                if(u_xlatb11){
					                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                    u_xlat11 = sin(u_xlat11);
					                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                    u_xlat6.y = cos(u_xlat11);
					                                                                } else {
					                                                                    u_xlatb11 = _DeepfryValue==14.0;
					                                                                    if(u_xlatb11){
					                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                        u_xlat11 = sin(u_xlat11);
					                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                        u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                        u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                        u_xlat6.z = cos(u_xlat11);
					                                                                    } else {
					                                                                        u_xlatb11 = _DeepfryValue==15.0;
					                                                                        if(u_xlatb11){
					                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                            u_xlat13.x = u_xlat7.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                            u_xlat13.x = u_xlat24.x * _DeepfryBrightness + u_xlat13.x;
					                                                                            u_xlat6.z = cos(u_xlat13.x);
					                                                                            u_xlat13.x = u_xlat7.x / u_xlat8.x;
					                                                                            u_xlat13.x = u_xlat13.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat13.x = u_xlat24.x * _DeepfryBrightness + u_xlat13.x;
					                                                                            u_xlat13.x = sin(u_xlat13.x);
					                                                                            u_xlat13.x = cos(u_xlat13.x);
					                                                                            u_xlat24.x = (-u_xlat13.x) + 1.0;
					                                                                            u_xlat24.x = sqrt(u_xlat24.x);
					                                                                            u_xlat35 = u_xlat13.x * -0.0187292993 + 0.0742610022;
					                                                                            u_xlat35 = u_xlat35 * u_xlat13.x + -0.212114394;
					                                                                            u_xlat13.x = u_xlat35 * u_xlat13.x + 1.57072878;
					                                                                            u_xlat6.x = u_xlat24.x * u_xlat13.x;
					                                                                            u_xlat13.x = (-u_xlat13.x) * u_xlat24.x + 1.0;
					                                                                            u_xlat11 = u_xlat13.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                            u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                            u_xlat13.x = exp2(u_xlat11);
					                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                            u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                            u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                            u_xlat6.y = u_xlat11 * u_xlat24.x;
					                                                                        } else {
					                                                                            u_xlatb11 = _DeepfryValue==16.0;
					                                                                            if(u_xlatb11){
					                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                u_xlat7.x = sin(u_xlat11);
					                                                                                u_xlat8.x = cos(u_xlat11);
					                                                                                u_xlat11 = u_xlat7.x / u_xlat8.x;
					                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                u_xlat11 = sin(u_xlat11);
					                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                u_xlat13.x = (-u_xlat11) + 1.0;
					                                                                                u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                u_xlat24.x = u_xlat11 * -0.0187292993 + 0.0742610022;
					                                                                                u_xlat24.x = u_xlat24.x * u_xlat11 + -0.212114394;
					                                                                                u_xlat11 = u_xlat24.x * u_xlat11 + 1.57072878;
					                                                                                u_xlat6.y = u_xlat13.x * u_xlat11;
					                                                                            } else {
					                                                                                u_xlatb11 = _DeepfryValue==17.0;
					                                                                                if(u_xlatb11){
					                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                    u_xlat7.x = sin(u_xlat11);
					                                                                                    u_xlat8.x = cos(u_xlat11);
					                                                                                    u_xlat11 = u_xlat7.x / u_xlat8.x;
					                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                    u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                    u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                    u_xlat11 = cos(u_xlat11);
					                                                                                    u_xlat13.x = (-u_xlat11) + 1.0;
					                                                                                    u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                    u_xlat24.x = u_xlat11 * -0.0187292993 + 0.0742610022;
					                                                                                    u_xlat24.x = u_xlat24.x * u_xlat11 + -0.212114394;
					                                                                                    u_xlat11 = u_xlat24.x * u_xlat11 + 1.57072878;
					                                                                                    u_xlat6.z = u_xlat13.x * u_xlat11;
					                                                                                } else {
					                                                                                    u_xlatb11 = _DeepfryValue==18.0;
					                                                                                    if(u_xlatb11){
					                                                                                        u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                        u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                        u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                        u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                                                        u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                        u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                        u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                        u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                        u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                        u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                        u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                        u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                        u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                        u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                        u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                        u_xlat6.xz = u_xlat7.xy * u_xlat13.xy;
					                                                                                    } else {
					                                                                                        u_xlatb11 = _DeepfryValue==19.0;
					                                                                                        if(u_xlatb11){
					                                                                                            u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                            u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                            u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                            u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                            u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                            u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                            u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                            u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                            u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                            u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                            u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                            u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                            u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                            u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                            u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                            u_xlat6.xy = u_xlat7.xy * u_xlat13.xy;
					                                                                                        } else {
					                                                                                            u_xlatb11 = _DeepfryValue==20.0;
					                                                                                            if(u_xlatb11){
					                                                                                                u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                                u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                                u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                                u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                                u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                                u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                                u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                                u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                                u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                                u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                                u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                                u_xlat6.yz = u_xlat7.xy * u_xlat13.xy;
					                                                                                            } else {
					                                                                                                u_xlatb11 = _DeepfryValue==21.0;
					                                                                                                if(u_xlatb11){
					                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                    u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                    u_xlat13.x = exp2(u_xlat11);
					                                                                                                    u_xlat11 = exp2((-u_xlat11));
					                                                                                                    u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                    u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                    u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                    u_xlat6.y = u_xlat11 * u_xlat24.x;
					                                                                                                } else {
					                                                                                                    u_xlatb11 = _DeepfryValue==22.0;
					                                                                                                    if(u_xlatb11){
					                                                                                                        u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                        u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                                        u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                                        u_xlat13.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xy;
					                                                                                                        u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                        u_xlat7.xy = -abs(u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                        u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                        u_xlat29.xy = abs(u_xlat13.xy) * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                        u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(-0.212114394, -0.212114394);
					                                                                                                        u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(1.57072878, 1.57072878);
					                                                                                                        u_xlat8.xy = u_xlat7.xy * u_xlat29.xy;
					                                                                                                        u_xlat8.xy = u_xlat8.xy * vec2(-2.0, -2.0) + vec2(3.14159274, 3.14159274);
					                                                                                                        u_xlatb13.xy = lessThan(u_xlat13.xyxx, (-u_xlat13.xyxx)).xy;
					                                                                                                        u_xlat13.xy = mix(vec2(0.0, 0.0), u_xlat8.xy, vec2(u_xlatb13.xy));
					                                                                                                        u_xlat6.xy = u_xlat29.xy * u_xlat7.xy + u_xlat13.xy;
					                                                                                                    } else {
					                                                                                                        u_xlatb11 = _DeepfryValue==23.0;
					                                                                                                        if(u_xlatb11){
					                                                                                                            u_xlat13.xy = (-u_xlat6.yx) + vec2(1.0, 1.0);
					                                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                            u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.yx;
					                                                                                                            u_xlat7.xy = u_xlat6.yx * _Time.ww;
					                                                                                                            u_xlat13.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xy;
					                                                                                                            u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                            u_xlat7.xy = -abs(u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                            u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                            u_xlat29.xy = abs(u_xlat13.xy) * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                            u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(-0.212114394, -0.212114394);
					                                                                                                            u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(1.57072878, 1.57072878);
					                                                                                                            u_xlat8.xy = u_xlat7.xy * u_xlat29.xy;
					                                                                                                            u_xlat8.xy = u_xlat8.xy * vec2(-2.0, -2.0) + vec2(3.14159274, 3.14159274);
					                                                                                                            u_xlatb13.xy = lessThan(u_xlat13.xyxx, (-u_xlat13.xyxx)).xy;
					                                                                                                            u_xlat13.xy = mix(vec2(0.0, 0.0), u_xlat8.xy, vec2(u_xlatb13.xy));
					                                                                                                            u_xlat6.xz = u_xlat29.xy * u_xlat7.xy + u_xlat13.xy;
					                                                                                                        } else {
					                                                                                                            u_xlatb11 = _DeepfryValue==24.0;
					                                                                                                            if(u_xlatb11){
					                                                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                                                u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                                                u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                u_xlat13.x = exp2(u_xlat11);
					                                                                                                                u_xlat11 = exp2((-u_xlat11));
					                                                                                                                u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                                u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                                u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                u_xlat6.x = u_xlat11 * u_xlat24.x;
					                                                                                                            } else {
					                                                                                                                u_xlatb11 = _DeepfryValue==25.0;
					                                                                                                                if(u_xlatb11){
					                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                    u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                    u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                    u_xlat11 = u_xlat24.x * 0.100000001 + u_xlat11;
					                                                                                                                    u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                    u_xlat24.x = exp2(u_xlat11);
					                                                                                                                    u_xlat11 = exp2((-u_xlat11));
					                                                                                                                    u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                    u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                    u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                    u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                    u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                    u_xlat11 = cos(u_xlat11);
					                                                                                                                    u_xlat13.x = -abs(u_xlat11) + 1.0;
					                                                                                                                    u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                                                    u_xlat24.x = abs(u_xlat11) * -0.0187292993 + 0.0742610022;
					                                                                                                                    u_xlat24.x = u_xlat24.x * abs(u_xlat11) + -0.212114394;
					                                                                                                                    u_xlat24.x = u_xlat24.x * abs(u_xlat11) + 1.57072878;
					                                                                                                                    u_xlat35 = u_xlat13.x * u_xlat24.x;
					                                                                                                                    u_xlat35 = u_xlat35 * -2.0 + 3.14159274;
					                                                                                                                    u_xlatb11 = u_xlat11<(-u_xlat11);
					                                                                                                                    u_xlat11 = u_xlatb11 ? u_xlat35 : float(0.0);
					                                                                                                                    u_xlat6.z = u_xlat24.x * u_xlat13.x + u_xlat11;
					                                                                                                                } else {
					                                                                                                                    u_xlatb11 = _DeepfryValue==26.0;
					                                                                                                                    if(u_xlatb11){
					                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                        u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                        u_xlat11 = u_xlat24.x * 0.100000001 + u_xlat11;
					                                                                                                                        u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                        u_xlat24.x = exp2(u_xlat11);
					                                                                                                                        u_xlat11 = exp2((-u_xlat11));
					                                                                                                                        u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                        u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                        u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                        u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                        u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                        u_xlat24.x = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat35 = u_xlat6.x * _Time.w;
					                                                                                                                        u_xlat24.x = u_xlat35 * _DeepfryBrightness + u_xlat24.x;
					                                                                                                                        u_xlat24.x = cos(u_xlat24.x);
					                                                                                                                        u_xlat7.x = -abs(u_xlat24.x) + 1.0;
					                                                                                                                        u_xlat7.x = sqrt(u_xlat7.x);
					                                                                                                                        u_xlat18.x = abs(u_xlat24.x) * -0.0187292993 + 0.0742610022;
					                                                                                                                        u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + -0.212114394;
					                                                                                                                        u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + 1.57072878;
					                                                                                                                        u_xlat29.x = u_xlat7.x * u_xlat18.x;
					                                                                                                                        u_xlat29.x = u_xlat29.x * -2.0 + 3.14159274;
					                                                                                                                        u_xlatb24.x = u_xlat24.x<(-u_xlat24.x);
					                                                                                                                        u_xlat24.x = u_xlatb24.x ? u_xlat29.x : float(0.0);
					                                                                                                                        u_xlat6.z = u_xlat18.x * u_xlat7.x + u_xlat24.x;
					                                                                                                                        u_xlat11 = cos(u_xlat11);
					                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat11 = u_xlat35 * _DeepfryBrightness + u_xlat11;
					                                                                                                                        u_xlat11 = sin(u_xlat11);
					                                                                                                                        u_xlat7.x = sin(u_xlat11);
					                                                                                                                        u_xlat8.x = cos(u_xlat11);
					                                                                                                                        u_xlat6.y = u_xlat7.x / u_xlat8.x;
					                                                                                                                    } else {
					                                                                                                                        u_xlatb11 = _DeepfryValue==27.0;
					                                                                                                                        if(u_xlatb11){
					                                                                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                            u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                            u_xlat24.x = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                            u_xlat35 = u_xlat6.x * _Time.w;
					                                                                                                                            u_xlat7.x = u_xlat35 * _DeepfryBrightness;
					                                                                                                                            u_xlat7.x = u_xlat7.x * 0.100000001 + u_xlat24.x;
					                                                                                                                            u_xlat7.x = u_xlat7.x * 1.44269502;
					                                                                                                                            u_xlat18.x = exp2(u_xlat7.x);
					                                                                                                                            u_xlat7.x = exp2((-u_xlat7.x));
					                                                                                                                            u_xlat29.x = (-u_xlat7.x) + u_xlat18.x;
					                                                                                                                            u_xlat7.x = u_xlat7.x + u_xlat18.x;
					                                                                                                                            u_xlat7.x = float(1.0) / u_xlat7.x;
					                                                                                                                            u_xlat6.z = u_xlat7.x * u_xlat29.x;
					                                                                                                                            u_xlat24.x = u_xlat35 * _DeepfryBrightness + u_xlat24.x;
					                                                                                                                            u_xlat24.x = cos(u_xlat24.x);
					                                                                                                                            u_xlat7.x = -abs(u_xlat24.x) + 1.0;
					                                                                                                                            u_xlat7.x = sqrt(u_xlat7.x);
					                                                                                                                            u_xlat18.x = abs(u_xlat24.x) * -0.0187292993 + 0.0742610022;
					                                                                                                                            u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + -0.212114394;
					                                                                                                                            u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + 1.57072878;
					                                                                                                                            u_xlat29.x = u_xlat7.x * u_xlat18.x;
					                                                                                                                            u_xlat29.x = u_xlat29.x * -2.0 + 3.14159274;
					                                                                                                                            u_xlatb24.x = u_xlat24.x<(-u_xlat24.x);
					                                                                                                                            u_xlat24.x = u_xlatb24.x ? u_xlat29.x : float(0.0);
					                                                                                                                            u_xlat6.y = u_xlat18.x * u_xlat7.x + u_xlat24.x;
					                                                                                                                            u_xlat11 = cos(u_xlat11);
					                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                            u_xlat11 = u_xlat35 * _DeepfryBrightness + u_xlat11;
					                                                                                                                            u_xlat11 = sin(u_xlat11);
					                                                                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                                                                            u_xlat6.x = u_xlat7.x / u_xlat8.x;
					                                                                                                                        } else {
					                                                                                                                            u_xlatb11 = _DeepfryValue==28.0;
					                                                                                                                            if(u_xlatb11){
					                                                                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                                                                u_xlat6.x = cos(u_xlat11);
					                                                                                                                            } else {
					                                                                                                                                u_xlatb11 = _DeepfryValue==29.0;
					                                                                                                                                if(u_xlatb11){
					                                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                    u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                    u_xlat11 = u_xlat24.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                    u_xlat6.x = cos(u_xlat11);
					                                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                    u_xlat6.yz = cos(vec2(u_xlat11));
					                                                                                                                                } else {
					                                                                                                                                    u_xlatb11 = _DeepfryValue==30.0;
					                                                                                                                                    if(u_xlatb11){
					                                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                        u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                        u_xlat6.x = u_xlat24.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                        u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                        u_xlat6.yz = u_xlat13.xx * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + vec2(u_xlat11);
					                                                                                                                                    } else {
					                                                                                                                                        u_xlatb11 = _DeepfryValue==31.0;
					                                                                                                                                        if(u_xlatb11){
					                                                                                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                            u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat24.x;
					                                                                                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                                            u_xlat24.x = exp2(u_xlat11);
					                                                                                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                                                                                            u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                                            u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                                            u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                                            u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat24.x;
					                                                                                                                                            u_xlat6.y = cos(u_xlat11);
					                                                                                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                                            u_xlat13.x = exp2(u_xlat11);
					                                                                                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                                                                                            u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                                                            u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                                            u_xlat6.z = u_xlat11 * u_xlat24.x;
					                                                                                                                                        } else {
					                                                                                                                                            u_xlat7 = (-u_xlat6.xxyz) + vec4(1.0, 1.0, 1.0, 1.0);
					                                                                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                                                            u_xlat8 = u_xlat6.xxyz * _Time.wwww;
					                                                                                                                                            u_xlat8 = u_xlat8 * vec4(vec4(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                                                                                                                                            u_xlat7 = u_xlat7 * vec4(u_xlat11) + u_xlat8;
					                                                                                                                                            u_xlat11 = cos(u_xlat7.x);
					                                                                                                                                            u_xlat13.x = -abs(u_xlat11) + 1.0;
					                                                                                                                                            u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                                                                            u_xlat24.x = abs(u_xlat11) * -0.0187292993 + 0.0742610022;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * abs(u_xlat11) + -0.212114394;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * abs(u_xlat11) + 1.57072878;
					                                                                                                                                            u_xlat35 = u_xlat13.x * u_xlat24.x;
					                                                                                                                                            u_xlat35 = u_xlat35 * -2.0 + 3.14159274;
					                                                                                                                                            u_xlatb7.x = u_xlat11<(-u_xlat11);
					                                                                                                                                            u_xlat35 = u_xlatb7.x ? u_xlat35 : float(0.0);
					                                                                                                                                            u_xlat6.y = u_xlat24.x * u_xlat13.x + u_xlat35;
					                                                                                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                                                                                            u_xlat6.w = u_xlat7.x / u_xlat8.x;
					                                                                                                                                            u_xlatb13.xyz = equal(vec4(_DeepfryValue), vec4(32.0, 33.0, 34.0, 34.0)).xyz;
					                                                                                                                                            u_xlat8.xyz = sin(u_xlat7.wzy);
					                                                                                                                                            u_xlat8.xyz = sin(u_xlat8.xyz);
					                                                                                                                                            u_xlat8.xyz = u_xlat8.xyz * vec3(-0.947587371, -0.947587371, -0.947587371);
					                                                                                                                                            u_xlat7.xyz = (u_xlatb13.z) ? u_xlat8.xyz : u_xlat7.yzw;
					                                                                                                                                            u_xlat7.xyz = (u_xlatb13.y) ? u_xlat6.xwz : u_xlat7.xyz;
					                                                                                                                                            u_xlat6.xyz = (u_xlatb13.x) ? u_xlat6.xyz : u_xlat7.xyz;
					                                                                                                                                        //ENDIF
					                                                                                                                                        }
					                                                                                                                                    //ENDIF
					                                                                                                                                    }
					                                                                                                                                //ENDIF
					                                                                                                                                }
					                                                                                                                            //ENDIF
					                                                                                                                            }
					                                                                                                                        //ENDIF
					                                                                                                                        }
					                                                                                                                    //ENDIF
					                                                                                                                    }
					                                                                                                                //ENDIF
					                                                                                                                }
					                                                                                                            //ENDIF
					                                                                                                            }
					                                                                                                        //ENDIF
					                                                                                                        }
					                                                                                                    //ENDIF
					                                                                                                    }
					                                                                                                //ENDIF
					                                                                                                }
					                                                                                            //ENDIF
					                                                                                            }
					                                                                                        //ENDIF
					                                                                                        }
					                                                                                    //ENDIF
					                                                                                    }
					                                                                                //ENDIF
					                                                                                }
					                                                                            //ENDIF
					                                                                            }
					                                                                        //ENDIF
					                                                                        }
					                                                                    //ENDIF
					                                                                    }
					                                                                //ENDIF
					                                                                }
					                                                            //ENDIF
					                                                            }
					                                                        //ENDIF
					                                                        }
					                                                    //ENDIF
					                                                    }
					                                                //ENDIF
					                                                }
					                                            //ENDIF
					                                            }
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                //ENDIF
					                                }
					                            //ENDIF
					                            }
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleNoise);
					            u_xlat13.xy = vs_TEXCOORD1.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = vs_TEXCOORD1.y * vs_TEXCOORD1.x;
					            u_xlat39 = u_xlat35 * 0.371300012;
					            u_xlat24.xy = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat13.xy;
					            u_xlat7.xy = u_xlat24.xy * vec2(489.122986, 489.122986);
					            u_xlat7.xy = sin(u_xlat7.xy);
					            u_xlat7.xy = u_xlat7.xy * vec2(4.78900003, 4.78900003);
					            u_xlatb35 = _ToggleAnimatedNoise==1.0;
					            u_xlat29.x = _StaticSpeed * _Time.x;
					            u_xlat13.x = u_xlat39 * u_xlat29.x + u_xlat13.x;
					            u_xlat13.x = (u_xlatb35) ? u_xlat13.x : u_xlat24.x;
					            u_xlat24.x = u_xlat22 * _StaticIntensity;
					            u_xlat2.x = (u_xlatb2.x) ? u_xlat24.x : _StaticIntensity;
					            u_xlat24.x = u_xlat7.y * u_xlat7.x;
					            u_xlat13.x = u_xlat13.x + 1.0;
					            u_xlat13.x = u_xlat13.x * u_xlat24.x;
					            u_xlat13.x = fract(u_xlat13.x);
					            u_xlat7.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					            u_xlat2.x = u_xlat13.x * u_xlat2.x;
					            u_xlat2.xyz = (-u_xlat2.xxx) * _StaticColor.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					            u_xlat5.xzw = (bool(u_xlatb11)) ? u_xlat2.xyz : u_xlat6.xyz;
					            if(u_xlatb0){
					                u_xlat0.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.xy = u_xlat0.xy * vec2(1.20000005, 1.20000005);
					                u_xlat24.x = u_xlat0.x + u_xlat0.x;
					                u_xlat0.x = u_xlat0.x * u_xlat24.x;
					                u_xlat11 = u_xlat0.y * u_xlat0.y;
					                u_xlat0.x = u_xlat11 * u_xlat0.x + 0.833333313;
					                u_xlat0.xy = u_xlat2.xy * u_xlat0.xx + vec2(0.5, 0.5);
					                u_xlat2.xy = _Time.yy * vec2(0.25, 80.0);
					                u_xlatb24.x = u_xlat2.x>=(-u_xlat2.x);
					                u_xlat2.x = fract(abs(u_xlat2.x));
					                u_xlat2.x = (u_xlatb24.x) ? u_xlat2.x : (-u_xlat2.x);
					                u_xlat2.x = u_xlat0.y + (-u_xlat2.x);
					                u_xlat2.x = u_xlat2.x * u_xlat2.x;
					                u_xlat2.x = u_xlat2.x * 20.0 + 1.0;
					                u_xlat2.x = float(1.0) / u_xlat2.x;
					                u_xlat2.x = u_xlat2.x + _waveyness;
					                u_xlatb24.x = _ToggleSmoothWave==0.0;
					                u_xlat35 = u_xlat0.y * 10.0 + _Time.y;
					                u_xlat35 = sin(u_xlat35);
					                u_xlat35 = u_xlat35 * _VHSXDisplacement.x;
					                u_xlat35 = u_xlat35 * 0.0199999996;
					                u_xlat13.x = cos(u_xlat2.y);
					                u_xlat13.x = u_xlat13.x + 1.0;
					                u_xlat13.x = u_xlat13.x * u_xlat35;
					                u_xlat13.x = u_xlat13.x * u_xlat2.x + u_xlat0.x;
					                u_xlat35 = u_xlat0.y + _Time.y;
					                u_xlat35 = sin(u_xlat35);
					                u_xlat35 = u_xlat35 * _VHSXDisplacement.x;
					                u_xlat6.x = sin(_Time.y);
					                u_xlat7.x = cos(_Time.y);
					                u_xlat35 = u_xlat35 * u_xlat7.x;
					                u_xlat0.x = u_xlat35 * u_xlat2.x + u_xlat0.x;
					                u_xlat0.x = (u_xlatb24.x) ? u_xlat13.x : u_xlat0.x;
					                u_xlat2.x = _VHSYDisplacement.x * 0.400000006;
					                u_xlat13.x = u_xlat6.x * u_xlat7.x + u_xlat6.x;
					                u_xlat11 = u_xlat2.x * u_xlat13.x + u_xlat0.y;
					                u_xlatb2.x = u_xlat11>=(-u_xlat11);
					                u_xlat11 = fract(abs(u_xlat11));
					                u_xlat11 = (u_xlatb2.x) ? u_xlat11 : (-u_xlat11);
					                u_xlat2 = u_xlat5.xzwy + vec4(0.0, 0.0, 0.0, 1.0);
					                u_xlat6.x = _shadowFlicker * _Time.y;
					                u_xlat6.x = cos(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x + _Time.y;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat6.x = max(u_xlat6.x, _shadowMin);
					                u_xlat6.x = min(u_xlat6.x, _shadowMax);
					                u_xlat6.x = u_xlat6.x + _shadowStrength;
					                u_xlat17.x = u_xlat11 + -0.5;
					                u_xlat17.x = u_xlat17.x * u_xlat17.x;
					                u_xlat17.x = (-u_xlat17.x) * u_xlat6.x + 1.0;
					                u_xlat0.x = u_xlat0.x + -0.5;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
					                u_xlat0.x = u_xlat0.x * u_xlat17.x;
					                u_xlat2 = u_xlat0.xxxx * u_xlat2;
					                u_xlat0.x = u_xlat11 * 30.0 + _Time.y;
					                u_xlatb11 = u_xlat0.x>=(-u_xlat0.x);
					                u_xlat0.x = fract(abs(u_xlat0.x));
					                u_xlat0.x = (u_xlatb11) ? u_xlat0.x : (-u_xlat0.x);
					                u_xlat0.x = u_xlat0.x + _darkness;
					                u_xlat11 = _darkness + 1.0;
					                u_xlat0.x = u_xlat0.x / u_xlat11;
					                u_xlat5 = u_xlat0.xxxx * u_xlat2.xwyz;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgy);
					            if(u_xlatb0){
					                u_xlatb0 = _AllowScalarFalloff==1.0;
					                u_xlatb0 = u_xlatb0 && u_xlatb33;
					                u_xlat2.xy = vec2(u_xlat22) * vec2(_EdgyOffset, _EdgyOffsetTwo);
					                u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : vec2(_EdgyOffset, _EdgyOffsetTwo);
					                u_xlat3.xy = (-u_xlat0.xy) + u_xlat3.ww;
					                u_xlat10_2 = texture(_LukaFirstPass, u_xlat3.xz);
					                u_xlat2.xyz = (-u_xlat10_2.xyz) + vec3(vec3(_EdgyMulti, _EdgyMulti, _EdgyMulti));
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat5.xzw;
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat3.yz);
					                u_xlat6.xyz = (-u_xlat10_6.xyz) + vec3(vec3(_EdgyMulti, _EdgyMulti, _EdgyMulti));
					                u_xlat6.xyz = u_xlat5.xzw + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
					                u_xlat5.xzw = u_xlat2.xyz * vec3(0.25, 0.25, 0.25);
					                u_xlat5.y = 1.0;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleOutline);
					            if(u_xlatb0){
					                u_xlat3.y = u_xlat3.w + _OutlineActualOffset;
					                u_xlat10_2 = texture(_LukaFirstPass, u_xlat3.yz);
					                u_xlat2.xyz = (-u_xlat10_2.xyz) + vec3(vec3(_OutlineOffset, _OutlineOffset, _OutlineOffset));
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat5.xzw;
					                u_xlat3.x = u_xlat3.w + (-_OutlineActualOffset);
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat3.xz);
					                u_xlat6.xyz = (-u_xlat10_6.xyz) + vec3(vec3(_OutlineOffset, _OutlineOffset, _OutlineOffset));
					                u_xlat6.xyz = u_xlat5.xzw + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz / vec3(vec3(_OutlineModOne, _OutlineModOne, _OutlineModOne));
					                u_xlat6.x = u_xlat2.x * _OutlineModTwo;
					                u_xlat6.yz = u_xlat2.yz * vec2(_OutlineModThree, _OutlineModFour);
					                u_xlatb0 = _ToggleSepiaOutline==1.0;
					                u_xlat11 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					                u_xlat6.w = 1.0;
					                u_xlat5 = (bool(u_xlatb0)) ? vec4(u_xlat11) : u_xlat6.xwyz;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRampEffect);
					            if(u_xlatb0){
					                u_xlat2 = u_xlat5.xzwy * vec4(vec4(_RampOneDepth, _RampOneDepth, _RampOneDepth, _RampOneDepth));
					                u_xlatb0 = _ToggleRampRed==1.0;
					                if(u_xlatb0){
					                    u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                    if(u_xlatb0){
					                        u_xlat0.x = _RampOneSpeed * _Time.x;
					                        u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.x;
					                        u_xlat0.y = 0.5;
					                        u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                        u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                    } else {
					                        u_xlat0.x = u_xlat5.x * _RampOneDepth + _RampOneStrength;
					                        u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                        u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                    //ENDIF
					                    }
					                } else {
					                    u_xlatb0 = _ToggleRampBlue==1.0;
					                    if(u_xlatb0){
					                        u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                        if(u_xlatb0){
					                            u_xlat0.x = _RampOneSpeed * _Time.x;
					                            u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.z;
					                            u_xlat0.y = 0.5;
					                            u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                            u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                        } else {
					                            u_xlat0.x = u_xlat5.w * _RampOneDepth + _RampOneStrength;
					                            u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                            u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                        //ENDIF
					                        }
					                    } else {
					                        u_xlatb0 = _ToggleRampGreen==1.0;
					                        if(u_xlatb0){
					                            u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                            if(u_xlatb0){
					                                u_xlat0.x = _RampOneSpeed * _Time.x;
					                                u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.y;
					                                u_xlat0.y = 0.5;
					                                u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                                u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                            } else {
					                                u_xlat0.x = u_xlat2.y * _RampOneStrength;
					                                u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                                u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                            //ENDIF
					                            }
					                        } else {
					                            u_xlat5 = u_xlat2.xwyz;
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDroplet);
					            if(u_xlatb0){
					                u_xlat2.xyz = _DropletColOne.xyz + (-vec3(_DropletTolerance));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _DropletColOne.xyz + vec3(_DropletTolerance);
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb2.y && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _DropletColTwo;
					                    SV_Target0 = vec4(vec4(_DropletIntensity, _DropletIntensity, _DropletIntensity, _DropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletTwo);
					                u_xlat2.xyz = _TwoDropletColOne.xyz + (-vec3(vec3(_TwoDropletTolerance, _TwoDropletTolerance, _TwoDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _TwoDropletColOne.xyz + vec3(vec3(_TwoDropletTolerance, _TwoDropletTolerance, _TwoDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _TwoDropletColTwo;
					                    SV_Target0 = vec4(vec4(_TwoDropletIntensity, _TwoDropletIntensity, _TwoDropletIntensity, _TwoDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletThree);
					                u_xlat2.xyz = _ThreeDropletColOne.xyz + (-vec3(vec3(_ThreeDropletTolerance, _ThreeDropletTolerance, _ThreeDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _ThreeDropletColOne.xyz + vec3(vec3(_ThreeDropletTolerance, _ThreeDropletTolerance, _ThreeDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _ThreeDropletColTwo;
					                    SV_Target0 = vec4(vec4(_ThreeDropletIntensity, _ThreeDropletIntensity, _ThreeDropletIntensity, _ThreeDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletFourth);
					                u_xlat2.xyz = _FourDropletColOne.xyz + (-vec3(vec3(_FourDropletTolerance, _FourDropletTolerance, _FourDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _FourDropletColOne.xyz + vec3(vec3(_FourDropletTolerance, _FourDropletTolerance, _FourDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _FourDropletColTwo;
					                    SV_Target0 = vec4(vec4(_FourDropletIntensity, _FourDropletIntensity, _FourDropletIntensity, _FourDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = _ToggleDropletSepia==1.0;
					                u_xlat11 = dot(u_xlat5.xzw, vec3(0.300000012, 0.589999974, 0.109999999));
					                u_xlat5 = (bool(u_xlatb0)) ? vec4(u_xlat11) : u_xlat5;
					                u_xlat2.xyz = u_xlat5.xzw;
					            } else {
					                u_xlat2.xyz = u_xlat5.xzw;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleFilter);
					            u_xlatb3.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleAdvancedFilter, _ToggleColoredFilter, _ToggleAdvancedFilter, _ToggleAdvancedFilter)).xy;
					            u_xlat27.xy = (u_xlatb3.x) ? vec2(_FilterMinR, _FilterMaxR) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat6.xy = (u_xlatb3.x) ? vec2(_FilterMinG, _FilterMaxG) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat6.zw = (u_xlatb3.x) ? vec2(_FilterMinB, _FilterMaxB) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat5.x = dot(u_xlat2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					            u_xlat7 = (-u_xlat5.xxxy) + _BackgroundFilterColor;
					            u_xlat7 = vec4(vec4(_BackgroundFilterIntensity, _BackgroundFilterIntensity, _BackgroundFilterIntensity, _BackgroundFilterIntensity)) * u_xlat7 + u_xlat5.xxxy;
					            u_xlat7 = (u_xlatb3.y) ? u_xlat7 : u_xlat5.xxxy;
					            u_xlat11 = (-u_xlat27.x) + _FilterColor.x;
					            u_xlatb11 = u_xlat10_1.x>=u_xlat11;
					            u_xlat3.x = u_xlat27.y + _FilterColor.x;
					            u_xlatb3.x = u_xlat3.x>=u_xlat10_1.x;
					            u_xlatb11 = u_xlatb11 && u_xlatb3.x;
					            u_xlat3.xy = (-u_xlat6.xz) + _FilterColor.yz;
					            u_xlatb3.xy = greaterThanEqual(u_xlat10_1.yzyy, u_xlat3.xyxx).xy;
					            u_xlat5.xz = u_xlat6.yw + _FilterColor.yz;
					            u_xlatb5.xz = greaterThanEqual(u_xlat5.xxzx, u_xlat10_1.yyzy).xz;
					            u_xlatb3.x = u_xlatb3.x && u_xlatb5.x;
					            u_xlatb3.y = u_xlatb3.y && u_xlatb5.z;
					            u_xlatb11 = u_xlatb11 && u_xlatb3.x;
					            u_xlatb11 = u_xlatb3.y && u_xlatb11;
					            u_xlat6 = u_xlat10_1 + (-u_xlat7);
					            u_xlat6 = vec4(vec4(_FilterIntensity, _FilterIntensity, _FilterIntensity, _FilterIntensity)) * u_xlat6 + u_xlat7;
					            u_xlat6 = (bool(u_xlatb11)) ? u_xlat6 : u_xlat7;
					            u_xlat2.w = u_xlat5.y;
					            u_xlat2 = (bool(u_xlatb0)) ? u_xlat6 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleLinocut);
					            if(u_xlatb0){
					                u_xlat0.x = vs_TEXCOORD0.y * 0.5;
					                u_xlat3.xy = (-vs_TEXCOORD0.yy) * vec2(0.5, 0.5) + u_xlat3.wz;
					                u_xlat11 = min(abs(u_xlat3.y), abs(u_xlat3.x));
					                u_xlat5.x = max(abs(u_xlat3.y), abs(u_xlat3.x));
					                u_xlat5.x = float(1.0) / u_xlat5.x;
					                u_xlat11 = u_xlat11 * u_xlat5.x;
					                u_xlat5.x = u_xlat11 * u_xlat11;
					                u_xlat16.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
					                u_xlat16.x = u_xlat5.x * u_xlat16.x + 0.180141002;
					                u_xlat16.x = u_xlat5.x * u_xlat16.x + -0.330299497;
					                u_xlat5.x = u_xlat5.x * u_xlat16.x + 0.999866009;
					                u_xlat16.x = u_xlat11 * u_xlat5.x;
					                u_xlatb27 = abs(u_xlat3.y)<abs(u_xlat3.x);
					                u_xlat16.x = u_xlat16.x * -2.0 + 1.57079637;
					                u_xlat16.x = u_xlatb27 ? u_xlat16.x : float(0.0);
					                u_xlat11 = u_xlat11 * u_xlat5.x + u_xlat16.x;
					                u_xlatb5.x = u_xlat3.y<(-u_xlat3.y);
					                u_xlat5.x = u_xlatb5.x ? -3.14159274 : float(0.0);
					                u_xlat11 = u_xlat11 + u_xlat5.x;
					                u_xlat5.x = min(u_xlat3.y, u_xlat3.x);
					                u_xlat16.x = max(u_xlat3.y, u_xlat3.x);
					                u_xlatb5.x = u_xlat5.x<(-u_xlat5.x);
					                u_xlatb16 = u_xlat16.x>=(-u_xlat16.x);
					                u_xlatb5.x = u_xlatb16 && u_xlatb5.x;
					                u_xlat11 = (u_xlatb5.x) ? (-u_xlat11) : u_xlat11;
					                u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					                u_xlat3.x = sqrt(u_xlat3.x);
					                u_xlat3.x = (-u_xlat3.x) * 0.00100000005 + 0.5;
					                u_xlat11 = u_xlat3.x * 2.0 + u_xlat11;
					                u_xlat11 = cos(u_xlat11);
					                u_xlat11 = u_xlat11 * _LinocutPower;
					                u_xlat0.x = u_xlat11 * 0.5 + u_xlat0.x;
					                u_xlat0.x = u_xlat0.x * 1000.0;
					                u_xlat0.x = sin(u_xlat0.x);
					                u_xlat0.x = u_xlat0.x * 0.25 + 0.75;
					                u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					                u_xlat3.x = u_xlat0.x * 0.5;
					                u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat11;
					                u_xlat11 = float(1.0) / u_xlat3.x;
					                u_xlat0.x = u_xlat11 * u_xlat0.x;
					                u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					                u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat0.x = dot(vec2(u_xlat11), u_xlat0.xx);
					                u_xlat0.x = min(u_xlat0.x, 1.0);
					                u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat11);
					                u_xlat5.w = 0.0;
					                u_xlat5 = (-u_xlat2) + u_xlat5;
					                u_xlat2 = vec4(_LinocutOpacity) * u_xlat5 + u_xlat2;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDuotone);
					            u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					            u_xlat5 = _DuotoneColOne + _DuotoneColTwo;
					            u_xlat6 = u_xlat5 * vec4(0.5, 0.5, 0.5, 0.5);
					            u_xlatb3.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DuotoneHardEdges);
					            u_xlatb14 = u_xlat11>=_DuotoneThreshold;
					            u_xlat7 = (bool(u_xlatb14)) ? _DuotoneColOne : _DuotoneColTwo;
					            u_xlat8.x = (-_DuotoneThreshold) + 1.0;
					            u_xlat19.x = u_xlat8.x * _DuotoneHardness;
					            u_xlat30 = u_xlat11 + (-_DuotoneThreshold);
					            u_xlat19.x = float(1.0) / u_xlat19.x;
					            u_xlat19.x = u_xlat19.x * u_xlat30;
					            u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
					            u_xlat30 = u_xlat19.x * -2.0 + 3.0;
					            u_xlat19.x = u_xlat19.x * u_xlat19.x;
					            u_xlat19.x = u_xlat19.x * u_xlat30;
					            u_xlat9 = (-u_xlat5) * vec4(0.5, 0.5, 0.5, 0.5) + _DuotoneColOne;
					            u_xlat6 = u_xlat19.xxxx * u_xlat9 + u_xlat6;
					            u_xlat8.x = (-u_xlat8.x) * _DuotoneHardness + _DuotoneThreshold;
					            u_xlat19.x = (-u_xlat8.x) + _DuotoneThreshold;
					            u_xlat11 = u_xlat11 + (-u_xlat8.x);
					            u_xlat8.x = float(1.0) / u_xlat19.x;
					            u_xlat11 = u_xlat11 * u_xlat8.x;
					            u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
					            u_xlat8.x = u_xlat11 * -2.0 + 3.0;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat11 = u_xlat11 * u_xlat8.x;
					            u_xlat5 = u_xlat5 * vec4(0.5, 0.5, 0.5, 0.5) + (-_DuotoneColTwo);
					            u_xlat5 = vec4(u_xlat11) * u_xlat5 + _DuotoneColTwo;
					            u_xlat5 = (bool(u_xlatb14)) ? u_xlat6 : u_xlat5;
					            u_xlat5 = (u_xlatb3.x) ? u_xlat7 : u_xlat5;
					            u_xlat2 = (bool(u_xlatb0)) ? u_xlat5 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVignette);
					            u_xlatb11 = _VigAdv==0.0;
					            u_xlat11 = (u_xlatb11) ? _VigX : _VigY;
					            u_xlat3.xy = u_xlat3.zw + vec2(-0.5, -0.5);
					            u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					            u_xlat3.x = (-u_xlat3.x) * _VigX + 1.0;
					            u_xlat11 = (-u_xlat3.y) * u_xlat11 + 1.0;
					            u_xlat11 = u_xlat11 * u_xlat3.x;
					            u_xlat5 = vec4(u_xlat11) * u_xlat2;
					            u_xlat4 = (bool(u_xlatb0)) ? u_xlat5 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleHSVRainbow);
					            u_xlat11 = u_xlat3.z * _ToggleHSVRainbowY;
					            u_xlat11 = _Time.y * _HSVRainbowTime + u_xlat11;
					            u_xlat11 = u_xlat3.w * _ToggleHSVRainbowX + u_xlat11;
					            u_xlat11 = u_xlat11 * _HSVRainbowHue;
					            u_xlat2.xyz = vec3(u_xlat11) * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					            u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					            u_xlatb3.xyz = greaterThanEqual(u_xlat2.xyzx, (-u_xlat2.xyzx)).xyz;
					            u_xlat2.xyz = fract(abs(u_xlat2.xyz));
					            {
					                vec4 hlslcc_movcTemp = u_xlat2;
					                hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat2.x : (-u_xlat2.x);
					                hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat2.y : (-u_xlat2.y);
					                hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat2.z : (-u_xlat2.z);
					                u_xlat2 = hlslcc_movcTemp;
					            }
					            u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					            u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
					            u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					            u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					            u_xlat2.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + vec3(3.0, 3.0, 3.0);
					            u_xlat2.xyz = u_xlat3.xyz * u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat2.xyz = vec3(vec3(_HSVRainbowSat, _HSVRainbowSat, _HSVRainbowSat)) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = u_xlat2.xyz * vec3(_HSVRainbowLight);
					            u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
					            u_xlat4.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat4.xyz;
					        //ENDIF
					        }
					        u_xlatb0 = _AllowFadingFalloff==1.0;
					        u_xlatb0 = u_xlatb0 && u_xlatb33;
					        if(u_xlatb0){
					            u_xlat2 = (-u_xlat10_1) + u_xlat4;
					            SV_Target0 = vec4(u_xlat22) * u_xlat2 + u_xlat10_1;
					            return;
					        } else {
					            SV_Target0 = u_xlat4;
					            return;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					vec3 ImmCB_0_0_0[4];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleInvert;
						float _ToggleSepia;
						float _InvertStrength;
						float _SepiaStrength;
						float _ToggleColorTint;
						float _ColorHue;
						float _ColorSaturation;
						float _ColorValue;
						float _ToggleRGBTint;
						vec4 _ColorRGB;
						float _ToggleNoise;
						float _StaticIntensity;
						float _ToggleAnimatedNoise;
						float _StaticSpeed;
						vec4 _StaticColor;
						float _ToggleDarken;
						float _DarknessStrength;
						float _TogglePixelate;
						float _PixelateStrength;
						float _PixelateStrengthY;
						float _ToggleAdvPixelate;
						float _ToggleDeepfry;
						float _DeepfryValue;
						float _DeepfryBrightness;
						vec4 unused_0_31[2];
						float _ToggleRampEffect;
						float _ToggleRampBlue;
						float _ToggleRampGreen;
						float _ToggleRampRed;
						float _RampOneLighting;
						float _ToggleRampOneAnimate;
						float _RampOneStrength;
						float _RampOneSpeed;
						float _RampOneDepth;
						vec4 unused_0_41[4];
						float _ToggleGlitch;
						float _GlitchRedDistort;
						float _RedYGlitch;
						float _RedXGlitch;
						float _RedTileGlitch;
						float _ToggleRandomGlitch;
						float _XGAnimate;
						float _YGAnimate;
						float _GlitchSideFactor;
						float _TileGAnimate;
						float _ToggleRandomSideGlitch;
						vec4 _GlitchRedMap_ST;
						vec4 unused_0_54[2];
						float _ToggleEdgy;
						float _EdgyOffset;
						float _EdgyOffsetTwo;
						float _EdgyMulti;
						float _ToggleOutline;
						float _ToggleSepiaOutline;
						float _OutlineOffset;
						float _OutlineModOne;
						float _OutlineModTwo;
						float _OutlineModThree;
						float _OutlineModFour;
						float _OutlineActualOffset;
						float _ToggleRadialBlur;
						float _RadialBlurCenterRadius;
						float _RadialBlurDistance;
						float _RadialBlurHorizontalCenter;
						float _RadialBlurVerticalCenter;
						float _ToggleRecolor;
						float _RecolorBright;
						float _RecolorSat;
						float _RecolorHue;
						float _RecolorSpeed;
						float _ToggleRecolorAnimate;
						vec4 _DropletColOne;
						vec4 _DropletColTwo;
						float _DropletTolerance;
						float _DropletIntensity;
						float _ToggleDroplet;
						float _ToggleDropletSepia;
						vec4 _TwoDropletColOne;
						vec4 _TwoDropletColTwo;
						float _ToggleDropletTwo;
						float _TwoDropletTolerance;
						float _TwoDropletIntensity;
						vec4 _ThreeDropletColOne;
						vec4 _ThreeDropletColTwo;
						float _ToggleDropletThree;
						float _ThreeDropletTolerance;
						float _ThreeDropletIntensity;
						vec4 _FourDropletColOne;
						vec4 _FourDropletColTwo;
						float _ToggleDropletFourth;
						float _FourDropletTolerance;
						float _FourDropletIntensity;
						float _ToggleFilter;
						float _ToggleAdvancedFilter;
						float _ToggleColoredFilter;
						float _FilterTolerance;
						float _FilterMinR;
						float _FilterMaxR;
						float _FilterMinG;
						float _FilterMaxG;
						float _FilterMinB;
						float _FilterMaxB;
						float _FilterIntensity;
						float _BackgroundFilterIntensity;
						vec4 _FilterColor;
						vec4 _BackgroundFilterColor;
						float _ToggleBloom;
						float _BloomGlow;
						vec4 _BloomColorRGB;
						float _ToggleSmear;
						float _CSDirection;
						float _CSAutoRotate;
						float _CSRotateSpeed;
						float _CSRed;
						float _CSGreen;
						float _CSBlue;
						float _CSUseAdvanced;
						float _CSRotateSpeedCosXR;
						float _CSRotateSpeedSinYR;
						float _ToggleCSColor;
						vec4 _CSColorTint;
						vec4 _VHSXDisplacement;
						vec4 _VHSYDisplacement;
						float _ToggleVHS;
						float _shadowStrength;
						float _shadowFlicker;
						float _shadowMin;
						float _shadowMax;
						float _darkness;
						float _waveyness;
						float _ToggleSmoothWave;
						float _TogglePosterize;
						float _PosterizeValue;
						float _runPassOneToggle;
						float _ToggleProjection;
						float _ProjectionStrength;
						float _ProjectionCopies;
						float _ProjectionDirection;
						float _ProjectionFade;
						float _ProjectionBright;
						float _ProjectionAdv;
						float _ProjAdvX;
						float _ProjAdvY;
						float _ProjScaleX;
						float _ProjScaleY;
						float _ToggleLinocut;
						float _LinocutPower;
						float _LinocutOpacity;
						float _ToggleFisheye;
						float _FisheyeSize;
						float _ToggleED;
						float _EDIntensity;
						float _EDTolerance;
						float _EDGlow;
						float _EDTrans;
						float _EDXOffset;
						float _EDYOffset;
						vec4 _EDColor;
						float _ToggleScanline;
						float _ScanlinePush;
						float _ScanlineSize;
						float _ScanlineSpeed;
						vec4 _ScanlineMap_ST;
						float _ToggleStaticGlitch;
						float _StaticGlitchPush;
						float _StaticGlitchRange;
						vec4 _StaticGlitchMap_ST;
						float _ToggleBlockyGlitch;
						float _AllowBGX;
						float _AllowBGY;
						float _BDepthX;
						float _BDepthY;
						float _BlockyGlitchStrength;
						float _BlockyGlitchSpeed;
						vec4 unused_0_181;
						float _ToggleFadeProjection;
						float _FPFade;
						float _FPZoom;
						float _ToggleDuotone;
						float _DuotoneHardness;
						float _DuotoneThreshold;
						float _DuotoneHardEdges;
						vec4 _DuotoneColOne;
						vec4 _DuotoneColTwo;
						float _ToggleSaturation;
						float _SaturationValue;
						float _ToggleGammaCorrect;
						float _GammaRed;
						float _GammaGreen;
						float _GammaBlue;
						float _ToggleVignette;
						float _VigX;
						float _VigY;
						float _VigAdv;
						float _ToggleRGBZoom;
						float _RedZoom;
						float _GreenZoom;
						float _BlueZoom;
						float _RGBZoomTrans;
						float _ToggleHSVRainbow;
						float _ToggleHSVRainbowX;
						float _ToggleHSVRainbowY;
						float _HSVRainbowHue;
						float _HSVRainbowSat;
						float _HSVRainbowLight;
						float _HSVRainbowTime;
						float _ToggleRipple;
						float _ShockCenterX;
						float _ShockCenterY;
						float _ShockDis;
						float _ShockMag;
						float _ShockSpread;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 _SinTime;
						vec4 unused_1_2[3];
						vec4 _ScreenParams;
						vec4 unused_1_4[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _ScanlineMap;
					uniform  sampler2D _StaticGlitchMap;
					uniform  sampler2D _BlockGlitchMap;
					uniform  sampler2D _GlitchRedMap;
					uniform  sampler2D _RampMap;
					in  vec4 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					bvec3 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					bvec3 u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					int u_xlati6;
					bvec3 u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					bvec2 u_xlatb7;
					vec4 u_xlat8;
					vec4 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec2 u_xlat10;
					vec4 u_xlat10_10;
					float u_xlat11;
					bool u_xlatb11;
					vec3 u_xlat13;
					bvec3 u_xlatb13;
					bool u_xlatb14;
					float u_xlat15;
					bool u_xlatb15;
					vec2 u_xlat16;
					bool u_xlatb16;
					vec3 u_xlat17;
					int u_xlati17;
					bool u_xlatb17;
					vec3 u_xlat18;
					vec3 u_xlat19;
					float u_xlat22;
					int u_xlati22;
					vec2 u_xlat24;
					bvec2 u_xlatb24;
					vec2 u_xlat26;
					vec2 u_xlat27;
					bool u_xlatb27;
					vec2 u_xlat28;
					int u_xlati28;
					vec2 u_xlat29;
					bool u_xlatb29;
					float u_xlat30;
					int u_xlati30;
					vec2 u_xlat31;
					bool u_xlatb33;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat39;
					int u_xlati39;
					bool u_xlatb39;
					float u_xlat41;
					bool u_xlatb41;
					void main()
					{
						ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
						ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
						ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaFirstPass, u_xlat0.xy);
					    u_xlati22 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati22].xyz;
					    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat22 = sqrt(u_xlat22);
					    u_xlatb33 = u_xlat22>=_FalloffRange;
					    if(u_xlatb33){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlatb33 = _AllowSmartFalloff==1.0;
					        u_xlat22 = max(u_xlat22, _SmartFalloffMin);
					        u_xlat22 = min(u_xlat22, _SmartFalloffMax);
					        u_xlat22 = u_xlat22 + (-_SmartFalloffMin);
					        u_xlat22 = u_xlat22 / _SmartFalloffMin;
					        u_xlat22 = (-u_xlat22) + 1.0;
					        u_xlatb2.x = u_xlat22<0.0;
					        u_xlatb13.x = 1.0<u_xlat22;
					        u_xlat22 = (u_xlatb13.x) ? 1.0 : u_xlat22;
					        u_xlat22 = (u_xlatb2.x) ? 0.0 : u_xlat22;
					        u_xlat22 = (u_xlatb33) ? u_xlat22 : 1.0;
					        u_xlatb2.x = _TogglePixelate==1.0;
					        u_xlatb13.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowSmartFalloff);
					        u_xlatb24.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowScalarFalloff);
					        u_xlatb13.x = u_xlatb24.x && u_xlatb13.x;
					        u_xlat24.x = _PixelateStrength + -2000.0;
					        u_xlat3.x = u_xlat22 * u_xlat24.x + 2000.0;
					        u_xlat24.x = _PixelateStrengthY + -2000.0;
					        u_xlat3.y = u_xlat22 * u_xlat24.x + 2000.0;
					        u_xlat4.x = _PixelateStrength;
					        u_xlat4.y = _PixelateStrengthY;
					        u_xlat3.xy = (u_xlatb13.x) ? u_xlat3.xy : u_xlat4.xy;
					        u_xlatb24.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAdvPixelate);
					        u_xlat3.z = (u_xlatb24.x) ? u_xlat3.y : u_xlat3.x;
					        u_xlat24.xy = ceil(abs(u_xlat3.xz));
					        u_xlat3.xy = u_xlat0.xy * u_xlat24.xy;
					        u_xlat3.xy = floor(u_xlat3.xy);
					        u_xlat24.xy = u_xlat3.xy / u_xlat24.xy;
					        u_xlat3.zw = (u_xlatb2.x) ? u_xlat24.yx : u_xlat0.yx;
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleScanline);
					        if(u_xlatb0){
					            u_xlat0.x = _ScanlinePush + 100.0;
					            u_xlat0.x = u_xlat22 * u_xlat0.x + -100.0;
					            u_xlat0.x = (u_xlatb13.x) ? u_xlat0.x : _ScanlinePush;
					            u_xlat4.x = 0.169779286;
					            u_xlat4.y = float(1.0) / _ScanlineSize;
					            u_xlat2.xz = u_xlat3.wz + vec2(1.66999996, 0.0);
					            u_xlat11 = _ScanlineSpeed * _Time.y;
					            u_xlat26.xy = vec2(u_xlat11) * vec2(0.0, 1.0);
					            u_xlat2.xz = u_xlat2.xz * u_xlat4.xy + u_xlat26.xy;
					            u_xlat2.xz = u_xlat2.xz * _ScanlineMap_ST.xy + _ScanlineMap_ST.zw;
					            u_xlat10_4 = texture(_ScanlineMap, u_xlat2.xz);
					            u_xlat3.zw = u_xlat10_4.yx * u_xlat0.xx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleStaticGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = _StaticGlitchPush * _Time.y;
					            u_xlat4.x = 0.169779286;
					            u_xlat4.y = float(1.0) / _StaticGlitchPush;
					            u_xlat2.xz = u_xlat3.wz + vec2(1.66999996, 0.0);
					            u_xlat26.xy = u_xlat4.xy * u_xlat2.xz;
					            u_xlat5.xy = u_xlat2.xz * u_xlat4.xy + u_xlat0.xx;
					            u_xlat27.xy = u_xlat5.xy + vec2(0.212699994, 0.212699994);
					            u_xlat11 = u_xlat5.y * u_xlat5.x;
					            u_xlat5.xy = vec2(u_xlat11) * vec2(0.371300012, 0.371300012) + u_xlat27.xy;
					            u_xlat16.xy = u_xlat5.xy * vec2(489.122986, 489.122986);
					            u_xlat16.xy = sin(u_xlat16.xy);
					            u_xlat16.xy = u_xlat16.xy * vec2(4.78900003, 4.78900003);
					            u_xlat11 = u_xlat16.y * u_xlat16.x;
					            u_xlat35 = u_xlat5.x + 1.0;
					            u_xlat11 = u_xlat11 * u_xlat35;
					            u_xlat11 = fract(u_xlat11);
					            u_xlat2.xz = u_xlat2.xz * u_xlat4.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = u_xlat26.y * u_xlat26.x;
					            u_xlat2.xz = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat2.xz;
					            u_xlat24.xy = u_xlat2.xz * vec2(489.122986, 489.122986);
					            u_xlat24.xy = sin(u_xlat24.xy);
					            u_xlat24.xy = u_xlat24.xy * vec2(4.78900003, 4.78900003);
					            u_xlat24.x = u_xlat24.y * u_xlat24.x;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = u_xlat2.x * u_xlat24.x;
					            u_xlat2.x = fract(u_xlat2.x);
					            u_xlat11 = u_xlat11 * u_xlat2.x;
					            u_xlat2.xz = vec2(u_xlat11) * u_xlat26.xy;
					            u_xlat0.xy = u_xlat0.xx * vec2(0.0, 1.0);
					            u_xlat0.xy = u_xlat2.xz * vec2(vec2(_StaticGlitchRange, _StaticGlitchRange)) + u_xlat0.xy;
					            u_xlat2.xz = u_xlat0.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = u_xlat0.y * u_xlat0.x;
					            u_xlat2.xz = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat2.xz;
					            u_xlat24.xy = u_xlat2.xz * vec2(489.122986, 489.122986);
					            u_xlat24.xy = sin(u_xlat24.xy);
					            u_xlat24.xy = u_xlat24.xy * vec2(4.78900003, 4.78900003);
					            u_xlat24.x = u_xlat24.y * u_xlat24.x;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = u_xlat2.x * u_xlat24.x;
					            u_xlat2.x = fract(u_xlat2.x);
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat0.xy = u_xlat0.xy + (-u_xlat2.xx);
					            u_xlat0.xy = u_xlat0.xy * _StaticGlitchMap_ST.xy + _StaticGlitchMap_ST.zw;
					            u_xlat10_4 = texture(_StaticGlitchMap, u_xlat0.xy);
					            u_xlat3.zw = u_xlat10_4.yx * u_xlat10_4.yx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBlockyGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = _BlockyGlitchSpeed * _Time.y;
					            u_xlat0.x = sin(u_xlat0.x);
					            u_xlat11 = u_xlat0.x * u_xlat0.x;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat0.x = u_xlat11 * u_xlat0.x;
					            u_xlat0.x = u_xlat0.x * _BlockyGlitchStrength;
					            u_xlat11 = _Time.y * 11.0;
					            u_xlat11 = sin(u_xlat11);
					            u_xlat11 = u_xlat11 + _Time.y;
					            u_xlat2.x = sin(_Time.y);
					            u_xlat11 = u_xlat11 + u_xlat2.x;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat2.x = u_xlat3.z / _BDepthX;
					            u_xlat2.x = u_xlat11 * 0.769999981 + u_xlat2.x;
					            u_xlat10_4 = texture(_BlockGlitchMap, u_xlat2.xx);
					            u_xlat2.x = u_xlat10_4.x * 20.0;
					            u_xlat2.x = floor(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x + 66.5999985;
					            u_xlat2.x = floor(u_xlat2.x);
					            u_xlat24.x = sin(u_xlat2.x);
					            u_xlat2.z = u_xlat24.x * 43758.5469;
					            u_xlat2.x = u_xlat2.x + 1.0;
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x * 43758.5469;
					            u_xlat2.xz = fract(u_xlat2.xz);
					            u_xlat2.x = (-u_xlat2.z) + u_xlat2.x;
					            u_xlat2.x = u_xlat2.x * 0.599998474 + u_xlat2.z;
					            u_xlat2.x = u_xlat2.x + -0.5;
					            u_xlatb24.x = u_xlat0.x<abs(u_xlat2.x);
					            u_xlat2.x = (u_xlatb24.x) ? 0.0 : u_xlat2.x;
					            u_xlat24.x = u_xlat3.w + u_xlat3.w;
					            u_xlat24.x = u_xlat24.x / _BDepthY;
					            u_xlat11 = u_xlat11 * 0.769999981 + u_xlat24.x;
					            u_xlat10_4 = texture(_BlockGlitchMap, vec2(u_xlat11));
					            u_xlat11 = u_xlat10_4.x * 20.0;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat11 = u_xlat11 + 13.6999998;
					            u_xlat11 = floor(u_xlat11);
					            u_xlat24.x = sin(u_xlat11);
					            u_xlat24.x = u_xlat24.x * 43758.5469;
					            u_xlat24.x = fract(u_xlat24.x);
					            u_xlat11 = u_xlat11 + 1.0;
					            u_xlat11 = sin(u_xlat11);
					            u_xlat11 = u_xlat11 * 43758.5469;
					            u_xlat11 = fract(u_xlat11);
					            u_xlat11 = (-u_xlat24.x) + u_xlat11;
					            u_xlat11 = u_xlat11 * 0.699999809 + u_xlat24.x;
					            u_xlat11 = u_xlat11 + -0.5;
					            u_xlatb0 = u_xlat0.x<abs(u_xlat11);
					            u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat11;
					            u_xlatb24.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_AllowBGX, _AllowBGY, _AllowBGX, _AllowBGY)).xy;
					            u_xlat0.xy = u_xlat2.xx * u_xlat0.xx + u_xlat3.wz;
					            {
					                vec4 hlslcc_movcTemp = u_xlat3;
					                hlslcc_movcTemp.z = (u_xlatb24.y) ? u_xlat0.y : u_xlat3.z;
					                hlslcc_movcTemp.w = (u_xlatb24.x) ? u_xlat0.x : u_xlat3.w;
					                u_xlat3 = hlslcc_movcTemp;
					            }
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleGlitch);
					        if(u_xlatb0){
					            u_xlat0.x = u_xlat22 * _GlitchRedDistort;
					            u_xlat0.x = (u_xlatb33) ? u_xlat0.x : _GlitchRedDistort;
					            u_xlatb2.x = _ToggleRandomGlitch==1.0;
					            if(u_xlatb2.x){
					                u_xlatb2.x = _ToggleRandomSideGlitch==1.0;
					                u_xlat24.x = _GlitchSideFactor * _Time.w;
					                u_xlat24.x = sin(u_xlat24.x);
					                u_xlatb35 = u_xlat24.x>=0.0;
					                u_xlatb24.x = 0.5>=u_xlat24.x;
					                u_xlatb24.x = u_xlatb24.x && u_xlatb35;
					                u_xlat24.x = (u_xlatb24.x) ? (-u_xlat0.x) : u_xlat0.x;
					                u_xlat0.x = (u_xlatb2.x) ? u_xlat24.x : u_xlat0.x;
					                u_xlat2.x = _Time.x * 0.5;
					                u_xlat2.x = sin(u_xlat2.x);
					                u_xlat2.w = sin(_Time.w);
					                u_xlat2.xzw = u_xlat2.xxw * vec3(_YGAnimate, _XGAnimate, _TileGAnimate);
					                u_xlat4.xy = vec2(1.0, 1.0) / u_xlat2.xz;
					                u_xlat24.x = u_xlat2.w * u_xlat4.x;
					                u_xlat5.y = floor(u_xlat24.x);
					                u_xlat5.x = (-u_xlat2.x) * u_xlat5.y + u_xlat2.w;
					                u_xlat2.xz = u_xlat3.wz + u_xlat5.xy;
					                u_xlat2.xz = u_xlat4.xy * u_xlat2.xz;
					                u_xlat2.xz = u_xlat2.xz * _GlitchRedMap_ST.xy + _GlitchRedMap_ST.zw;
					                u_xlat10_4 = texture(_GlitchRedMap, u_xlat2.xz);
					                u_xlat11 = u_xlat10_4.x;
					            } else {
					                u_xlat4.x = float(1.0) / _RedYGlitch;
					                u_xlat4.y = float(1.0) / _RedXGlitch;
					                u_xlat2.x = u_xlat4.x * _RedTileGlitch;
					                u_xlat5.y = floor(u_xlat2.x);
					                u_xlat5.x = (-_RedYGlitch) * u_xlat5.y + _RedTileGlitch;
					                u_xlat2.xz = u_xlat3.wz + u_xlat5.xy;
					                u_xlat2.xz = u_xlat4.xy * u_xlat2.xz;
					                u_xlat2.xz = u_xlat2.xz * _GlitchRedMap_ST.xy + _GlitchRedMap_ST.zw;
					                u_xlat10_4 = texture(_GlitchRedMap, u_xlat2.xz);
					                u_xlat11 = u_xlat10_4.x;
					            //ENDIF
					            }
					            u_xlat3.zw = vec2(u_xlat11) * u_xlat0.xx + u_xlat3.zw;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRipple);
					        if(u_xlatb0){
					            u_xlat2.xzw = vec3(u_xlat22) * vec3(_ShockDis, _ShockMag, _ShockSpread);
					            u_xlat2.xzw = (bool(u_xlatb33)) ? u_xlat2.xzw : vec3(_ShockDis, _ShockMag, _ShockSpread);
					            u_xlat0.x = _ShockCenterX / _ScreenParams.x;
					            u_xlat0.y = _ShockCenterY / _ScreenParams.y;
					            u_xlat4.xy = (-u_xlat3.wz) + u_xlat0.xy;
					            u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
					            u_xlat4.x = sqrt(u_xlat4.x);
					            u_xlat35 = u_xlat2.w * _ScreenParams.x;
					            u_xlat35 = u_xlat35 / _ScreenParams.y;
					            u_xlat35 = (-u_xlat2.z) + u_xlat35;
					            u_xlat15 = (-u_xlat2.z) + 1.0;
					            u_xlat35 = u_xlat35 / u_xlat15;
					            u_xlat15 = u_xlat2.z + u_xlat35;
					            u_xlatb15 = u_xlat15>=u_xlat4.x;
					            u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					            u_xlat24.x = (-u_xlat2.z) + u_xlat35;
					            u_xlatb24.x = u_xlat24.x<u_xlat4.x;
					            u_xlat24.x = u_xlatb24.x ? 1.0 : float(0.0);
					            u_xlat0.xy = (-u_xlat0.xy) + u_xlat3.wz;
					            u_xlat26.x = dot(u_xlat0.xy, u_xlat0.xy);
					            u_xlat26.x = inversesqrt(u_xlat26.x);
					            u_xlat0.xy = u_xlat0.xy * u_xlat26.xx;
					            u_xlat35 = (-u_xlat35) + u_xlat4.x;
					            u_xlat24.x = u_xlat24.x * u_xlat15;
					            u_xlatb24.x = 0.0>=u_xlat24.x;
					            u_xlat2.x = u_xlat2.x * u_xlat35;
					            u_xlat2.x = log2(abs(u_xlat2.x));
					            u_xlat2.x = u_xlat2.x * 0.800000012;
					            u_xlat2.x = exp2(u_xlat2.x);
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat2.x = u_xlat35 * u_xlat2.x;
					            u_xlat0.xy = u_xlat0.xy * u_xlat2.xx + u_xlat3.wz;
					            u_xlat3.zw = (u_xlatb24.x) ? u_xlat3.zw : u_xlat0.yx;
					        //ENDIF
					        }
					        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVHS);
					        if(u_xlatb0){
					            u_xlat2.xz = u_xlat3.wz + vec2(-0.5, -0.5);
					            u_xlat4.xy = u_xlat2.xz * vec2(1.20000005, 1.20000005);
					            u_xlat2.xz = u_xlat2.xz * u_xlat2.xz;
					            u_xlat11 = dot(u_xlat2.zz, u_xlat2.xx);
					            u_xlat11 = u_xlat11 + 0.833333313;
					            u_xlat2.xz = u_xlat4.xy * vec2(u_xlat11) + vec2(0.5, 0.5);
					            u_xlat4.xy = _Time.yy * vec2(0.25, 80.0);
					            u_xlatb11 = u_xlat4.x>=(-u_xlat4.x);
					            u_xlat35 = fract(abs(u_xlat4.x));
					            u_xlat11 = (u_xlatb11) ? u_xlat35 : (-u_xlat35);
					            u_xlat11 = (-u_xlat11) + u_xlat2.z;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat11 = u_xlat11 * 20.0 + 1.0;
					            u_xlat11 = float(1.0) / u_xlat11;
					            u_xlat11 = u_xlat11 + _waveyness;
					            u_xlatb35 = _ToggleSmoothWave==0.0;
					            u_xlat4.x = u_xlat2.z * 10.0 + _Time.y;
					            u_xlat4.x = sin(u_xlat4.x);
					            u_xlat4.x = u_xlat4.x * _VHSXDisplacement.x;
					            u_xlat4.x = u_xlat4.x * 0.0199999996;
					            u_xlat15 = cos(u_xlat4.y);
					            u_xlat15 = u_xlat15 + 1.0;
					            u_xlat4.x = u_xlat15 * u_xlat4.x;
					            u_xlat4.x = u_xlat4.x * u_xlat11 + u_xlat2.x;
					            u_xlat15 = u_xlat2.z + _Time.y;
					            u_xlat15 = sin(u_xlat15);
					            u_xlat15 = u_xlat15 * _VHSXDisplacement.x;
					            u_xlat5.x = sin(_Time.y);
					            u_xlat6.x = cos(_Time.y);
					            u_xlat15 = u_xlat15 * u_xlat6.x;
					            u_xlat11 = u_xlat15 * u_xlat11 + u_xlat2.x;
					            u_xlat3.w = (u_xlatb35) ? u_xlat4.x : u_xlat11;
					            u_xlat11 = _VHSYDisplacement.x * 0.400000006;
					            u_xlat2.x = u_xlat5.x * u_xlat6.x + u_xlat5.x;
					            u_xlat11 = u_xlat11 * u_xlat2.x + u_xlat2.z;
					            u_xlatb2.x = u_xlat11>=(-u_xlat11);
					            u_xlat11 = fract(abs(u_xlat11));
					            u_xlat3.z = (u_xlatb2.x) ? u_xlat11 : (-u_xlat11);
					        //ENDIF
					        }
					        u_xlat4 = texture(_LukaFirstPass, u_xlat3.wz);
					        u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassOneToggle);
					        if(u_xlatb11){
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleFadeProjection);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _FPZoom;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _FPZoom;
					                u_xlat2.xz = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.xz = u_xlat2.xz / vec2(u_xlat11);
					                u_xlat2.xz = u_xlat2.xz + vec2(0.5, 0.5);
					                u_xlat10_5 = texture(_LukaFirstPass, u_xlat2.xz);
					                u_xlat5 = (-u_xlat4) + u_xlat10_5;
					                u_xlat5 = vec4(vec4(_FPFade, _FPFade, _FPFade, _FPFade)) * u_xlat5 + u_xlat4;
					            } else {
					                u_xlat5 = u_xlat4;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGBZoom);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat6.x = u_xlat22 * _RedZoom;
					                u_xlat6.yz = vec2(u_xlat22) * vec2(_GreenZoom, _BlueZoom);
					                u_xlat7.x = _RedZoom;
					                u_xlat7.yz = vec2(_GreenZoom, _BlueZoom);
					                u_xlat2.xzw = (bool(u_xlatb11)) ? u_xlat6.xyz : u_xlat7.xyz;
					                u_xlat6.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat7 = u_xlat6.xyxy / u_xlat2.xxzz;
					                u_xlat7 = u_xlat7 + vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat2.xz = u_xlat6.xy / u_xlat2.ww;
					                u_xlat2.xz = u_xlat2.xz + vec2(0.5, 0.5);
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat7.xy);
					                u_xlat10_7 = texture(_LukaFirstPass, u_xlat7.zw);
					                u_xlat10_8 = texture(_LukaFirstPass, u_xlat2.xz);
					                u_xlat4.x = u_xlat10_6.x;
					                u_xlat4.y = u_xlat10_7.x;
					                u_xlat4.z = u_xlat10_8.x;
					                u_xlat6 = (-u_xlat5) + u_xlat4;
					                u_xlat5 = vec4(vec4(_RGBZoomTrans, _RGBZoomTrans, _RGBZoomTrans, _RGBZoomTrans)) * u_xlat6 + u_xlat5;
					            //ENDIF
					            }
					            u_xlatb2.xz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleProjection, _ToggleProjection, _TogglePosterize, _ToggleProjection)).xz;
					            if(u_xlatb2.x){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _ProjectionStrength;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _ProjectionStrength;
					                u_xlat2.x = sin(_ProjectionDirection);
					                u_xlat6.x = cos(_ProjectionDirection);
					                u_xlat7.x = sin((-_ProjectionDirection));
					                u_xlat7.y = u_xlat6.x;
					                u_xlat7.z = u_xlat2.x;
					                u_xlat2.x = dot(vec2(0.707106769, 0.707106769), u_xlat7.yz);
					                u_xlat35 = dot(vec2(0.707106769, 0.707106769), u_xlat7.xy);
					                u_xlatb6.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ProjectionAdv);
					                u_xlat7 = u_xlat5;
					                u_xlati17 = 0;
					                while(true){
					                    u_xlat28.x = float(u_xlati17);
					                    u_xlatb39 = u_xlat28.x>=_ProjectionCopies;
					                    if(u_xlatb39){break;}
					                    u_xlat28.x = u_xlat11 * u_xlat28.x;
					                    u_xlat28.xy = u_xlat28.xx / _ScreenParams.xy;
					                    u_xlat8.x = u_xlat28.x * u_xlat2.x + u_xlat3.w;
					                    u_xlat8.y = u_xlat28.y * u_xlat35 + u_xlat3.z;
					                    u_xlat28.xy = u_xlat3.wz + u_xlat28.xy;
					                    u_xlat28.xy = u_xlat28.xy + vec2(_ProjAdvX, _ProjAdvY);
					                    u_xlat28.xy = u_xlat28.xy / vec2(_ProjScaleX, _ProjScaleY);
					                    u_xlat28.xy = (u_xlatb6.x) ? u_xlat28.xy : u_xlat8.xy;
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat28.xy);
					                    u_xlat16_8 = (-u_xlat10_1) + u_xlat10_8;
					                    u_xlat8 = vec4(vec4(_ProjectionFade, _ProjectionFade, _ProjectionFade, _ProjectionFade)) * u_xlat16_8 + u_xlat10_1;
					                    u_xlat7 = u_xlat7 + u_xlat8;
					                    u_xlati17 = u_xlati17 + 1;
					                }
					                u_xlat11 = _ProjectionCopies + _ProjectionBright;
					                u_xlat11 = u_xlat11 + 1.0;
					                u_xlat5 = u_xlat7 / vec4(u_xlat11);
					            //ENDIF
					            }
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleFisheye, _ToggleFisheye, _ToggleFisheye, _ToggleED)).xw;
					            if(u_xlatb2.x){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _FisheyeSize;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _FisheyeSize;
					                u_xlat6.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.x = dot(u_xlat6.xy, u_xlat6.xy);
					                u_xlat6.xy = u_xlat2.xx * u_xlat6.xy;
					                u_xlat7 = u_xlat5;
					                u_xlat2.x = 0.0;
					                for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					                {
					                    u_xlat8.xy = u_xlat2.xx * u_xlat6.xy;
					                    u_xlat8.xy = u_xlat8.xy * vec2(u_xlat11) + u_xlat3.wz;
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat8.xy);
					                    u_xlat7 = u_xlat7 + u_xlat10_8;
					                    u_xlat2.x = u_xlat2.x + 0.100000001;
					                }
					                u_xlat5 = u_xlat7 * vec4(0.0833333358, 0.0833333358, 0.0833333358, 0.0833333358);
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSmear);
					            if(u_xlatb11){
					                u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CSAutoRotate);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_CSUseAdvanced);
					                u_xlat6.xy = (u_xlatb2.x) ? vec2(_CSRotateSpeedCosXR, _CSRotateSpeedSinYR) : vec2(vec4(_CSRotateSpeed, _CSRotateSpeed, _CSRotateSpeed, _CSRotateSpeed));
					                u_xlat6.xy = u_xlat6.xy * _Time.xx;
					                u_xlat2.x = cos(u_xlat6.x);
					                u_xlat6.x = sin(u_xlat6.y);
					                u_xlat17.x = _CSDirection * _CSDirection;
					                u_xlat17.x = inversesqrt(u_xlat17.x);
					                u_xlat17.x = u_xlat17.x * _CSDirection;
					                u_xlat6.x = u_xlat6.x * u_xlat17.x;
					                u_xlat2.x = u_xlat2.x * u_xlat17.x;
					                u_xlat17.xy = vec2(_CSGreen, _CSBlue) + vec2(2.09439516, 4.18879032);
					                u_xlat7.x = sin(_CSDirection);
					                u_xlat8.x = cos(_CSDirection);
					                u_xlat9.x = sin((-_CSDirection));
					                u_xlat10.x = _CSDirection;
					                u_xlat10.y = 1.0;
					                u_xlat39 = dot(u_xlat10.xy, u_xlat10.xy);
					                u_xlat39 = inversesqrt(u_xlat39);
					                u_xlat18.xy = vec2(u_xlat39) * u_xlat10.xy;
					                u_xlat9.y = u_xlat8.x;
					                u_xlat9.z = u_xlat7.x;
					                u_xlat39 = dot(u_xlat18.xy, u_xlat9.yz);
					                u_xlat7.x = dot(u_xlat18.xy, u_xlat9.xy);
					                u_xlat18.x = float(0.0);
					                u_xlat18.y = float(0.0);
					                u_xlat18.z = float(0.0);
					                u_xlat8.x = float(-1e+10);
					                u_xlat8.y = float(10.0);
					                for(int u_xlati_loop_2 = int(0) ; u_xlati_loop_2<30 ; u_xlati_loop_2++)
					                {
					                    if(u_xlatb11){
					                        u_xlat9.y = float(u_xlati_loop_2);
					                        u_xlat31.xy = u_xlat9.yy / _ScreenParams.xy;
					                        u_xlat10.x = u_xlat31.x * u_xlat6.x + u_xlat3.w;
					                        u_xlat10.y = u_xlat31.y * u_xlat2.x + u_xlat3.z;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat10.xy);
					                        u_xlat41 = u_xlat17.x * u_xlat10_10.y;
					                        u_xlat41 = u_xlat10_10.x * _CSRed + u_xlat41;
					                        u_xlat41 = u_xlat10_10.z * u_xlat17.y + u_xlat41;
					                        u_xlat9.x = (-u_xlat9.y) * 0.00999999978 + u_xlat41;
					                        u_xlatb41 = u_xlat8.x<u_xlat9.x;
					                        u_xlat18.xyz = (bool(u_xlatb41)) ? u_xlat10_10.xyz : u_xlat18.xyz;
					                        u_xlat8.xy = (bool(u_xlatb41)) ? u_xlat9.xy : u_xlat8.xy;
					                    } else {
					                        u_xlat9.y = float(u_xlati_loop_2);
					                        u_xlat31.xy = u_xlat9.yy / _ScreenParams.xy;
					                        u_xlat10.x = u_xlat31.x * u_xlat39 + u_xlat3.w;
					                        u_xlat10.y = u_xlat31.y * u_xlat7.x + u_xlat3.z;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat10.xy);
					                        u_xlat41 = u_xlat17.x * u_xlat10_10.y;
					                        u_xlat41 = u_xlat10_10.x * _CSRed + u_xlat41;
					                        u_xlat41 = u_xlat10_10.z * u_xlat17.y + u_xlat41;
					                        u_xlat9.x = (-u_xlat9.y) * 0.00999999978 + u_xlat41;
					                        u_xlatb41 = u_xlat8.x<u_xlat9.x;
					                        u_xlat18.xyz = (bool(u_xlatb41)) ? u_xlat10_10.xyz : u_xlat18.xyz;
					                        u_xlat8.xy = (bool(u_xlatb41)) ? u_xlat9.xy : u_xlat8.xy;
					                    //ENDIF
					                    }
					                }
					                u_xlat11 = u_xlat8.y * 0.0333333351;
					                u_xlat2.x = (-u_xlat8.y) * 0.0333333351 + 1.0;
					                u_xlat6.xyz = u_xlat18.xyz * u_xlat2.xxx;
					                u_xlat6.xyz = vec3(u_xlat11) * u_xlat5.xyz + u_xlat6.xyz;
					                u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleCSColor);
					                u_xlat6.w = 1.0;
					                u_xlat7 = u_xlat6 * _CSColorTint;
					                u_xlat5 = (bool(u_xlatb11)) ? u_xlat7 : u_xlat6;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRadialBlur);
					            if(u_xlatb11){
					                u_xlatb11 = _AllowScalarFalloff==1.0;
					                u_xlatb11 = u_xlatb11 && u_xlatb33;
					                u_xlat2.x = u_xlat22 * _RadialBlurDistance;
					                u_xlat11 = (u_xlatb11) ? u_xlat2.x : _RadialBlurDistance;
					                u_xlat6.xy = u_xlat3.wz + (-vec2(_RadialBlurHorizontalCenter, _RadialBlurVerticalCenter));
					                u_xlat2.x = dot(u_xlat6.xy, u_xlat6.xy);
					                u_xlat2.x = sqrt(u_xlat2.x);
					                u_xlat2.x = u_xlat2.x / _RadialBlurCenterRadius;
					                u_xlat7 = u_xlat5;
					                for(int u_xlati_loop_3 = 0 ; u_xlati_loop_3<24 ; u_xlati_loop_3++)
					                {
					                    u_xlat39 = float(u_xlati_loop_3);
					                    u_xlat39 = u_xlat11 * u_xlat39;
					                    u_xlat39 = u_xlat2.x * u_xlat39;
					                    u_xlat39 = (-u_xlat39) * 0.0416666679 + 1.0;
					                    u_xlat8.xy = u_xlat6.xy * vec2(u_xlat39) + vec2(_RadialBlurHorizontalCenter, _RadialBlurVerticalCenter);
					                    u_xlat10_8 = texture(_LukaFirstPass, u_xlat8.xy);
					                    u_xlat7 = u_xlat7 + u_xlat10_8;
					                }
					                u_xlat5 = u_xlat7 * vec4(0.0416666679, 0.0416666679, 0.0416666679, 0.0416666679);
					            //ENDIF
					            }
					            if(u_xlatb2.w){
					                u_xlat11 = u_xlat22 * _EDIntensity;
					                u_xlat11 = (u_xlatb13.x) ? u_xlat11 : _EDIntensity;
					                u_xlat2.x = float(0.0);
					                u_xlat2.w = float(0.0);
					                for(int u_xlati_loop_4 = 0 ; u_xlati_loop_4<3 ; u_xlati_loop_4++)
					                {
					                    u_xlat17.x = float(u_xlati_loop_4);
					                    u_xlat7.x = u_xlat17.x + _EDXOffset;
					                    u_xlat8.x = dot(vec3(-1.0, -2.0, -1.0), ImmCB_0_0_0[u_xlati_loop_4].xyz);
					                    u_xlat8.y = dot(vec3(1.0, 2.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xyz);
					                    u_xlat9.x = dot(vec2(-1.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat9.y = dot(vec2(-2.0, 2.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat9.z = dot(vec2(-1.0, 1.0), ImmCB_0_0_0[u_xlati_loop_4].xz);
					                    u_xlat17.xy = u_xlat2.xw;
					                    for(int u_xlati_loop_5 = 0 ; u_xlati_loop_5<3 ; u_xlati_loop_5++)
					                    {
					                        u_xlat29.x = float(u_xlati_loop_5);
					                        u_xlat7.y = u_xlat29.x + _EDYOffset;
					                        u_xlat18.xy = u_xlat7.xy / _ScreenParams.xy;
					                        u_xlat18.xy = u_xlat3.wz + u_xlat18.xy;
					                        u_xlat10_10 = texture(_LukaFirstPass, u_xlat18.xy);
					                        u_xlat18.x = dot(u_xlat10_10, vec4(_EDTolerance, _EDTolerance, _EDTolerance, _EDTolerance));
					                        u_xlat29.x = dot(u_xlat8.xy, ImmCB_0_0_0[u_xlati_loop_5].xz);
					                        u_xlat17.x = u_xlat18.x * u_xlat29.x + u_xlat17.x;
					                        u_xlat29.x = dot(u_xlat9.xyz, ImmCB_0_0_0[u_xlati_loop_5].xyz);
					                        u_xlat17.y = u_xlat18.x * u_xlat29.x + u_xlat17.y;
					                    }
					                    u_xlat2.xw = u_xlat17.xy;
					                }
					                u_xlat2.xw = u_xlat2.xw * u_xlat2.xw;
					                u_xlat2.xw = vec2(u_xlat11) * u_xlat2.xw;
					                u_xlat11 = u_xlat2.w + u_xlat2.x;
					                u_xlat11 = sqrt(u_xlat11);
					                u_xlat6 = vec4(vec4(_EDGlow, _EDGlow, _EDGlow, _EDGlow)) * _EDColor;
					                u_xlat11 = (-u_xlat11) + 1.0;
					                u_xlat7 = (-_EDColor) * vec4(vec4(_EDGlow, _EDGlow, _EDGlow, _EDGlow)) + u_xlat5;
					                u_xlat6 = vec4(u_xlat11) * u_xlat7 + u_xlat6;
					                u_xlat6 = (-u_xlat5) + u_xlat6;
					                u_xlat5 = vec4(vec4(_EDTrans, _EDTrans, _EDTrans, _EDTrans)) * u_xlat6 + u_xlat5;
					            //ENDIF
					            }
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleInvert, _ToggleInvert, _ToggleInvert, _ToggleSepia)).xw;
					            u_xlat6.xyz = u_xlat5.xyz * vec3(-2.0, -2.0, -2.0) + vec3(vec3(_InvertStrength, _InvertStrength, _InvertStrength));
					            u_xlat6.xyz = vec3(vec3(_InvertStrength, _InvertStrength, _InvertStrength)) * u_xlat6.xyz + u_xlat5.xyz;
					            u_xlat6.xyz = (u_xlatb2.x) ? u_xlat6.xyz : u_xlat5.xyz;
					            u_xlatb7.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleSaturation, _ToggleGammaCorrect, _ToggleSaturation, _ToggleSaturation)).xy;
					            u_xlatb11 = u_xlat6.y>=u_xlat6.z;
					            u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
					            u_xlat8.xy = u_xlat6.zy;
					            u_xlat8.z = float(-1.0);
					            u_xlat8.w = float(0.666666687);
					            u_xlat9.xy = u_xlat6.yz + (-u_xlat8.xy);
					            u_xlat9.z = float(1.0);
					            u_xlat9.w = float(-1.0);
					            u_xlat8 = vec4(u_xlat11) * u_xlat9 + u_xlat8;
					            u_xlatb11 = u_xlat6.x>=u_xlat8.x;
					            u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
					            u_xlat9.xyz = u_xlat8.xyw;
					            u_xlat9.w = u_xlat6.x;
					            u_xlat8.xyw = u_xlat9.wyx;
					            u_xlat8 = (-u_xlat9) + u_xlat8;
					            u_xlat8 = vec4(u_xlat11) * u_xlat8 + u_xlat9;
					            u_xlat11 = min(u_xlat8.y, u_xlat8.w);
					            u_xlat11 = (-u_xlat11) + u_xlat8.x;
					            u_xlat2.x = (-u_xlat8.y) + u_xlat8.w;
					            u_xlat39 = u_xlat11 * 6.0 + 1.00000001e-10;
					            u_xlat2.x = u_xlat2.x / u_xlat39;
					            u_xlat2.x = u_xlat2.x + u_xlat8.z;
					            u_xlat39 = u_xlat8.x + 1.00000001e-10;
					            u_xlat11 = u_xlat11 / u_xlat39;
					            u_xlat19.xyz = abs(u_xlat2.xxx) + vec3(0.0, -0.333333343, 0.333333343);
					            u_xlat19.xyz = fract(u_xlat19.xyz);
					            u_xlat19.xyz = (-u_xlat19.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					            u_xlat19.xyz = abs(u_xlat19.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					            u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
					            u_xlat11 = u_xlat11 * _SaturationValue;
					            u_xlat19.xyz = u_xlat19.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat19.xyz = vec3(u_xlat11) * u_xlat19.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xxx * u_xlat19.xyz;
					            u_xlat6.xyz = (u_xlatb7.x) ? u_xlat8.xyz : u_xlat6.xyz;
					            u_xlat11 = (-_GammaRed) + 1.0;
					            u_xlat8.x = float(1.0) / u_xlat11;
					            u_xlat7.xz = (-vec2(_GammaGreen, _GammaBlue)) + vec2(1.0, 1.0);
					            u_xlat8.yz = vec2(1.0, 1.0) / u_xlat7.xz;
					            u_xlat7.xzw = log2(u_xlat6.xyz);
					            u_xlat7.xzw = u_xlat7.xzw * u_xlat8.xyz;
					            u_xlat7.xzw = exp2(u_xlat7.xzw);
					            u_xlat6.xyz = (u_xlatb7.y) ? u_xlat7.xzw : u_xlat6.xyz;
					            u_xlat11 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					            u_xlat7.xyz = (-u_xlat6.xyz) + vec3(u_xlat11);
					            u_xlat7.xyz = vec3(_SepiaStrength) * u_xlat7.xyz + u_xlat6.xyz;
					            u_xlat6.xyz = (u_xlatb2.w) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleColorTint);
					            u_xlatb2.x = _ToggleRGBTint==1.0;
					            u_xlat7.xyz = u_xlat6.xyz * _ColorRGB.xyz;
					            u_xlat8.xyz = vec3(vec3(_ColorHue, _ColorHue, _ColorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					            u_xlat8.xyz = fract(u_xlat8.xyz);
					            u_xlat8.xyz = (-u_xlat8.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = abs(u_xlat8.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					            u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat8.xyz = vec3(vec3(_ColorSaturation, _ColorSaturation, _ColorSaturation)) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat8.xyz = u_xlat8.xyz * vec3(_ColorValue) + u_xlat6.xyz;
					            u_xlat7.xyz = (u_xlatb2.x) ? u_xlat7.xyz : u_xlat8.xyz;
					            u_xlat6.xyz = (bool(u_xlatb11)) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDarken);
					            u_xlat2.x = u_xlat22 * _DarknessStrength;
					            u_xlat2.x = (u_xlatb13.x) ? u_xlat2.x : _DarknessStrength;
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlat7.xyz = u_xlat2.xxx * u_xlat6.xyz;
					            u_xlat5.xyz = (bool(u_xlatb11)) ? u_xlat7.xyz : u_xlat6.xyz;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRecolor);
					            if(u_xlatb11){
					                u_xlatb11 = _ToggleRecolorAnimate==0.0;
					                u_xlatb2.x = u_xlat5.y>=u_xlat5.z;
					                u_xlat2.x = u_xlatb2.x ? 1.0 : float(0.0);
					                u_xlat6.xy = u_xlat5.zy;
					                u_xlat6.z = float(-1.0);
					                u_xlat6.w = float(0.666666687);
					                u_xlat7.xy = u_xlat5.yz + (-u_xlat6.xy);
					                u_xlat7.z = float(1.0);
					                u_xlat7.w = float(-1.0);
					                u_xlat6 = u_xlat2.xxxx * u_xlat7 + u_xlat6;
					                u_xlatb2.x = u_xlat5.x>=u_xlat6.x;
					                u_xlat2.x = u_xlatb2.x ? 1.0 : float(0.0);
					                u_xlat7.xyz = u_xlat6.xyw;
					                u_xlat7.w = u_xlat5.x;
					                u_xlat6.xyw = u_xlat7.wyx;
					                u_xlat6 = (-u_xlat7) + u_xlat6;
					                u_xlat6 = u_xlat2.xxxx * u_xlat6 + u_xlat7;
					                u_xlat2.x = min(u_xlat6.y, u_xlat6.w);
					                u_xlat2.x = (-u_xlat2.x) + u_xlat6.x;
					                u_xlat35 = (-u_xlat6.y) + u_xlat6.w;
					                u_xlat17.x = u_xlat2.x * 6.0 + 1.00000001e-10;
					                u_xlat35 = u_xlat35 / u_xlat17.x;
					                u_xlat35 = u_xlat35 + u_xlat6.z;
					                u_xlat17.x = u_xlat6.x + 1.00000001e-10;
					                u_xlat2.x = u_xlat2.x / u_xlat17.x;
					                u_xlat17.xyz = abs(vec3(u_xlat35)) * vec3(vec3(_RecolorHue, _RecolorHue, _RecolorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					                u_xlat17.xyz = fract(u_xlat17.xyz);
					                u_xlat17.xyz = (-u_xlat17.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					                u_xlat17.xyz = abs(u_xlat17.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					                u_xlat17.xyz = clamp(u_xlat17.xyz, 0.0, 1.0);
					                u_xlat2.x = u_xlat2.x * _RecolorSat;
					                u_xlat17.xyz = u_xlat17.xyz + vec3(-1.0, -1.0, -1.0);
					                u_xlat17.xyz = u_xlat2.xxx * u_xlat17.xyz + vec3(1.0, 1.0, 1.0);
					                u_xlat6.x = u_xlat6.x * _RecolorBright;
					                u_xlat17.xyz = u_xlat6.xxx * u_xlat17.xyz;
					                u_xlat7.x = _RecolorSpeed * _SinTime.x;
					                u_xlat35 = abs(u_xlat35) * u_xlat7.x;
					                u_xlat7.xyz = vec3(u_xlat35) * vec3(vec3(_RecolorHue, _RecolorHue, _RecolorHue)) + vec3(0.0, -0.333333343, 0.333333343);
					                u_xlat7.xyz = fract(u_xlat7.xyz);
					                u_xlat7.xyz = (-u_xlat7.xyz) * vec3(2.0, 2.0, 2.0) + vec3(1.0, 1.0, 1.0);
					                u_xlat7.xyz = abs(u_xlat7.xyz) * vec3(3.0, 3.0, 3.0) + vec3(-1.0, -1.0, -1.0);
					                u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
					                u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
					                u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
					                u_xlat7.xyz = u_xlat6.xxx * u_xlat7.xyz;
					                u_xlat5.xyz = (bool(u_xlatb11)) ? u_xlat17.xyz : u_xlat7.xyz;
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBloom);
					            u_xlatb2.x = _AllowScalarFalloff==1.0;
					            u_xlatb2.x = u_xlatb33 && u_xlatb2.x;
					            u_xlat35 = u_xlat22 * _BloomGlow;
					            u_xlat35 = (u_xlatb2.x) ? u_xlat35 : _BloomGlow;
					            u_xlat6 = vec4(u_xlat35) * u_xlat5;
					            u_xlat6 = u_xlat6 * _BloomColorRGB;
					            u_xlat5 = (bool(u_xlatb11)) ? u_xlat6.xwyz : u_xlat5.xwyz;
					            u_xlat11 = _PosterizeValue + 100.0;
					            u_xlat11 = u_xlat22 * u_xlat11 + -100.0;
					            u_xlat11 = (u_xlatb13.x) ? u_xlat11 : _PosterizeValue;
					            u_xlat6.xyz = vec3(u_xlat11) * u_xlat5.xzw;
					            u_xlat6.xyz = floor(u_xlat6.xyz);
					            u_xlat11 = u_xlat11 + -1.0;
					            u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat11);
					            u_xlat6.xyz = (u_xlatb2.z) ? u_xlat6.xyz : u_xlat5.xzw;
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDeepfry);
					            if(u_xlatb11){
					                u_xlatb11 = _DeepfryValue==1.0;
					                if(u_xlatb11){
					                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                    u_xlat11 = (-_Time.w) + 1.0;
					                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                    u_xlat6.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat7.xyz;
					                } else {
					                    u_xlatb11 = _DeepfryValue==2.0;
					                    if(u_xlatb11){
					                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                        u_xlat11 = (-_Time.w) + 1.0;
					                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                        u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                        u_xlat6.xyz = u_xlat7.xyz * _Time.xyz + u_xlat13.xyz;
					                    } else {
					                        u_xlatb11 = _DeepfryValue==3.0;
					                        if(u_xlatb11){
					                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                            u_xlat13.xyz = sin(u_xlat13.xyz);
					                            u_xlat11 = (-_Time.w) + 1.0;
					                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                            u_xlat6.xyz = cos(u_xlat13.xyz);
					                        } else {
					                            u_xlatb11 = _DeepfryValue==4.0;
					                            if(u_xlatb11){
					                                u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                u_xlat11 = (-_Time.w) + 1.0;
					                                u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                u_xlat6.xyz = cos(u_xlat13.xyz);
					                            } else {
					                                u_xlatb11 = _DeepfryValue==5.0;
					                                if(u_xlatb11){
					                                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                    u_xlat13.xyz = cos(u_xlat13.xyz);
					                                    u_xlat11 = (-_Time.w) + 1.0;
					                                    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                    u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                    u_xlat13.xyz = sin(u_xlat13.xyz);
					                                    u_xlat7.xyz = sin(u_xlat13.xyz);
					                                    u_xlat8.xyz = cos(u_xlat13.xyz);
					                                    u_xlat6.xyz = u_xlat7.xyz / u_xlat8.xyz;
					                                } else {
					                                    u_xlatb11 = _DeepfryValue==6.0;
					                                    if(u_xlatb11){
					                                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                        u_xlat11 = (-_Time.w) + 1.0;
					                                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                        u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                        u_xlat7.xyz = -abs(u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                        u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                        u_xlat8.xyz = abs(u_xlat13.xyz) * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                        u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                        u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(1.57072878, 1.57072878, 1.57072878);
					                                        u_xlat9.xyz = u_xlat7.xyz * u_xlat8.xyz;
					                                        u_xlat9.xyz = u_xlat9.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.14159274, 3.14159274, 3.14159274);
					                                        u_xlatb13.xyz = lessThan(u_xlat13.xyzz, (-u_xlat13.xyzz)).xyz;
					                                        u_xlat13.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat9.xyz, vec3(u_xlatb13.xyz));
					                                        u_xlat6.xyz = u_xlat8.xyz * u_xlat7.xyz + u_xlat13.xyz;
					                                    } else {
					                                        u_xlatb11 = _DeepfryValue==7.0;
					                                        if(u_xlatb11){
					                                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                            u_xlat11 = (-_Time.w) + 1.0;
					                                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                            u_xlat13.xyz = cos(u_xlat13.xyz);
					                                            u_xlat7.xyz = -abs(u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                            u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                            u_xlat8.xyz = abs(u_xlat13.xyz) * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                            u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                            u_xlat8.xyz = u_xlat8.xyz * abs(u_xlat13.xyz) + vec3(1.57072878, 1.57072878, 1.57072878);
					                                            u_xlat9.xyz = u_xlat7.xyz * u_xlat8.xyz;
					                                            u_xlat9.xyz = u_xlat9.xyz * vec3(-2.0, -2.0, -2.0) + vec3(3.14159274, 3.14159274, 3.14159274);
					                                            u_xlatb13.xyz = lessThan(u_xlat13.xyzz, (-u_xlat13.xyzz)).xyz;
					                                            u_xlat13.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat9.xyz, vec3(u_xlatb13.xyz));
					                                            u_xlat6.xyz = u_xlat8.xyz * u_xlat7.xyz + u_xlat13.xyz;
					                                        } else {
					                                            u_xlatb11 = _DeepfryValue==8.0;
					                                            if(u_xlatb11){
					                                                u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                u_xlat7.xyz = sin(u_xlat13.xyz);
					                                                u_xlat8.xyz = cos(u_xlat13.xyz);
					                                                u_xlat13.xyz = u_xlat7.xyz / u_xlat8.xyz;
					                                                u_xlat11 = (-_Time.w) + 1.0;
					                                                u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                u_xlat13.xyz = sin(u_xlat13.xyz);
					                                                u_xlat13.xyz = cos(u_xlat13.xyz);
					                                                u_xlat7.xyz = (-u_xlat13.xyz) + vec3(1.0, 1.0, 1.0);
					                                                u_xlat7.xyz = sqrt(u_xlat7.xyz);
					                                                u_xlat8.xyz = u_xlat13.xyz * vec3(-0.0187292993, -0.0187292993, -0.0187292993) + vec3(0.0742610022, 0.0742610022, 0.0742610022);
					                                                u_xlat8.xyz = u_xlat8.xyz * u_xlat13.xyz + vec3(-0.212114394, -0.212114394, -0.212114394);
					                                                u_xlat13.xyz = u_xlat8.xyz * u_xlat13.xyz + vec3(1.57072878, 1.57072878, 1.57072878);
					                                                u_xlat6.xyz = u_xlat7.xyz * u_xlat13.xyz;
					                                            } else {
					                                                u_xlatb11 = _DeepfryValue==9.0;
					                                                if(u_xlatb11){
					                                                    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                    u_xlat11 = (-_Time.w) + 1.0;
					                                                    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                    u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                    u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                    u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					                                                    u_xlat7.xyz = exp2(u_xlat13.xyz);
					                                                    u_xlat13.xyz = exp2((-u_xlat13.xyz));
					                                                    u_xlat8.xyz = (-u_xlat13.xyz) + u_xlat7.xyz;
					                                                    u_xlat13.xyz = u_xlat13.xyz + u_xlat7.xyz;
					                                                    u_xlat13.xyz = vec3(1.0, 1.0, 1.0) / u_xlat13.xyz;
					                                                    u_xlat6.xyz = u_xlat13.xyz * u_xlat8.xyz;
					                                                } else {
					                                                    u_xlatb11 = _DeepfryValue==10.0;
					                                                    if(u_xlatb11){
					                                                        u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                        u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                        u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                                                        u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat7.xyz;
					                                                        u_xlat6.xyz = u_xlat13.xyz * vec3(-2.40299797, -2.40299797, -2.40299797);
					                                                    } else {
					                                                        u_xlatb11 = _DeepfryValue==11.0;
					                                                        if(u_xlatb11){
					                                                            u_xlat13.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                            u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat11) + u_xlat6.xyz;
					                                                            u_xlat7.xyz = u_xlat6.xyz * _Time.www;
					                                                            u_xlat13.xyz = u_xlat7.xyz * vec3(vec3(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
					                                                            u_xlat7.xyz = exp2(u_xlat13.xyz);
					                                                            u_xlat13.xyz = exp2((-u_xlat13.xyz));
					                                                            u_xlat8.xyz = (-u_xlat13.xyz) + u_xlat7.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz + u_xlat7.xyz;
					                                                            u_xlat13.xyz = vec3(1.0, 1.0, 1.0) / u_xlat13.xyz;
					                                                            u_xlat13.xyz = u_xlat13.xyz * u_xlat8.xyz;
					                                                            u_xlat6.xyz = u_xlat13.xyz / _Time.xyz;
					                                                        } else {
					                                                            u_xlatb11 = _DeepfryValue==12.0;
					                                                            if(u_xlatb11){
					                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                u_xlat11 = sin(u_xlat11);
					                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                u_xlat6.x = cos(u_xlat11);
					                                                            } else {
					                                                                u_xlatb11 = _DeepfryValue==13.0;
					                                                                if(u_xlatb11){
					                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                    u_xlat11 = sin(u_xlat11);
					                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                    u_xlat6.y = cos(u_xlat11);
					                                                                } else {
					                                                                    u_xlatb11 = _DeepfryValue==14.0;
					                                                                    if(u_xlatb11){
					                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                        u_xlat11 = sin(u_xlat11);
					                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                        u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                        u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                        u_xlat6.z = cos(u_xlat11);
					                                                                    } else {
					                                                                        u_xlatb11 = _DeepfryValue==15.0;
					                                                                        if(u_xlatb11){
					                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                            u_xlat13.x = u_xlat7.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                            u_xlat13.x = u_xlat24.x * _DeepfryBrightness + u_xlat13.x;
					                                                                            u_xlat6.z = cos(u_xlat13.x);
					                                                                            u_xlat13.x = u_xlat7.x / u_xlat8.x;
					                                                                            u_xlat13.x = u_xlat13.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat13.x = u_xlat24.x * _DeepfryBrightness + u_xlat13.x;
					                                                                            u_xlat13.x = sin(u_xlat13.x);
					                                                                            u_xlat13.x = cos(u_xlat13.x);
					                                                                            u_xlat24.x = (-u_xlat13.x) + 1.0;
					                                                                            u_xlat24.x = sqrt(u_xlat24.x);
					                                                                            u_xlat35 = u_xlat13.x * -0.0187292993 + 0.0742610022;
					                                                                            u_xlat35 = u_xlat35 * u_xlat13.x + -0.212114394;
					                                                                            u_xlat13.x = u_xlat35 * u_xlat13.x + 1.57072878;
					                                                                            u_xlat6.x = u_xlat24.x * u_xlat13.x;
					                                                                            u_xlat13.x = (-u_xlat13.x) * u_xlat24.x + 1.0;
					                                                                            u_xlat11 = u_xlat13.x * u_xlat11 + u_xlat6.x;
					                                                                            u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                            u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                            u_xlat13.x = exp2(u_xlat11);
					                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                            u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                            u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                            u_xlat6.y = u_xlat11 * u_xlat24.x;
					                                                                        } else {
					                                                                            u_xlatb11 = _DeepfryValue==16.0;
					                                                                            if(u_xlatb11){
					                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                u_xlat7.x = sin(u_xlat11);
					                                                                                u_xlat8.x = cos(u_xlat11);
					                                                                                u_xlat11 = u_xlat7.x / u_xlat8.x;
					                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                u_xlat11 = sin(u_xlat11);
					                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                u_xlat13.x = (-u_xlat11) + 1.0;
					                                                                                u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                u_xlat24.x = u_xlat11 * -0.0187292993 + 0.0742610022;
					                                                                                u_xlat24.x = u_xlat24.x * u_xlat11 + -0.212114394;
					                                                                                u_xlat11 = u_xlat24.x * u_xlat11 + 1.57072878;
					                                                                                u_xlat6.y = u_xlat13.x * u_xlat11;
					                                                                            } else {
					                                                                                u_xlatb11 = _DeepfryValue==17.0;
					                                                                                if(u_xlatb11){
					                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                    u_xlat7.x = sin(u_xlat11);
					                                                                                    u_xlat8.x = cos(u_xlat11);
					                                                                                    u_xlat11 = u_xlat7.x / u_xlat8.x;
					                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                    u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                    u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                    u_xlat11 = cos(u_xlat11);
					                                                                                    u_xlat13.x = (-u_xlat11) + 1.0;
					                                                                                    u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                    u_xlat24.x = u_xlat11 * -0.0187292993 + 0.0742610022;
					                                                                                    u_xlat24.x = u_xlat24.x * u_xlat11 + -0.212114394;
					                                                                                    u_xlat11 = u_xlat24.x * u_xlat11 + 1.57072878;
					                                                                                    u_xlat6.z = u_xlat13.x * u_xlat11;
					                                                                                } else {
					                                                                                    u_xlatb11 = _DeepfryValue==18.0;
					                                                                                    if(u_xlatb11){
					                                                                                        u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                        u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                        u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                        u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                                                        u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                        u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                        u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                        u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                        u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                        u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                        u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                        u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                        u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                        u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                        u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                        u_xlat6.xz = u_xlat7.xy * u_xlat13.xy;
					                                                                                    } else {
					                                                                                        u_xlatb11 = _DeepfryValue==19.0;
					                                                                                        if(u_xlatb11){
					                                                                                            u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                            u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                            u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                            u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                            u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                            u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                            u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                            u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                            u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                            u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                            u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                            u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                            u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                            u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                            u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                            u_xlat6.xy = u_xlat7.xy * u_xlat13.xy;
					                                                                                        } else {
					                                                                                            u_xlatb11 = _DeepfryValue==20.0;
					                                                                                            if(u_xlatb11){
					                                                                                                u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                                u_xlat7.xy = sin(u_xlat13.xy);
					                                                                                                u_xlat8.xy = cos(u_xlat13.xy);
					                                                                                                u_xlat13.xy = u_xlat7.xy / u_xlat8.xy;
					                                                                                                u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                                u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                                u_xlat7.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness));
					                                                                                                u_xlat13.xy = u_xlat7.xy * vec2(0.100000001, 0.100000001) + u_xlat13.xy;
					                                                                                                u_xlat13.xy = sin(u_xlat13.xy);
					                                                                                                u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                u_xlat7.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                u_xlat29.xy = u_xlat13.xy * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                u_xlat29.xy = u_xlat29.xy * u_xlat13.xy + vec2(-0.212114394, -0.212114394);
					                                                                                                u_xlat13.xy = u_xlat29.xy * u_xlat13.xy + vec2(1.57072878, 1.57072878);
					                                                                                                u_xlat6.yz = u_xlat7.xy * u_xlat13.xy;
					                                                                                            } else {
					                                                                                                u_xlatb11 = _DeepfryValue==21.0;
					                                                                                                if(u_xlatb11){
					                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                    u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                    u_xlat13.x = exp2(u_xlat11);
					                                                                                                    u_xlat11 = exp2((-u_xlat11));
					                                                                                                    u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                    u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                    u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                    u_xlat6.y = u_xlat11 * u_xlat24.x;
					                                                                                                } else {
					                                                                                                    u_xlatb11 = _DeepfryValue==22.0;
					                                                                                                    if(u_xlatb11){
					                                                                                                        u_xlat13.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
					                                                                                                        u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                        u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.xy;
					                                                                                                        u_xlat7.xy = u_xlat6.xy * _Time.ww;
					                                                                                                        u_xlat13.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xy;
					                                                                                                        u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                        u_xlat7.xy = -abs(u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                        u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                        u_xlat29.xy = abs(u_xlat13.xy) * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                        u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(-0.212114394, -0.212114394);
					                                                                                                        u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(1.57072878, 1.57072878);
					                                                                                                        u_xlat8.xy = u_xlat7.xy * u_xlat29.xy;
					                                                                                                        u_xlat8.xy = u_xlat8.xy * vec2(-2.0, -2.0) + vec2(3.14159274, 3.14159274);
					                                                                                                        u_xlatb13.xy = lessThan(u_xlat13.xyxx, (-u_xlat13.xyxx)).xy;
					                                                                                                        u_xlat13.xy = mix(vec2(0.0, 0.0), u_xlat8.xy, vec2(u_xlatb13.xy));
					                                                                                                        u_xlat6.xy = u_xlat29.xy * u_xlat7.xy + u_xlat13.xy;
					                                                                                                    } else {
					                                                                                                        u_xlatb11 = _DeepfryValue==23.0;
					                                                                                                        if(u_xlatb11){
					                                                                                                            u_xlat13.xy = (-u_xlat6.yx) + vec2(1.0, 1.0);
					                                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                            u_xlat13.xy = u_xlat13.xy * vec2(u_xlat11) + u_xlat6.yx;
					                                                                                                            u_xlat7.xy = u_xlat6.yx * _Time.ww;
					                                                                                                            u_xlat13.xy = u_xlat7.xy * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + u_xlat13.xy;
					                                                                                                            u_xlat13.xy = cos(u_xlat13.xy);
					                                                                                                            u_xlat7.xy = -abs(u_xlat13.xy) + vec2(1.0, 1.0);
					                                                                                                            u_xlat7.xy = sqrt(u_xlat7.xy);
					                                                                                                            u_xlat29.xy = abs(u_xlat13.xy) * vec2(-0.0187292993, -0.0187292993) + vec2(0.0742610022, 0.0742610022);
					                                                                                                            u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(-0.212114394, -0.212114394);
					                                                                                                            u_xlat29.xy = u_xlat29.xy * abs(u_xlat13.xy) + vec2(1.57072878, 1.57072878);
					                                                                                                            u_xlat8.xy = u_xlat7.xy * u_xlat29.xy;
					                                                                                                            u_xlat8.xy = u_xlat8.xy * vec2(-2.0, -2.0) + vec2(3.14159274, 3.14159274);
					                                                                                                            u_xlatb13.xy = lessThan(u_xlat13.xyxx, (-u_xlat13.xyxx)).xy;
					                                                                                                            u_xlat13.xy = mix(vec2(0.0, 0.0), u_xlat8.xy, vec2(u_xlatb13.xy));
					                                                                                                            u_xlat6.xz = u_xlat29.xy * u_xlat7.xy + u_xlat13.xy;
					                                                                                                        } else {
					                                                                                                            u_xlatb11 = _DeepfryValue==24.0;
					                                                                                                            if(u_xlatb11){
					                                                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                u_xlat13.x = u_xlat13.x * _DeepfryBrightness;
					                                                                                                                u_xlat11 = u_xlat13.x * 0.100000001 + u_xlat11;
					                                                                                                                u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                u_xlat13.x = exp2(u_xlat11);
					                                                                                                                u_xlat11 = exp2((-u_xlat11));
					                                                                                                                u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                                u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                                u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                u_xlat6.x = u_xlat11 * u_xlat24.x;
					                                                                                                            } else {
					                                                                                                                u_xlatb11 = _DeepfryValue==25.0;
					                                                                                                                if(u_xlatb11){
					                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                    u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                    u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                    u_xlat11 = u_xlat24.x * 0.100000001 + u_xlat11;
					                                                                                                                    u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                    u_xlat24.x = exp2(u_xlat11);
					                                                                                                                    u_xlat11 = exp2((-u_xlat11));
					                                                                                                                    u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                    u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                    u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                    u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                    u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                    u_xlat11 = cos(u_xlat11);
					                                                                                                                    u_xlat13.x = -abs(u_xlat11) + 1.0;
					                                                                                                                    u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                                                    u_xlat24.x = abs(u_xlat11) * -0.0187292993 + 0.0742610022;
					                                                                                                                    u_xlat24.x = u_xlat24.x * abs(u_xlat11) + -0.212114394;
					                                                                                                                    u_xlat24.x = u_xlat24.x * abs(u_xlat11) + 1.57072878;
					                                                                                                                    u_xlat35 = u_xlat13.x * u_xlat24.x;
					                                                                                                                    u_xlat35 = u_xlat35 * -2.0 + 3.14159274;
					                                                                                                                    u_xlatb11 = u_xlat11<(-u_xlat11);
					                                                                                                                    u_xlat11 = u_xlatb11 ? u_xlat35 : float(0.0);
					                                                                                                                    u_xlat6.z = u_xlat24.x * u_xlat13.x + u_xlat11;
					                                                                                                                } else {
					                                                                                                                    u_xlatb11 = _DeepfryValue==26.0;
					                                                                                                                    if(u_xlatb11){
					                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                        u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                        u_xlat11 = u_xlat24.x * 0.100000001 + u_xlat11;
					                                                                                                                        u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                        u_xlat24.x = exp2(u_xlat11);
					                                                                                                                        u_xlat11 = exp2((-u_xlat11));
					                                                                                                                        u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                        u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                        u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                        u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                        u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                        u_xlat24.x = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat35 = u_xlat6.x * _Time.w;
					                                                                                                                        u_xlat24.x = u_xlat35 * _DeepfryBrightness + u_xlat24.x;
					                                                                                                                        u_xlat24.x = cos(u_xlat24.x);
					                                                                                                                        u_xlat7.x = -abs(u_xlat24.x) + 1.0;
					                                                                                                                        u_xlat7.x = sqrt(u_xlat7.x);
					                                                                                                                        u_xlat18.x = abs(u_xlat24.x) * -0.0187292993 + 0.0742610022;
					                                                                                                                        u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + -0.212114394;
					                                                                                                                        u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + 1.57072878;
					                                                                                                                        u_xlat29.x = u_xlat7.x * u_xlat18.x;
					                                                                                                                        u_xlat29.x = u_xlat29.x * -2.0 + 3.14159274;
					                                                                                                                        u_xlatb24.x = u_xlat24.x<(-u_xlat24.x);
					                                                                                                                        u_xlat24.x = u_xlatb24.x ? u_xlat29.x : float(0.0);
					                                                                                                                        u_xlat6.z = u_xlat18.x * u_xlat7.x + u_xlat24.x;
					                                                                                                                        u_xlat11 = cos(u_xlat11);
					                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                        u_xlat11 = u_xlat35 * _DeepfryBrightness + u_xlat11;
					                                                                                                                        u_xlat11 = sin(u_xlat11);
					                                                                                                                        u_xlat7.x = sin(u_xlat11);
					                                                                                                                        u_xlat8.x = cos(u_xlat11);
					                                                                                                                        u_xlat6.y = u_xlat7.x / u_xlat8.x;
					                                                                                                                    } else {
					                                                                                                                        u_xlatb11 = _DeepfryValue==27.0;
					                                                                                                                        if(u_xlatb11){
					                                                                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                            u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                            u_xlat24.x = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                            u_xlat35 = u_xlat6.x * _Time.w;
					                                                                                                                            u_xlat7.x = u_xlat35 * _DeepfryBrightness;
					                                                                                                                            u_xlat7.x = u_xlat7.x * 0.100000001 + u_xlat24.x;
					                                                                                                                            u_xlat7.x = u_xlat7.x * 1.44269502;
					                                                                                                                            u_xlat18.x = exp2(u_xlat7.x);
					                                                                                                                            u_xlat7.x = exp2((-u_xlat7.x));
					                                                                                                                            u_xlat29.x = (-u_xlat7.x) + u_xlat18.x;
					                                                                                                                            u_xlat7.x = u_xlat7.x + u_xlat18.x;
					                                                                                                                            u_xlat7.x = float(1.0) / u_xlat7.x;
					                                                                                                                            u_xlat6.z = u_xlat7.x * u_xlat29.x;
					                                                                                                                            u_xlat24.x = u_xlat35 * _DeepfryBrightness + u_xlat24.x;
					                                                                                                                            u_xlat24.x = cos(u_xlat24.x);
					                                                                                                                            u_xlat7.x = -abs(u_xlat24.x) + 1.0;
					                                                                                                                            u_xlat7.x = sqrt(u_xlat7.x);
					                                                                                                                            u_xlat18.x = abs(u_xlat24.x) * -0.0187292993 + 0.0742610022;
					                                                                                                                            u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + -0.212114394;
					                                                                                                                            u_xlat18.x = u_xlat18.x * abs(u_xlat24.x) + 1.57072878;
					                                                                                                                            u_xlat29.x = u_xlat7.x * u_xlat18.x;
					                                                                                                                            u_xlat29.x = u_xlat29.x * -2.0 + 3.14159274;
					                                                                                                                            u_xlatb24.x = u_xlat24.x<(-u_xlat24.x);
					                                                                                                                            u_xlat24.x = u_xlatb24.x ? u_xlat29.x : float(0.0);
					                                                                                                                            u_xlat6.y = u_xlat18.x * u_xlat7.x + u_xlat24.x;
					                                                                                                                            u_xlat11 = cos(u_xlat11);
					                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                            u_xlat11 = u_xlat35 * _DeepfryBrightness + u_xlat11;
					                                                                                                                            u_xlat11 = sin(u_xlat11);
					                                                                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                                                                            u_xlat6.x = u_xlat7.x / u_xlat8.x;
					                                                                                                                        } else {
					                                                                                                                            u_xlatb11 = _DeepfryValue==28.0;
					                                                                                                                            if(u_xlatb11){
					                                                                                                                                u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                                                                u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                u_xlat11 = cos(u_xlat11);
					                                                                                                                                u_xlat6.x = cos(u_xlat11);
					                                                                                                                            } else {
					                                                                                                                                u_xlatb11 = _DeepfryValue==29.0;
					                                                                                                                                if(u_xlatb11){
					                                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                                                                    u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                    u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                    u_xlat11 = u_xlat24.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                    u_xlat6.x = cos(u_xlat11);
					                                                                                                                                    u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                    u_xlat11 = sin(u_xlat11);
					                                                                                                                                    u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                    u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                    u_xlat11 = u_xlat13.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                    u_xlat6.yz = cos(vec2(u_xlat11));
					                                                                                                                                } else {
					                                                                                                                                    u_xlatb11 = _DeepfryValue==30.0;
					                                                                                                                                    if(u_xlatb11){
					                                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                        u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                        u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                        u_xlat6.x = u_xlat24.x * _DeepfryBrightness + u_xlat11;
					                                                                                                                                        u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                        u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat6.x;
					                                                                                                                                        u_xlat13.x = u_xlat6.x * _Time.w;
					                                                                                                                                        u_xlat6.yz = u_xlat13.xx * vec2(vec2(_DeepfryBrightness, _DeepfryBrightness)) + vec2(u_xlat11);
					                                                                                                                                    } else {
					                                                                                                                                        u_xlatb11 = _DeepfryValue==31.0;
					                                                                                                                                        if(u_xlatb11){
					                                                                                                                                            u_xlat11 = (-u_xlat6.x) + 1.0;
					                                                                                                                                            u_xlat13.x = (-_Time.w) + 1.0;
					                                                                                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat24.x;
					                                                                                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                                            u_xlat24.x = exp2(u_xlat11);
					                                                                                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                                                                                            u_xlat35 = (-u_xlat11) + u_xlat24.x;
					                                                                                                                                            u_xlat11 = u_xlat11 + u_xlat24.x;
					                                                                                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                                            u_xlat6.x = u_xlat11 * u_xlat35;
					                                                                                                                                            u_xlat11 = (-u_xlat35) * u_xlat11 + 1.0;
					                                                                                                                                            u_xlat24.x = u_xlat6.x * _Time.w;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * _DeepfryBrightness;
					                                                                                                                                            u_xlat11 = u_xlat11 * u_xlat13.x + u_xlat24.x;
					                                                                                                                                            u_xlat6.y = cos(u_xlat11);
					                                                                                                                                            u_xlat11 = u_xlat11 * 1.44269502;
					                                                                                                                                            u_xlat13.x = exp2(u_xlat11);
					                                                                                                                                            u_xlat11 = exp2((-u_xlat11));
					                                                                                                                                            u_xlat24.x = (-u_xlat11) + u_xlat13.x;
					                                                                                                                                            u_xlat11 = u_xlat11 + u_xlat13.x;
					                                                                                                                                            u_xlat11 = float(1.0) / u_xlat11;
					                                                                                                                                            u_xlat6.z = u_xlat11 * u_xlat24.x;
					                                                                                                                                        } else {
					                                                                                                                                            u_xlat7 = (-u_xlat6.xxyz) + vec4(1.0, 1.0, 1.0, 1.0);
					                                                                                                                                            u_xlat11 = (-_Time.w) + 1.0;
					                                                                                                                                            u_xlat8 = u_xlat6.xxyz * _Time.wwww;
					                                                                                                                                            u_xlat8 = u_xlat8 * vec4(vec4(_DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness, _DeepfryBrightness));
					                                                                                                                                            u_xlat7 = u_xlat7 * vec4(u_xlat11) + u_xlat8;
					                                                                                                                                            u_xlat11 = cos(u_xlat7.x);
					                                                                                                                                            u_xlat13.x = -abs(u_xlat11) + 1.0;
					                                                                                                                                            u_xlat13.x = sqrt(u_xlat13.x);
					                                                                                                                                            u_xlat24.x = abs(u_xlat11) * -0.0187292993 + 0.0742610022;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * abs(u_xlat11) + -0.212114394;
					                                                                                                                                            u_xlat24.x = u_xlat24.x * abs(u_xlat11) + 1.57072878;
					                                                                                                                                            u_xlat35 = u_xlat13.x * u_xlat24.x;
					                                                                                                                                            u_xlat35 = u_xlat35 * -2.0 + 3.14159274;
					                                                                                                                                            u_xlatb7.x = u_xlat11<(-u_xlat11);
					                                                                                                                                            u_xlat35 = u_xlatb7.x ? u_xlat35 : float(0.0);
					                                                                                                                                            u_xlat6.y = u_xlat24.x * u_xlat13.x + u_xlat35;
					                                                                                                                                            u_xlat7.x = sin(u_xlat11);
					                                                                                                                                            u_xlat8.x = cos(u_xlat11);
					                                                                                                                                            u_xlat6.w = u_xlat7.x / u_xlat8.x;
					                                                                                                                                            u_xlatb13.xyz = equal(vec4(_DeepfryValue), vec4(32.0, 33.0, 34.0, 34.0)).xyz;
					                                                                                                                                            u_xlat8.xyz = sin(u_xlat7.wzy);
					                                                                                                                                            u_xlat8.xyz = sin(u_xlat8.xyz);
					                                                                                                                                            u_xlat8.xyz = u_xlat8.xyz * vec3(-0.947587371, -0.947587371, -0.947587371);
					                                                                                                                                            u_xlat7.xyz = (u_xlatb13.z) ? u_xlat8.xyz : u_xlat7.yzw;
					                                                                                                                                            u_xlat7.xyz = (u_xlatb13.y) ? u_xlat6.xwz : u_xlat7.xyz;
					                                                                                                                                            u_xlat6.xyz = (u_xlatb13.x) ? u_xlat6.xyz : u_xlat7.xyz;
					                                                                                                                                        //ENDIF
					                                                                                                                                        }
					                                                                                                                                    //ENDIF
					                                                                                                                                    }
					                                                                                                                                //ENDIF
					                                                                                                                                }
					                                                                                                                            //ENDIF
					                                                                                                                            }
					                                                                                                                        //ENDIF
					                                                                                                                        }
					                                                                                                                    //ENDIF
					                                                                                                                    }
					                                                                                                                //ENDIF
					                                                                                                                }
					                                                                                                            //ENDIF
					                                                                                                            }
					                                                                                                        //ENDIF
					                                                                                                        }
					                                                                                                    //ENDIF
					                                                                                                    }
					                                                                                                //ENDIF
					                                                                                                }
					                                                                                            //ENDIF
					                                                                                            }
					                                                                                        //ENDIF
					                                                                                        }
					                                                                                    //ENDIF
					                                                                                    }
					                                                                                //ENDIF
					                                                                                }
					                                                                            //ENDIF
					                                                                            }
					                                                                        //ENDIF
					                                                                        }
					                                                                    //ENDIF
					                                                                    }
					                                                                //ENDIF
					                                                                }
					                                                            //ENDIF
					                                                            }
					                                                        //ENDIF
					                                                        }
					                                                    //ENDIF
					                                                    }
					                                                //ENDIF
					                                                }
					                                            //ENDIF
					                                            }
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                //ENDIF
					                                }
					                            //ENDIF
					                            }
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlatb11 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleNoise);
					            u_xlat13.xy = vs_TEXCOORD1.xy + vec2(0.212699994, 0.212699994);
					            u_xlat35 = vs_TEXCOORD1.y * vs_TEXCOORD1.x;
					            u_xlat39 = u_xlat35 * 0.371300012;
					            u_xlat24.xy = vec2(u_xlat35) * vec2(0.371300012, 0.371300012) + u_xlat13.xy;
					            u_xlat7.xy = u_xlat24.xy * vec2(489.122986, 489.122986);
					            u_xlat7.xy = sin(u_xlat7.xy);
					            u_xlat7.xy = u_xlat7.xy * vec2(4.78900003, 4.78900003);
					            u_xlatb35 = _ToggleAnimatedNoise==1.0;
					            u_xlat29.x = _StaticSpeed * _Time.x;
					            u_xlat13.x = u_xlat39 * u_xlat29.x + u_xlat13.x;
					            u_xlat13.x = (u_xlatb35) ? u_xlat13.x : u_xlat24.x;
					            u_xlat24.x = u_xlat22 * _StaticIntensity;
					            u_xlat2.x = (u_xlatb2.x) ? u_xlat24.x : _StaticIntensity;
					            u_xlat24.x = u_xlat7.y * u_xlat7.x;
					            u_xlat13.x = u_xlat13.x + 1.0;
					            u_xlat13.x = u_xlat13.x * u_xlat24.x;
					            u_xlat13.x = fract(u_xlat13.x);
					            u_xlat7.xyz = (-u_xlat6.xyz) + vec3(1.0, 1.0, 1.0);
					            u_xlat2.x = u_xlat13.x * u_xlat2.x;
					            u_xlat2.xyz = (-u_xlat2.xxx) * _StaticColor.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = (-u_xlat7.xyz) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					            u_xlat5.xzw = (bool(u_xlatb11)) ? u_xlat2.xyz : u_xlat6.xyz;
					            if(u_xlatb0){
					                u_xlat0.xy = u_xlat3.wz + vec2(-0.5, -0.5);
					                u_xlat2.xy = u_xlat0.xy * vec2(1.20000005, 1.20000005);
					                u_xlat24.x = u_xlat0.x + u_xlat0.x;
					                u_xlat0.x = u_xlat0.x * u_xlat24.x;
					                u_xlat11 = u_xlat0.y * u_xlat0.y;
					                u_xlat0.x = u_xlat11 * u_xlat0.x + 0.833333313;
					                u_xlat0.xy = u_xlat2.xy * u_xlat0.xx + vec2(0.5, 0.5);
					                u_xlat2.xy = _Time.yy * vec2(0.25, 80.0);
					                u_xlatb24.x = u_xlat2.x>=(-u_xlat2.x);
					                u_xlat2.x = fract(abs(u_xlat2.x));
					                u_xlat2.x = (u_xlatb24.x) ? u_xlat2.x : (-u_xlat2.x);
					                u_xlat2.x = u_xlat0.y + (-u_xlat2.x);
					                u_xlat2.x = u_xlat2.x * u_xlat2.x;
					                u_xlat2.x = u_xlat2.x * 20.0 + 1.0;
					                u_xlat2.x = float(1.0) / u_xlat2.x;
					                u_xlat2.x = u_xlat2.x + _waveyness;
					                u_xlatb24.x = _ToggleSmoothWave==0.0;
					                u_xlat35 = u_xlat0.y * 10.0 + _Time.y;
					                u_xlat35 = sin(u_xlat35);
					                u_xlat35 = u_xlat35 * _VHSXDisplacement.x;
					                u_xlat35 = u_xlat35 * 0.0199999996;
					                u_xlat13.x = cos(u_xlat2.y);
					                u_xlat13.x = u_xlat13.x + 1.0;
					                u_xlat13.x = u_xlat13.x * u_xlat35;
					                u_xlat13.x = u_xlat13.x * u_xlat2.x + u_xlat0.x;
					                u_xlat35 = u_xlat0.y + _Time.y;
					                u_xlat35 = sin(u_xlat35);
					                u_xlat35 = u_xlat35 * _VHSXDisplacement.x;
					                u_xlat6.x = sin(_Time.y);
					                u_xlat7.x = cos(_Time.y);
					                u_xlat35 = u_xlat35 * u_xlat7.x;
					                u_xlat0.x = u_xlat35 * u_xlat2.x + u_xlat0.x;
					                u_xlat0.x = (u_xlatb24.x) ? u_xlat13.x : u_xlat0.x;
					                u_xlat2.x = _VHSYDisplacement.x * 0.400000006;
					                u_xlat13.x = u_xlat6.x * u_xlat7.x + u_xlat6.x;
					                u_xlat11 = u_xlat2.x * u_xlat13.x + u_xlat0.y;
					                u_xlatb2.x = u_xlat11>=(-u_xlat11);
					                u_xlat11 = fract(abs(u_xlat11));
					                u_xlat11 = (u_xlatb2.x) ? u_xlat11 : (-u_xlat11);
					                u_xlat2 = u_xlat5.xzwy + vec4(0.0, 0.0, 0.0, 1.0);
					                u_xlat6.x = _shadowFlicker * _Time.y;
					                u_xlat6.x = cos(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x + _Time.y;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat6.x = max(u_xlat6.x, _shadowMin);
					                u_xlat6.x = min(u_xlat6.x, _shadowMax);
					                u_xlat6.x = u_xlat6.x + _shadowStrength;
					                u_xlat17.x = u_xlat11 + -0.5;
					                u_xlat17.x = u_xlat17.x * u_xlat17.x;
					                u_xlat17.x = (-u_xlat17.x) * u_xlat6.x + 1.0;
					                u_xlat0.x = u_xlat0.x + -0.5;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat0.x = (-u_xlat0.x) * u_xlat6.x + 1.0;
					                u_xlat0.x = u_xlat0.x * u_xlat17.x;
					                u_xlat2 = u_xlat0.xxxx * u_xlat2;
					                u_xlat0.x = u_xlat11 * 30.0 + _Time.y;
					                u_xlatb11 = u_xlat0.x>=(-u_xlat0.x);
					                u_xlat0.x = fract(abs(u_xlat0.x));
					                u_xlat0.x = (u_xlatb11) ? u_xlat0.x : (-u_xlat0.x);
					                u_xlat0.x = u_xlat0.x + _darkness;
					                u_xlat11 = _darkness + 1.0;
					                u_xlat0.x = u_xlat0.x / u_xlat11;
					                u_xlat5 = u_xlat0.xxxx * u_xlat2.xwyz;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgy);
					            if(u_xlatb0){
					                u_xlatb0 = _AllowScalarFalloff==1.0;
					                u_xlatb0 = u_xlatb0 && u_xlatb33;
					                u_xlat2.xy = vec2(u_xlat22) * vec2(_EdgyOffset, _EdgyOffsetTwo);
					                u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : vec2(_EdgyOffset, _EdgyOffsetTwo);
					                u_xlat3.xy = (-u_xlat0.xy) + u_xlat3.ww;
					                u_xlat10_2 = texture(_LukaFirstPass, u_xlat3.xz);
					                u_xlat2.xyz = (-u_xlat10_2.xyz) + vec3(vec3(_EdgyMulti, _EdgyMulti, _EdgyMulti));
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat5.xzw;
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat3.yz);
					                u_xlat6.xyz = (-u_xlat10_6.xyz) + vec3(vec3(_EdgyMulti, _EdgyMulti, _EdgyMulti));
					                u_xlat6.xyz = u_xlat5.xzw + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
					                u_xlat5.xzw = u_xlat2.xyz * vec3(0.25, 0.25, 0.25);
					                u_xlat5.y = 1.0;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleOutline);
					            if(u_xlatb0){
					                u_xlat3.y = u_xlat3.w + _OutlineActualOffset;
					                u_xlat10_2 = texture(_LukaFirstPass, u_xlat3.yz);
					                u_xlat2.xyz = (-u_xlat10_2.xyz) + vec3(vec3(_OutlineOffset, _OutlineOffset, _OutlineOffset));
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat5.xzw;
					                u_xlat3.x = u_xlat3.w + (-_OutlineActualOffset);
					                u_xlat10_6 = texture(_LukaFirstPass, u_xlat3.xz);
					                u_xlat6.xyz = (-u_xlat10_6.xyz) + vec3(vec3(_OutlineOffset, _OutlineOffset, _OutlineOffset));
					                u_xlat6.xyz = u_xlat5.xzw + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz + u_xlat6.xyz;
					                u_xlat2.xyz = u_xlat2.xyz / vec3(vec3(_OutlineModOne, _OutlineModOne, _OutlineModOne));
					                u_xlat6.x = u_xlat2.x * _OutlineModTwo;
					                u_xlat6.yz = u_xlat2.yz * vec2(_OutlineModThree, _OutlineModFour);
					                u_xlatb0 = _ToggleSepiaOutline==1.0;
					                u_xlat11 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					                u_xlat6.w = 1.0;
					                u_xlat5 = (bool(u_xlatb0)) ? vec4(u_xlat11) : u_xlat6.xwyz;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRampEffect);
					            if(u_xlatb0){
					                u_xlat2 = u_xlat5.xzwy * vec4(vec4(_RampOneDepth, _RampOneDepth, _RampOneDepth, _RampOneDepth));
					                u_xlatb0 = _ToggleRampRed==1.0;
					                if(u_xlatb0){
					                    u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                    if(u_xlatb0){
					                        u_xlat0.x = _RampOneSpeed * _Time.x;
					                        u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.x;
					                        u_xlat0.y = 0.5;
					                        u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                        u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                    } else {
					                        u_xlat0.x = u_xlat5.x * _RampOneDepth + _RampOneStrength;
					                        u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                        u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                    //ENDIF
					                    }
					                } else {
					                    u_xlatb0 = _ToggleRampBlue==1.0;
					                    if(u_xlatb0){
					                        u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                        if(u_xlatb0){
					                            u_xlat0.x = _RampOneSpeed * _Time.x;
					                            u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.z;
					                            u_xlat0.y = 0.5;
					                            u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                            u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                        } else {
					                            u_xlat0.x = u_xlat5.w * _RampOneDepth + _RampOneStrength;
					                            u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                            u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                        //ENDIF
					                        }
					                    } else {
					                        u_xlatb0 = _ToggleRampGreen==1.0;
					                        if(u_xlatb0){
					                            u_xlatb0 = _ToggleRampOneAnimate==1.0;
					                            if(u_xlatb0){
					                                u_xlat0.x = _RampOneSpeed * _Time.x;
					                                u_xlat0.x = u_xlat0.x * _RampOneStrength + u_xlat2.y;
					                                u_xlat0.y = 0.5;
					                                u_xlat10_6 = texture(_RampMap, u_xlat0.xy);
					                                u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                            } else {
					                                u_xlat0.x = u_xlat2.y * _RampOneStrength;
					                                u_xlat10_6 = texture(_RampMap, u_xlat0.xx);
					                                u_xlat5 = u_xlat10_6.xwyz / vec4(vec4(_RampOneLighting, _RampOneLighting, _RampOneLighting, _RampOneLighting));
					                            //ENDIF
					                            }
					                        } else {
					                            u_xlat5 = u_xlat2.xwyz;
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDroplet);
					            if(u_xlatb0){
					                u_xlat2.xyz = _DropletColOne.xyz + (-vec3(_DropletTolerance));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _DropletColOne.xyz + vec3(_DropletTolerance);
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb2.y && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _DropletColTwo;
					                    SV_Target0 = vec4(vec4(_DropletIntensity, _DropletIntensity, _DropletIntensity, _DropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletTwo);
					                u_xlat2.xyz = _TwoDropletColOne.xyz + (-vec3(vec3(_TwoDropletTolerance, _TwoDropletTolerance, _TwoDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _TwoDropletColOne.xyz + vec3(vec3(_TwoDropletTolerance, _TwoDropletTolerance, _TwoDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _TwoDropletColTwo;
					                    SV_Target0 = vec4(vec4(_TwoDropletIntensity, _TwoDropletIntensity, _TwoDropletIntensity, _TwoDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletThree);
					                u_xlat2.xyz = _ThreeDropletColOne.xyz + (-vec3(vec3(_ThreeDropletTolerance, _ThreeDropletTolerance, _ThreeDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _ThreeDropletColOne.xyz + vec3(vec3(_ThreeDropletTolerance, _ThreeDropletTolerance, _ThreeDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _ThreeDropletColTwo;
					                    SV_Target0 = vec4(vec4(_ThreeDropletIntensity, _ThreeDropletIntensity, _ThreeDropletIntensity, _ThreeDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDropletFourth);
					                u_xlat2.xyz = _FourDropletColOne.xyz + (-vec3(vec3(_FourDropletTolerance, _FourDropletTolerance, _FourDropletTolerance)));
					                u_xlatb2.xyz = greaterThanEqual(u_xlat10_1.xyzx, u_xlat2.xyzx).xyz;
					                u_xlat6.xyz = _FourDropletColOne.xyz + vec3(vec3(_FourDropletTolerance, _FourDropletTolerance, _FourDropletTolerance));
					                u_xlatb6.xyz = greaterThanEqual(u_xlat6.xyzx, u_xlat10_1.xyzx).xyz;
					                u_xlatb2.x = u_xlatb2.x && u_xlatb6.x;
					                u_xlatb2.y = u_xlatb2.y && u_xlatb6.y;
					                u_xlatb2.z = u_xlatb2.z && u_xlatb6.z;
					                u_xlatb0 = u_xlatb0 && u_xlatb2.x;
					                u_xlatb0 = u_xlatb2.y && u_xlatb0;
					                u_xlatb0 = u_xlatb2.z && u_xlatb0;
					                if(u_xlatb0){
					                    u_xlat2 = (-u_xlat5.xzwy) + _FourDropletColTwo;
					                    SV_Target0 = vec4(vec4(_FourDropletIntensity, _FourDropletIntensity, _FourDropletIntensity, _FourDropletIntensity)) * u_xlat2 + u_xlat5.xzwy;
					                    return;
					                //ENDIF
					                }
					                u_xlatb0 = _ToggleDropletSepia==1.0;
					                u_xlat11 = dot(u_xlat5.xzw, vec3(0.300000012, 0.589999974, 0.109999999));
					                u_xlat5 = (bool(u_xlatb0)) ? vec4(u_xlat11) : u_xlat5;
					                u_xlat2.xyz = u_xlat5.xzw;
					            } else {
					                u_xlat2.xyz = u_xlat5.xzw;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleFilter);
					            u_xlatb3.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleAdvancedFilter, _ToggleColoredFilter, _ToggleAdvancedFilter, _ToggleAdvancedFilter)).xy;
					            u_xlat27.xy = (u_xlatb3.x) ? vec2(_FilterMinR, _FilterMaxR) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat6.xy = (u_xlatb3.x) ? vec2(_FilterMinG, _FilterMaxG) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat6.zw = (u_xlatb3.x) ? vec2(_FilterMinB, _FilterMaxB) : vec2(vec4(_FilterTolerance, _FilterTolerance, _FilterTolerance, _FilterTolerance));
					            u_xlat5.x = dot(u_xlat2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
					            u_xlat7 = (-u_xlat5.xxxy) + _BackgroundFilterColor;
					            u_xlat7 = vec4(vec4(_BackgroundFilterIntensity, _BackgroundFilterIntensity, _BackgroundFilterIntensity, _BackgroundFilterIntensity)) * u_xlat7 + u_xlat5.xxxy;
					            u_xlat7 = (u_xlatb3.y) ? u_xlat7 : u_xlat5.xxxy;
					            u_xlat11 = (-u_xlat27.x) + _FilterColor.x;
					            u_xlatb11 = u_xlat10_1.x>=u_xlat11;
					            u_xlat3.x = u_xlat27.y + _FilterColor.x;
					            u_xlatb3.x = u_xlat3.x>=u_xlat10_1.x;
					            u_xlatb11 = u_xlatb11 && u_xlatb3.x;
					            u_xlat3.xy = (-u_xlat6.xz) + _FilterColor.yz;
					            u_xlatb3.xy = greaterThanEqual(u_xlat10_1.yzyy, u_xlat3.xyxx).xy;
					            u_xlat5.xz = u_xlat6.yw + _FilterColor.yz;
					            u_xlatb5.xz = greaterThanEqual(u_xlat5.xxzx, u_xlat10_1.yyzy).xz;
					            u_xlatb3.x = u_xlatb3.x && u_xlatb5.x;
					            u_xlatb3.y = u_xlatb3.y && u_xlatb5.z;
					            u_xlatb11 = u_xlatb11 && u_xlatb3.x;
					            u_xlatb11 = u_xlatb3.y && u_xlatb11;
					            u_xlat6 = u_xlat10_1 + (-u_xlat7);
					            u_xlat6 = vec4(vec4(_FilterIntensity, _FilterIntensity, _FilterIntensity, _FilterIntensity)) * u_xlat6 + u_xlat7;
					            u_xlat6 = (bool(u_xlatb11)) ? u_xlat6 : u_xlat7;
					            u_xlat2.w = u_xlat5.y;
					            u_xlat2 = (bool(u_xlatb0)) ? u_xlat6 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleLinocut);
					            if(u_xlatb0){
					                u_xlat0.x = vs_TEXCOORD0.y * 0.5;
					                u_xlat3.xy = (-vs_TEXCOORD0.yy) * vec2(0.5, 0.5) + u_xlat3.wz;
					                u_xlat11 = min(abs(u_xlat3.y), abs(u_xlat3.x));
					                u_xlat5.x = max(abs(u_xlat3.y), abs(u_xlat3.x));
					                u_xlat5.x = float(1.0) / u_xlat5.x;
					                u_xlat11 = u_xlat11 * u_xlat5.x;
					                u_xlat5.x = u_xlat11 * u_xlat11;
					                u_xlat16.x = u_xlat5.x * 0.0208350997 + -0.0851330012;
					                u_xlat16.x = u_xlat5.x * u_xlat16.x + 0.180141002;
					                u_xlat16.x = u_xlat5.x * u_xlat16.x + -0.330299497;
					                u_xlat5.x = u_xlat5.x * u_xlat16.x + 0.999866009;
					                u_xlat16.x = u_xlat11 * u_xlat5.x;
					                u_xlatb27 = abs(u_xlat3.y)<abs(u_xlat3.x);
					                u_xlat16.x = u_xlat16.x * -2.0 + 1.57079637;
					                u_xlat16.x = u_xlatb27 ? u_xlat16.x : float(0.0);
					                u_xlat11 = u_xlat11 * u_xlat5.x + u_xlat16.x;
					                u_xlatb5.x = u_xlat3.y<(-u_xlat3.y);
					                u_xlat5.x = u_xlatb5.x ? -3.14159274 : float(0.0);
					                u_xlat11 = u_xlat11 + u_xlat5.x;
					                u_xlat5.x = min(u_xlat3.y, u_xlat3.x);
					                u_xlat16.x = max(u_xlat3.y, u_xlat3.x);
					                u_xlatb5.x = u_xlat5.x<(-u_xlat5.x);
					                u_xlatb16 = u_xlat16.x>=(-u_xlat16.x);
					                u_xlatb5.x = u_xlatb16 && u_xlatb5.x;
					                u_xlat11 = (u_xlatb5.x) ? (-u_xlat11) : u_xlat11;
					                u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
					                u_xlat3.x = sqrt(u_xlat3.x);
					                u_xlat3.x = (-u_xlat3.x) * 0.00100000005 + 0.5;
					                u_xlat11 = u_xlat3.x * 2.0 + u_xlat11;
					                u_xlat11 = cos(u_xlat11);
					                u_xlat11 = u_xlat11 * _LinocutPower;
					                u_xlat0.x = u_xlat11 * 0.5 + u_xlat0.x;
					                u_xlat0.x = u_xlat0.x * 1000.0;
					                u_xlat0.x = sin(u_xlat0.x);
					                u_xlat0.x = u_xlat0.x * 0.25 + 0.75;
					                u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					                u_xlat3.x = u_xlat0.x * 0.5;
					                u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat11;
					                u_xlat11 = float(1.0) / u_xlat3.x;
					                u_xlat0.x = u_xlat11 * u_xlat0.x;
					                u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					                u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat0.x = dot(vec2(u_xlat11), u_xlat0.xx);
					                u_xlat0.x = min(u_xlat0.x, 1.0);
					                u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat5.xyz = u_xlat0.xxx * vec3(u_xlat11);
					                u_xlat5.w = 0.0;
					                u_xlat5 = (-u_xlat2) + u_xlat5;
					                u_xlat2 = vec4(_LinocutOpacity) * u_xlat5 + u_xlat2;
					            //ENDIF
					            }
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDuotone);
					            u_xlat11 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
					            u_xlat5 = _DuotoneColOne + _DuotoneColTwo;
					            u_xlat6 = u_xlat5 * vec4(0.5, 0.5, 0.5, 0.5);
					            u_xlatb3.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_DuotoneHardEdges);
					            u_xlatb14 = u_xlat11>=_DuotoneThreshold;
					            u_xlat7 = (bool(u_xlatb14)) ? _DuotoneColOne : _DuotoneColTwo;
					            u_xlat8.x = (-_DuotoneThreshold) + 1.0;
					            u_xlat19.x = u_xlat8.x * _DuotoneHardness;
					            u_xlat30 = u_xlat11 + (-_DuotoneThreshold);
					            u_xlat19.x = float(1.0) / u_xlat19.x;
					            u_xlat19.x = u_xlat19.x * u_xlat30;
					            u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
					            u_xlat30 = u_xlat19.x * -2.0 + 3.0;
					            u_xlat19.x = u_xlat19.x * u_xlat19.x;
					            u_xlat19.x = u_xlat19.x * u_xlat30;
					            u_xlat9 = (-u_xlat5) * vec4(0.5, 0.5, 0.5, 0.5) + _DuotoneColOne;
					            u_xlat6 = u_xlat19.xxxx * u_xlat9 + u_xlat6;
					            u_xlat8.x = (-u_xlat8.x) * _DuotoneHardness + _DuotoneThreshold;
					            u_xlat19.x = (-u_xlat8.x) + _DuotoneThreshold;
					            u_xlat11 = u_xlat11 + (-u_xlat8.x);
					            u_xlat8.x = float(1.0) / u_xlat19.x;
					            u_xlat11 = u_xlat11 * u_xlat8.x;
					            u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
					            u_xlat8.x = u_xlat11 * -2.0 + 3.0;
					            u_xlat11 = u_xlat11 * u_xlat11;
					            u_xlat11 = u_xlat11 * u_xlat8.x;
					            u_xlat5 = u_xlat5 * vec4(0.5, 0.5, 0.5, 0.5) + (-_DuotoneColTwo);
					            u_xlat5 = vec4(u_xlat11) * u_xlat5 + _DuotoneColTwo;
					            u_xlat5 = (bool(u_xlatb14)) ? u_xlat6 : u_xlat5;
					            u_xlat5 = (u_xlatb3.x) ? u_xlat7 : u_xlat5;
					            u_xlat2 = (bool(u_xlatb0)) ? u_xlat5 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVignette);
					            u_xlatb11 = _VigAdv==0.0;
					            u_xlat11 = (u_xlatb11) ? _VigX : _VigY;
					            u_xlat3.xy = u_xlat3.zw + vec2(-0.5, -0.5);
					            u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					            u_xlat3.x = (-u_xlat3.x) * _VigX + 1.0;
					            u_xlat11 = (-u_xlat3.y) * u_xlat11 + 1.0;
					            u_xlat11 = u_xlat11 * u_xlat3.x;
					            u_xlat5 = vec4(u_xlat11) * u_xlat2;
					            u_xlat4 = (bool(u_xlatb0)) ? u_xlat5 : u_xlat2;
					            u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleHSVRainbow);
					            u_xlat11 = u_xlat3.z * _ToggleHSVRainbowY;
					            u_xlat11 = _Time.y * _HSVRainbowTime + u_xlat11;
					            u_xlat11 = u_xlat3.w * _ToggleHSVRainbowX + u_xlat11;
					            u_xlat11 = u_xlat11 * _HSVRainbowHue;
					            u_xlat2.xyz = vec3(u_xlat11) * vec3(6.0, 6.0, 6.0) + vec3(0.0, 4.0, 2.0);
					            u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					            u_xlatb3.xyz = greaterThanEqual(u_xlat2.xyzx, (-u_xlat2.xyzx)).xyz;
					            u_xlat2.xyz = fract(abs(u_xlat2.xyz));
					            {
					                vec4 hlslcc_movcTemp = u_xlat2;
					                hlslcc_movcTemp.x = (u_xlatb3.x) ? u_xlat2.x : (-u_xlat2.x);
					                hlslcc_movcTemp.y = (u_xlatb3.y) ? u_xlat2.y : (-u_xlat2.y);
					                hlslcc_movcTemp.z = (u_xlatb3.z) ? u_xlat2.z : (-u_xlat2.z);
					                u_xlat2 = hlslcc_movcTemp;
					            }
					            u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
					            u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
					            u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
					            u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					            u_xlat2.xyz = (-u_xlat2.xyz) * vec3(2.0, 2.0, 2.0) + vec3(3.0, 3.0, 3.0);
					            u_xlat2.xyz = u_xlat3.xyz * u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
					            u_xlat2.xyz = vec3(vec3(_HSVRainbowSat, _HSVRainbowSat, _HSVRainbowSat)) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					            u_xlat2.xyz = u_xlat2.xyz * vec3(_HSVRainbowLight);
					            u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
					            u_xlat4.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat4.xyz;
					        //ENDIF
					        }
					        u_xlatb0 = _AllowFadingFalloff==1.0;
					        u_xlatb0 = u_xlatb0 && u_xlatb33;
					        if(u_xlatb0){
					            u_xlat2 = (-u_xlat10_1) + u_xlat4;
					            SV_Target0 = vec4(u_xlat22) * u_xlat2 + u_xlat10_1;
					            return;
					        } else {
					            SV_Target0 = u_xlat4;
					            return;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_LukaSecondPass"
		}
		Pass {
			Name "LSONGPASSMAINSF"
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 82271
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[19];
						float _ToggleZoom;
						vec4 unused_0_5[5];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat7;
					bool u_xlatb7;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat7 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlatb7 = u_xlat7>=_FalloffRange;
					    if(u_xlatb7){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb7 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb10 = _ToggleZoom==1.0;
					        u_xlatb7 = u_xlatb10 || u_xlatb7;
					        if(u_xlatb7){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            vs_TEXCOORD0.xy = u_xlat2.xx + u_xlat2.yz;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[19];
						float _ToggleZoom;
						vec4 unused_0_5[5];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec3 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					bool u_xlatb2;
					int u_xlati7;
					vec2 u_xlat8;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlati7 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					    u_xlat1.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat2.xy;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati7].xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlatb10 = u_xlat10>=_FalloffRange;
					    if(u_xlatb10){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb10 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb2 = _ToggleZoom==1.0;
					        u_xlatb10 = u_xlatb10 || u_xlatb2;
					        if(u_xlatb10){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            u_xlat2.xy = u_xlat2.xx + u_xlat2.yz;
					            u_xlat8.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					            vs_TEXCOORD0.xy = u_xlat2.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat8.xy;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _emptyTex_ST;
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowScalarFalloff;
						float _ToggleTwist;
						float _TwistValue;
						float _TwistOffset;
						float _ShakeSpeed;
						float _ShakeSpeed2;
						float _ShakeStrength;
						float _ShakeStrength2;
						float _ToggleShake;
						float _ToggleXYShake;
						float _ToggleRotater;
						float _ToggleRotaterAnimate;
						float _RotaterValue;
						float _RotaterSpin;
						float _ToggleDistort;
						float _DistortAmount;
						float _DistortOffset;
						float _ToggleDistortAnimate;
						float _DistortRedSpeed;
						float _ToggleDistortAdvControl;
						float _DistortYAnim;
						float _DistortXAnim;
						float _DistortTileAnim;
						vec4 _RedMap_ST;
						float _ToggleScreenpull;
						float _ScreenpullStrength;
						float _ScreenpullMode;
						float _ScreenpullStrengthTwo;
						vec4 _ScreenpullMap_ST;
						float _ToggleDizzyEffect;
						float _DizzyMode;
						float _DizzyAmountValue;
						float _DizzyRotationSpeed;
						float _DizzyDirection;
						float _dizcosXRValue;
						float _dizsinYRValue;
						float _ToggleSplitShake;
						float _SSAllowVerticalShake;
						float _SSAllowHorizontalShake;
						float _SSAllowVerticalBlur;
						float _SSAllowHorizontalBlur;
						float _SSValue;
						float _SSSpeed;
						float _SSValueVert;
						float _SSSpeedVert;
						float _SSTransparency;
						float _runPassTwoToggle;
						float _ToggleBulge;
						float _OwOStrength;
						float _ToggleCircularShake;
						float _CircShakeSpeed;
						float _CircShakeStr;
						float _ToggleDivide;
						float _DivideL;
						float _DivideR;
						float _ToggleMultiScreen;
						float _ScreensXRow;
						float _ScreensYRow;
						float _ToggleMultiFalloff;
						float _ToggleMagnitude;
						float _MagnitudeZoom;
						float _MagnitudeShake;
						float _ToggleMagRanZoom;
						float _ToggleEdgeDistort;
						float _EdgeDisX;
						float _EdgeDisY;
						float _ToggleEdgeDisRotate;
						float _EdgeDisRotStr;
						float _EdgeDisRotSpeed;
						float _ToggleSwirl;
						float _SwirlPower;
						float _SwirlAngle;
						float _SwirlCenterX;
						float _SwirlCenterY;
						float _SwirlRadius;
						float _ToggleSplice;
						float _SpliceTop;
						float _SpliceBot;
						float _SpliceXLimit;
						float _SpliceLeft;
						float _SpliceRight;
						float _SpliceYLimit;
						float _SpliceFix;
						float _ToggleUpsideDown;
						float _ToggleScreenFlip;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _emptyTex;
					uniform  sampler2D _RedMap;
					uniform  sampler2D _LukaSecondPass;
					uniform  sampler2D _ScreenpullMap;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					ivec2 u_xlati2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					bvec3 u_xlatb5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					vec2 u_xlat9;
					bool u_xlatb9;
					vec3 u_xlat10;
					bool u_xlatb10;
					vec3 u_xlat11;
					float u_xlat12;
					bvec3 u_xlatb12;
					float u_xlat13;
					vec2 u_xlat17;
					bool u_xlatb17;
					vec2 u_xlat18;
					bool u_xlatb18;
					vec2 u_xlat19;
					vec2 u_xlat20;
					bvec2 u_xlatb20;
					float u_xlat21;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					void main()
					{
					    u_xlat0.yz = vs_TEXCOORD0.yx / vs_TEXCOORD0.ww;
					    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb9 = u_xlat1.x>=_FalloffRange;
					    if(u_xlatb9){
					        SV_Target0 = texture(_LukaFirstPass, u_xlat0.zy);
					        return;
					    } else {
					        u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassTwoToggle);
					        if(u_xlatb9){
					            u_xlatb9 = _AllowSmartFalloff==1.0;
					            u_xlat1.x = max(u_xlat1.x, _SmartFalloffMin);
					            u_xlat1.x = min(u_xlat1.x, _SmartFalloffMax);
					            u_xlat1.x = u_xlat1.x + (-_SmartFalloffMin);
					            u_xlat1.x = u_xlat1.x / _SmartFalloffMin;
					            u_xlat1.x = (-u_xlat1.x) + 1.0;
					            u_xlatb17 = u_xlat1.x<0.0;
					            u_xlatb25 = 1.0<u_xlat1.x;
					            u_xlat1.x = (u_xlatb25) ? 1.0 : u_xlat1.x;
					            u_xlat1.x = (u_xlatb17) ? 0.0 : u_xlat1.x;
					            u_xlat1.x = (u_xlatb9) ? u_xlat1.x : 1.0;
					            u_xlatb2.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleScreenFlip, _ToggleUpsideDown, _SpliceFix, _ToggleScreenFlip)).xyz;
					            u_xlat17.xy = (-u_xlat0.zy) + vec2(1.0, 1.0);
					            {
					                vec2 hlslcc_movcTemp = u_xlat17;
					                hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat17.x : u_xlat0.z;
					                hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat17.y : u_xlat0.y;
					                u_xlat17 = hlslcc_movcTemp;
					            }
					            u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleBulge, _ToggleCircularShake, _ToggleBulge, _ToggleBulge)).xy;
					            u_xlat26 = u_xlat1.x * _OwOStrength;
					            u_xlat26 = (u_xlatb9) ? u_xlat26 : _OwOStrength;
					            u_xlat3.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					            u_xlat19.x = dot(u_xlat3.xy, u_xlat3.xy);
					            u_xlat19.x = sqrt(u_xlat19.x);
					            u_xlat19.x = (-u_xlat19.x) + 1.0;
					            u_xlat26 = u_xlat26 * u_xlat19.x;
					            u_xlat3.xy = u_xlat3.xy / vec2(u_xlat26);
					            u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleTwist);
					            u_xlatb26 = _AllowScalarFalloff==1.0;
					            u_xlatb26 = u_xlatb9 && u_xlatb26;
					            u_xlat3.xy = u_xlat1.xx * vec2(_TwistValue, _TwistOffset);
					            u_xlat3.xy = (bool(u_xlatb26)) ? u_xlat3.xy : vec2(_TwistValue, _TwistOffset);
					            u_xlat26 = u_xlat17.x * u_xlat3.x;
					            u_xlat3.xy = vec2(u_xlat26) * u_xlat3.yy + u_xlat17.xy;
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleShake, _ToggleShake, _ToggleShake, _ToggleRotater)).xw;
					            if(u_xlatb2.x){
					                u_xlat3.xy = u_xlat17.xy * _emptyTex_ST.xy + _emptyTex_ST.zw;
					                u_xlat10_3 = texture(_emptyTex, u_xlat3.xy);
					                u_xlat19.xy = u_xlat1.xx * vec2(_ShakeStrength, _ShakeStrength2);
					                u_xlat19.xy = (bool(u_xlatb9)) ? u_xlat19.xy : vec2(_ShakeStrength, _ShakeStrength2);
					                u_xlat4.xy = vec2(_ShakeSpeed, _ShakeSpeed2) * _Time.ww;
					                u_xlat4.xy = sin(u_xlat4.xy);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleXYShake);
					                u_xlat20.x = u_xlat19.x * u_xlat4.x;
					                u_xlat19.xy = u_xlat19.xy * u_xlat4.xy + u_xlat17.xy;
					                u_xlat3.xy = u_xlat10_3.xy * u_xlat20.xx + u_xlat17.xy;
					                u_xlat17.xy = (u_xlatb2.x) ? u_xlat19.xy : u_xlat3.xy;
					            //ENDIF
					            }
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleMagnitude);
					            if(u_xlatb2.x){
					                u_xlat2.x = _MagnitudeZoom * 0.0500000007;
					                u_xlat3.x = _MagnitudeZoom * 0.0500000007 + 0.5;
					                u_xlat11.x = dot(vec2(vec2(_MagnitudeShake, _MagnitudeShake)), vec2(12.9898005, 78.2330017));
					                u_xlat11.x = sin(u_xlat11.x);
					                u_xlat11.x = u_xlat11.x * 43758.5469;
					                u_xlat11.x = fract(u_xlat11.x);
					                u_xlat19.x = (-_MagnitudeShake) + 1.0;
					                u_xlat19.x = dot(u_xlat19.xx, vec2(12.9898005, 78.2330017));
					                u_xlat11.y = sin(u_xlat19.x);
					                u_xlat11.xy = u_xlat11.xy * vec2(0.166666672, 43758.5469);
					                u_xlat3.z = fract(u_xlat11.y);
					                u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleMagRanZoom);
					                u_xlat4.x = dot(vec2(vec2(_MagnitudeZoom, _MagnitudeZoom)), vec2(12.9898005, 78.2330017));
					                u_xlat4.x = sin(u_xlat4.x);
					                u_xlat4.x = u_xlat4.x * 43758.5469;
					                u_xlat4.x = fract(u_xlat4.x);
					                u_xlatb12.x = u_xlat4.x<1.0;
					                u_xlat20.x = (-u_xlat4.x) + 1.0;
					                u_xlat20.x = u_xlat20.x * 2.0 + u_xlat4.x;
					                u_xlat4.x = (u_xlatb12.x) ? u_xlat20.x : u_xlat4.x;
					                u_xlat4.x = u_xlat3.x * u_xlat4.x;
					                u_xlat4.x = (u_xlatb27) ? u_xlat4.x : u_xlat3.x;
					                u_xlat3.x = u_xlat11.x * _MagnitudeShake;
					                u_xlat3.xz = u_xlat3.xz * vec2(3.14159274, 0.166666672);
					                u_xlat27 = _MagnitudeShake * _Time.y;
					                u_xlat5.x = sin(u_xlat27);
					                u_xlat6.x = cos(u_xlat27);
					                u_xlat27 = _Time.y * u_xlat6.x + u_xlat3.x;
					                u_xlat27 = sin(u_xlat27);
					                u_xlat3.x = _Time.y * u_xlat5.x + u_xlat3.x;
					                u_xlat3.x = cos(u_xlat3.x);
					                u_xlat27 = u_xlat2.x * u_xlat27;
					                u_xlat4.y = u_xlat11.x * u_xlat27;
					                u_xlat2.x = u_xlat2.x * u_xlat3.x;
					                u_xlat4.z = u_xlat3.z * u_xlat2.x;
					                u_xlat11.yz = u_xlat1.xx * u_xlat4.yz;
					                u_xlat11.x = u_xlat1.x * u_xlat4.x + 1.0;
					                u_xlat3.xyz = (bool(u_xlatb9)) ? u_xlat11.xyz : u_xlat4.xyz;
					                u_xlat4.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					                u_xlat3.xw = u_xlat4.xy / u_xlat3.xx;
					                u_xlat3.xw = u_xlat3.xw + vec2(0.5, 0.5);
					                u_xlat17.xy = u_xlat3.zy + u_xlat3.xw;
					            //ENDIF
					            }
					            u_xlat2.x = _CircShakeStr + -500.0;
					            u_xlat2.x = u_xlat1.x * u_xlat2.x + 500.0;
					            u_xlat2.x = (u_xlatb9) ? u_xlat2.x : _CircShakeStr;
					            u_xlat3.x = _CircShakeSpeed * _Time.y;
					            u_xlat4.x = sin(u_xlat3.x);
					            u_xlat5.x = cos(u_xlat3.x);
					            u_xlat3.x = sin((-u_xlat3.x));
					            u_xlat3.y = u_xlat5.x;
					            u_xlat3.z = u_xlat4.x;
					            u_xlat4.x = dot(vec2(0.707106769, 0.707106769), u_xlat3.yz);
					            u_xlat4.y = dot(vec2(0.707106769, 0.707106769), u_xlat3.xy);
					            u_xlat3.xy = u_xlat4.xy / u_xlat2.xx;
					            u_xlat3.xy = u_xlat17.xy + u_xlat3.xy;
					            u_xlat17.xy = (u_xlatb2.y) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.x = _ToggleRotaterAnimate==1.0;
					            u_xlat10.x = _RotaterSpin * _Time.w;
					            u_xlat2.x = (u_xlatb2.x) ? u_xlat10.x : 1.0;
					            u_xlat10.x = u_xlat1.x * _RotaterValue;
					            u_xlat10.x = (u_xlatb9) ? u_xlat10.x : _RotaterValue;
					            u_xlat2.x = u_xlat10.x * u_xlat2.x;
					            u_xlat3.x = cos(u_xlat2.x);
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat11.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					            u_xlat4.x = (-u_xlat2.x);
					            u_xlat4.y = u_xlat3.x;
					            u_xlat4.z = u_xlat2.x;
					            u_xlat2.x = dot(u_xlat11.xy, u_xlat4.yz);
					            u_xlat2.y = dot(u_xlat11.xy, u_xlat4.xy);
					            u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					            u_xlat3.zw = (u_xlatb2.w) ? u_xlat2.xy : u_xlat17.xy;
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDistort);
					            if(u_xlatb17){
					                u_xlat2.x = u_xlat1.x * _DistortAmount;
					                u_xlat2.y = u_xlat1.x * _DistortOffset;
					                u_xlat4.x = _DistortAmount;
					                u_xlat4.y = _DistortOffset;
					                u_xlat17.xy = (bool(u_xlatb9)) ? u_xlat2.xy : u_xlat4.xy;
					                u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleDistortAnimate, _ToggleDistortAdvControl, _ToggleDistortAnimate, _ToggleDistortAnimate)).xy;
					                u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
					                if(u_xlatb2.x){
					                    u_xlatb2.x = _ToggleDistortAnimate==1.0;
					                    u_xlat10.x = _DistortRedSpeed * _Time.y;
					                    u_xlat10.xz = u_xlat10.xx * vec2(_DistortXAnim, _DistortYAnim) + u_xlat3.zw;
					                    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_DistortYAnim, _DistortXAnim);
					                    u_xlat20.x = u_xlat4.x * _DistortTileAnim;
					                    u_xlat5.y = floor(u_xlat20.x);
					                    u_xlat5.x = u_xlat5.y * _DistortYAnim;
					                    u_xlat20.xy = u_xlat3.zw + u_xlat5.xy;
					                    u_xlat4.xy = u_xlat4.xy * u_xlat20.xy;
					                    u_xlat2.xy = (u_xlatb2.x) ? u_xlat10.xz : u_xlat4.xy;
					                    u_xlat2.xy = u_xlat2.xy * _RedMap_ST.xy + _RedMap_ST.zw;
					                    u_xlat4 = texture(_RedMap, u_xlat2.xy);
					                } else {
					                    u_xlat2.xy = u_xlat3.zw * _RedMap_ST.xy + _RedMap_ST.zw;
					                    u_xlat4 = texture(_RedMap, u_xlat2.xy);
					                //ENDIF
					                }
					                u_xlat2.xy = u_xlat17.xx * u_xlat4.xy;
					                u_xlat3.zw = u_xlat2.xy * u_xlat17.yy + u_xlat3.zw;
					            //ENDIF
					            }
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgeDistort);
					            if(u_xlatb17){
					                u_xlat10_4 = texture(_LukaSecondPass, u_xlat3.zw);
					                u_xlat17.xy = u_xlat1.xx * vec2(_EdgeDisX, _EdgeDisY);
					                u_xlat17.xy = (bool(u_xlatb9)) ? u_xlat17.xy : vec2(_EdgeDisX, _EdgeDisY);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgeDisRotate);
					                u_xlat10.x = _EdgeDisRotSpeed * _Time.y;
					                u_xlat5.x = sin(u_xlat10.x);
					                u_xlat6.x = cos(u_xlat10.x);
					                u_xlat7.x = sin((-u_xlat10.x));
					                u_xlat7.y = u_xlat6.x;
					                u_xlat7.z = u_xlat5.x;
					                u_xlat5.x = dot(vec2(0.707106769, 0.707106769), u_xlat7.yz);
					                u_xlat5.y = dot(vec2(0.707106769, 0.707106769), u_xlat7.xy);
					                u_xlat10.xz = u_xlat17.xy * u_xlat10_4.xy;
					                u_xlat20.xy = u_xlat5.xy / vec2(vec2(_EdgeDisRotStr, _EdgeDisRotStr));
					                u_xlat10.xz = u_xlat10.xz * u_xlat20.xy + u_xlat3.zw;
					                u_xlat17.xy = u_xlat10_4.xy * u_xlat17.xy + u_xlat3.zw;
					                u_xlat3.zw = (u_xlatb2.x) ? u_xlat10.xz : u_xlat17.xy;
					            //ENDIF
					            }
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleScreenpull);
					            if(u_xlatb17){
					                u_xlat17.x = u_xlat1.x * _ScreenpullStrength;
					                u_xlat17.x = (u_xlatb9) ? u_xlat17.x : _ScreenpullStrength;
					                u_xlat2.xy = vs_TEXCOORD0.xy * _ScreenpullMap_ST.xy + _ScreenpullMap_ST.zw;
					                u_xlat10_4 = texture(_ScreenpullMap, u_xlat2.xy);
					                u_xlat5.z = u_xlat3.w + _ScreenpullStrengthTwo;
					                u_xlat5.xy = u_xlat17.xx + u_xlat3.zw;
					                u_xlatb2.xyw = equal(vec4(vec4(_ScreenpullMode, _ScreenpullMode, _ScreenpullMode, _ScreenpullMode)), vec4(1.0, 2.0, 0.0, 3.0)).xyw;
					                u_xlat17.xy = u_xlat10_4.xy * u_xlat17.xx + u_xlat3.zw;
					                u_xlat17.xy = (u_xlatb2.w) ? u_xlat17.xy : u_xlat3.zw;
					                u_xlat17.xy = (u_xlatb2.y) ? u_xlat5.xy : u_xlat17.xy;
					                u_xlat3.zw = (u_xlatb2.x) ? u_xlat5.xz : u_xlat17.xy;
					            //ENDIF
					            }
					            u_xlat2.x = u_xlat1.x * _SSValue;
					            u_xlat2.y = u_xlat1.x * _SSValueVert;
					            u_xlat3.x = _SSValue;
					            u_xlat3.y = _SSValueVert;
					            u_xlat4.xy = (bool(u_xlatb9)) ? u_xlat2.xy : u_xlat3.xy;
					            u_xlat17.xy = u_xlat4.xy * vec2(0.200000003, 0.200000003);
					            u_xlat2.x = _SSSpeed * _Time.w;
					            u_xlat2.x = u_xlat2.x * 3.79999995;
					            u_xlat10.x = _SSSpeedVert * _Time.w;
					            u_xlat2.y = u_xlat10.x * 3.79999995;
					            u_xlat2.xy = sin(u_xlat2.xy);
					            u_xlatb5.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleSplitShake, _SSAllowHorizontalShake, _SSAllowVerticalShake, _ToggleSplitShake)).xyz;
					            u_xlat17.x = u_xlat17.x * u_xlat2.x + u_xlat3.z;
					            u_xlat4.z = (u_xlatb5.y) ? u_xlat17.x : u_xlat3.z;
					            u_xlat17.x = u_xlat17.y * u_xlat2.y + u_xlat3.w;
					            u_xlat4.w = (u_xlatb5.z) ? u_xlat17.x : u_xlat3.w;
					            u_xlat3 = (u_xlatb5.x) ? u_xlat4 : u_xlat3;
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSplice);
					            u_xlatb2.xy = lessThan(vec4(_SpliceXLimit, _SpliceYLimit, _SpliceXLimit, _SpliceXLimit), u_xlat3.wzww).xy;
					            u_xlat25 = (u_xlatb2.x) ? _SpliceTop : _SpliceBot;
					            u_xlat2.x = (u_xlatb2.y) ? _SpliceLeft : _SpliceRight;
					            u_xlat4.x = u_xlat25 + u_xlat3.z;
					            u_xlat4.y = u_xlat2.x + u_xlat3.w;
					            u_xlatb2.xy = greaterThanEqual(vec4(2.0, 2.0, 0.0, 0.0), u_xlat4.xyxx).xy;
					            u_xlatb20.xy = greaterThanEqual(u_xlat4.xyxy, vec4(1.0, 1.0, 1.0, 1.0)).xy;
					            u_xlati2.xy = ivec2((uvec2(u_xlatb2.xy) * 0xffffffffu) & (uvec2(u_xlatb20.xy) * 0xffffffffu));
					            u_xlat20.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					            u_xlat2.x = (u_xlati2.x != 0) ? u_xlat20.x : u_xlat4.x;
					            u_xlat2.y = (u_xlati2.y != 0) ? u_xlat20.y : u_xlat4.y;
					            u_xlat2.xy = (u_xlatb2.z) ? u_xlat2.xy : u_xlat4.xy;
					            u_xlat17.xy = (bool(u_xlatb17)) ? u_xlat2.xy : u_xlat3.zw;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDivide);
					            u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowSmartFalloff);
					            u_xlat4.x = u_xlat1.x * _DivideL;
					            u_xlat4.z = u_xlat1.x * _DivideR + -2.0;
					            u_xlat18.xy = (bool(u_xlatb10)) ? u_xlat4.xz : vec2(_DivideL, _DivideR);
					            u_xlat18.x = (-u_xlat17.y) + u_xlat18.x;
					            u_xlatb18 = u_xlat17.x>=u_xlat18.x;
					            u_xlat4.x = u_xlatb18 ? 0.0151515156 : float(0.0);
					            u_xlat18.x = u_xlat17.x + u_xlat18.y;
					            u_xlatb18 = u_xlat17.y>=u_xlat18.x;
					            u_xlat4.y = u_xlatb18 ? 0.0151515156 : float(0.0);
					            u_xlat18.xy = u_xlat17.xy + u_xlat4.xy;
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat18.xy : u_xlat17.xy;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSwirl);
					            u_xlat18.x = u_xlat1.x * _SwirlPower;
					            u_xlat9.x = (u_xlatb9) ? u_xlat18.x : _SwirlPower;
					            u_xlat18.xy = (-u_xlat17.xy) + vec2(_SwirlCenterX, _SwirlCenterY);
					            u_xlat18.x = dot(u_xlat18.xy, u_xlat18.xy);
					            u_xlat18.x = sqrt(u_xlat18.x);
					            u_xlatb26 = u_xlat18.x<_SwirlRadius;
					            u_xlat19.xy = u_xlat17.xy + (-vec2(_SwirlCenterX, _SwirlCenterY));
					            u_xlat18.x = (-u_xlat18.x) + _SwirlRadius;
					            u_xlat18.x = u_xlat18.x / _SwirlRadius;
					            u_xlat18.x = u_xlat18.x * u_xlat18.x;
					            u_xlat18.x = u_xlat18.x * _SwirlAngle;
					            u_xlat9.x = u_xlat9.x * u_xlat18.x;
					            u_xlat4.x = sin(u_xlat9.x);
					            u_xlat5.x = cos(u_xlat9.x);
					            u_xlat6.x = (-u_xlat4.x);
					            u_xlat6.y = u_xlat5.x;
					            u_xlat5.x = dot(u_xlat19.yx, u_xlat6.xy);
					            u_xlat6.z = u_xlat4.x;
					            u_xlat5.y = dot(u_xlat19.yx, u_xlat6.yz);
					            u_xlat19.xy = u_xlat5.xy + vec2(_SwirlCenterX, _SwirlCenterY);
					            u_xlat18.xy = (bool(u_xlatb26)) ? u_xlat19.xy : u_xlat17.xy;
					            u_xlat9.xy = (u_xlatb2.x) ? u_xlat18.xy : u_xlat17.xy;
					            u_xlatb2.xz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleMultiScreen, _ToggleMultiScreen, _ToggleMultiFalloff, _ToggleMultiScreen)).xz;
					            u_xlatb25 = u_xlatb2.z && u_xlatb10;
					            u_xlat10.xy = u_xlat1.xx * vec2(_ScreensXRow, _ScreensYRow) + vec2(1.0, 1.0);
					            u_xlat19.xy = max(vec2(_ScreensXRow, _ScreensYRow), vec2(1.0, 1.0));
					            u_xlat10.xy = min(u_xlat10.xy, u_xlat19.xy);
					            u_xlat1.xw = (bool(u_xlatb25)) ? u_xlat10.xy : vec2(_ScreensXRow, _ScreensYRow);
					            u_xlat10.xy = u_xlat9.xy * u_xlat1.xw;
					            u_xlat10.xy = floor(u_xlat10.xy);
					            u_xlat10.xy = u_xlat10.xy / u_xlat1.xw;
					            u_xlat10.xy = u_xlat9.xy + (-u_xlat10.xy);
					            u_xlat1.xw = u_xlat1.xw * u_xlat10.xy;
					            u_xlat0.yz = (u_xlatb2.x) ? u_xlat1.wx : u_xlat9.yx;
					        } else {
					            u_xlat3.x = _SSValue;
					            u_xlat3.y = _SSValueVert;
					        //ENDIF
					        }
					        u_xlat1 = texture(_LukaSecondPass, u_xlat0.zy);
					        u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDizzyEffect);
					        if(u_xlatb2.x){
					            u_xlatb2.x = _DizzyMode==1.0;
					            if(u_xlatb2.x){
					                u_xlat2.x = _DizzyRotationSpeed * _Time.x;
					                u_xlat4.x = cos(u_xlat2.x);
					                u_xlat2.x = sin(u_xlat2.x);
					                u_xlat10.x = _DizzyAmountValue * _Time.x;
					                u_xlat10.x = sin(u_xlat10.x);
					            } else {
					                u_xlatb18 = _DizzyMode==2.0;
					                if(u_xlatb18){
					                    u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                    u_xlat5.x = sin(u_xlat18.x);
					                    u_xlat2.x = cos(u_xlat18.x);
					                    u_xlat4.x = u_xlat5.x / u_xlat2.x;
					                    u_xlat18.x = _DizzyAmountValue * _Time.x;
					                    u_xlat5.x = sin(u_xlat18.x);
					                    u_xlat6.x = cos(u_xlat18.x);
					                    u_xlat10.x = u_xlat5.x / u_xlat6.x;
					                } else {
					                    u_xlatb18 = _DizzyMode==3.0;
					                    if(u_xlatb18){
					                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                        u_xlat2.x = sin(u_xlat18.x);
					                        u_xlat4.x = cos(u_xlat18.x);
					                        u_xlat18.x = _DizzyAmountValue * _Time.x;
					                        u_xlat10.x = sin(u_xlat18.x);
					                    } else {
					                        u_xlatb18 = _DizzyMode==4.0;
					                        if(u_xlatb18){
					                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                            u_xlat5.x = sin(u_xlat18.x);
					                            u_xlat4.x = cos(u_xlat18.x);
					                            u_xlat2.x = u_xlat5.x / u_xlat4.x;
					                            u_xlat18.x = _DizzyAmountValue * _Time.x;
					                            u_xlat5.x = sin(u_xlat18.x);
					                            u_xlat6.x = cos(u_xlat18.x);
					                            u_xlat10.x = u_xlat5.x / u_xlat6.x;
					                        } else {
					                            u_xlatb18 = _DizzyMode==5.0;
					                            if(u_xlatb18){
					                                u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                u_xlat2.x = sin(u_xlat18.x);
					                                u_xlat4.x = cos(u_xlat18.x);
					                                u_xlat18.x = _DizzyAmountValue * _Time.x;
					                                u_xlat10.x = sin(u_xlat18.x);
					                            } else {
					                                u_xlatb18 = _DizzyMode==6.0;
					                                if(u_xlatb18){
					                                    u_xlatb18 = _dizcosXRValue==0.0;
					                                    if(u_xlatb18){
					                                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                        u_xlat4.x = sin(u_xlat18.x);
					                                    } else {
					                                        u_xlatb18 = _dizcosXRValue==1.0;
					                                        if(u_xlatb18){
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat4.x = cos(u_xlat18.x);
					                                        } else {
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat5.x = sin(u_xlat18.x);
					                                            u_xlat6.x = cos(u_xlat18.x);
					                                            u_xlat26 = u_xlat5.x / u_xlat6.x;
					                                            u_xlat19.x = u_xlat18.x * 1.44269502;
					                                            u_xlat27 = exp2(u_xlat19.x);
					                                            u_xlat19.x = exp2((-u_xlat19.x));
					                                            u_xlat12 = (-u_xlat19.x) + u_xlat27;
					                                            u_xlat19.x = u_xlat19.x + u_xlat27;
					                                            u_xlat19.x = float(1.0) / u_xlat19.x;
					                                            u_xlat19.x = u_xlat19.x * u_xlat12;
					                                            u_xlatb12.xyz = equal(vec4(vec4(_dizcosXRValue, _dizcosXRValue, _dizcosXRValue, _dizcosXRValue)), vec4(2.0, 3.0, 4.0, 4.0)).xyz;
					                                            u_xlat27 = -abs(u_xlat18.x) + 1.0;
					                                            u_xlat27 = sqrt(u_xlat27);
					                                            u_xlat13 = abs(u_xlat18.x) * -0.0187292993 + 0.0742610022;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + -0.212114394;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + 1.57072878;
					                                            u_xlat21 = u_xlat27 * u_xlat13;
					                                            u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
					                                            u_xlatb18 = u_xlat18.x<(-u_xlat18.x);
					                                            u_xlat18.x = u_xlatb18 ? u_xlat21 : float(0.0);
					                                            u_xlat18.x = u_xlat13 * u_xlat27 + u_xlat18.x;
					                                            u_xlat18.x = (u_xlatb12.z) ? u_xlat18.x : u_xlat5.x;
					                                            u_xlat18.x = (u_xlatb12.y) ? u_xlat19.x : u_xlat18.x;
					                                            u_xlat4.x = (u_xlatb12.x) ? u_xlat26 : u_xlat18.x;
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                    u_xlatb18 = _dizsinYRValue==0.0;
					                                    if(u_xlatb18){
					                                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                        u_xlat2.x = sin(u_xlat18.x);
					                                    } else {
					                                        u_xlatb18 = _dizsinYRValue==1.0;
					                                        if(u_xlatb18){
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat2.x = cos(u_xlat18.x);
					                                        } else {
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat5.x = sin(u_xlat18.x);
					                                            u_xlat6.x = cos(u_xlat18.x);
					                                            u_xlat26 = u_xlat5.x / u_xlat6.x;
					                                            u_xlat19.x = u_xlat18.x * 1.44269502;
					                                            u_xlat27 = exp2(u_xlat19.x);
					                                            u_xlat19.x = exp2((-u_xlat19.x));
					                                            u_xlat12 = (-u_xlat19.x) + u_xlat27;
					                                            u_xlat19.x = u_xlat19.x + u_xlat27;
					                                            u_xlat19.x = float(1.0) / u_xlat19.x;
					                                            u_xlat19.x = u_xlat19.x * u_xlat12;
					                                            u_xlatb12.xyz = equal(vec4(_dizsinYRValue), vec4(2.0, 3.0, 4.0, 4.0)).xyz;
					                                            u_xlat27 = -abs(u_xlat18.x) + 1.0;
					                                            u_xlat27 = sqrt(u_xlat27);
					                                            u_xlat13 = abs(u_xlat18.x) * -0.0187292993 + 0.0742610022;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + -0.212114394;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + 1.57072878;
					                                            u_xlat21 = u_xlat27 * u_xlat13;
					                                            u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
					                                            u_xlatb18 = u_xlat18.x<(-u_xlat18.x);
					                                            u_xlat18.x = u_xlatb18 ? u_xlat21 : float(0.0);
					                                            u_xlat18.x = u_xlat13 * u_xlat27 + u_xlat18.x;
					                                            u_xlat18.x = (u_xlatb12.z) ? u_xlat18.x : u_xlat5.x;
					                                            u_xlat18.x = (u_xlatb12.y) ? u_xlat19.x : u_xlat18.x;
					                                            u_xlat2.x = (u_xlatb12.x) ? u_xlat26 : u_xlat18.x;
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                    u_xlat18.x = _DizzyAmountValue * _Time.x;
					                                    u_xlat10.x = sin(u_xlat18.x);
					                                } else {
					                                    u_xlat4.x = 0.0;
					                                    u_xlat2.x = float(0.0);
					                                    u_xlat10.x = float(0.0);
					                                //ENDIF
					                                }
					                            //ENDIF
					                            }
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlat0.x = u_xlat0.z + u_xlat10.x;
					            u_xlat18.x = _DizzyDirection * _DizzyDirection;
					            u_xlat18.x = inversesqrt(u_xlat18.x);
					            u_xlat18.x = u_xlat18.x * _DizzyDirection;
					            u_xlat5.x = u_xlat2.x * u_xlat18.x;
					            u_xlat5.y = u_xlat4.x * u_xlat18.x;
					            u_xlat0.yz = u_xlat10.xx * u_xlat5.yx + u_xlat0.yx;
					            u_xlat10_4 = texture(_LukaSecondPass, u_xlat0.zy);
					            u_xlat2.x = (-u_xlat10.x) * 0.5 + 1.0;
					            u_xlat1.xyz = u_xlat10_4.xyz;
					            u_xlat1 = u_xlat2.xxxx * u_xlat1;
					            SV_Target0.w = u_xlat1.w;
					        } else {
					            SV_Target0.w = u_xlat1.w;
					        //ENDIF
					        }
					        u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSplitShake);
					        if(u_xlatb25){
					            u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_SSAllowHorizontalBlur, _SSAllowVerticalBlur, _SSAllowHorizontalBlur, _SSAllowHorizontalBlur)).xy;
					            u_xlat25 = _SSSpeed * _Time.w;
					            u_xlat25 = sin(u_xlat25);
					            u_xlat25 = u_xlat25 * u_xlat3.x;
					            u_xlat25 = u_xlatb2.x ? u_xlat25 : float(0.0);
					            u_xlat2.x = _SSSpeedVert * _Time.w;
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x * u_xlat3.y;
					            u_xlat2.x = u_xlatb2.y ? u_xlat2.x : float(0.0);
					            u_xlat0.x = u_xlat0.z + u_xlat25;
					            u_xlat10_3 = texture(_LukaSecondPass, u_xlat0.xy);
					            u_xlat0.w = u_xlat0.y + u_xlat2.x;
					            u_xlat10_4 = texture(_LukaSecondPass, u_xlat0.zw);
					            u_xlat10_5 = texture(_LukaSecondPass, u_xlat0.zy);
					            u_xlat0.x = u_xlat0.z + (-u_xlat25);
					            u_xlat10_6 = texture(_LukaSecondPass, u_xlat0.xy);
					            u_xlat0.w = u_xlat0.y + (-u_xlat2.x);
					            u_xlat10_0 = texture(_LukaSecondPass, u_xlat0.zw);
					            u_xlat16_2.xyz = u_xlat10_3.xyz + u_xlat10_4.xyz;
					            u_xlat16_2.xyz = u_xlat10_5.xyz + u_xlat16_2.xyz;
					            u_xlat16_2.xyz = u_xlat10_6.xyz + u_xlat16_2.xyz;
					            u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
					            u_xlat16_0.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
					            u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.142857149, 0.142857149, 0.142857149) + (-u_xlat1.xyz);
					            SV_Target0.xyz = vec3(vec3(_SSTransparency, _SSTransparency, _SSTransparency)) * u_xlat0.xyz + u_xlat1.xyz;
					        } else {
					            SV_Target0.xyz = u_xlat1.xyz;
					        //ENDIF
					        }
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _emptyTex_ST;
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowScalarFalloff;
						float _ToggleTwist;
						float _TwistValue;
						float _TwistOffset;
						float _ShakeSpeed;
						float _ShakeSpeed2;
						float _ShakeStrength;
						float _ShakeStrength2;
						float _ToggleShake;
						float _ToggleXYShake;
						float _ToggleRotater;
						float _ToggleRotaterAnimate;
						float _RotaterValue;
						float _RotaterSpin;
						float _ToggleDistort;
						float _DistortAmount;
						float _DistortOffset;
						float _ToggleDistortAnimate;
						float _DistortRedSpeed;
						float _ToggleDistortAdvControl;
						float _DistortYAnim;
						float _DistortXAnim;
						float _DistortTileAnim;
						vec4 _RedMap_ST;
						float _ToggleScreenpull;
						float _ScreenpullStrength;
						float _ScreenpullMode;
						float _ScreenpullStrengthTwo;
						vec4 _ScreenpullMap_ST;
						float _ToggleDizzyEffect;
						float _DizzyMode;
						float _DizzyAmountValue;
						float _DizzyRotationSpeed;
						float _DizzyDirection;
						float _dizcosXRValue;
						float _dizsinYRValue;
						float _ToggleSplitShake;
						float _SSAllowVerticalShake;
						float _SSAllowHorizontalShake;
						float _SSAllowVerticalBlur;
						float _SSAllowHorizontalBlur;
						float _SSValue;
						float _SSSpeed;
						float _SSValueVert;
						float _SSSpeedVert;
						float _SSTransparency;
						float _runPassTwoToggle;
						float _ToggleBulge;
						float _OwOStrength;
						float _ToggleCircularShake;
						float _CircShakeSpeed;
						float _CircShakeStr;
						float _ToggleDivide;
						float _DivideL;
						float _DivideR;
						float _ToggleMultiScreen;
						float _ScreensXRow;
						float _ScreensYRow;
						float _ToggleMultiFalloff;
						float _ToggleMagnitude;
						float _MagnitudeZoom;
						float _MagnitudeShake;
						float _ToggleMagRanZoom;
						float _ToggleEdgeDistort;
						float _EdgeDisX;
						float _EdgeDisY;
						float _ToggleEdgeDisRotate;
						float _EdgeDisRotStr;
						float _EdgeDisRotSpeed;
						float _ToggleSwirl;
						float _SwirlPower;
						float _SwirlAngle;
						float _SwirlCenterX;
						float _SwirlCenterY;
						float _SwirlRadius;
						float _ToggleSplice;
						float _SpliceTop;
						float _SpliceBot;
						float _SpliceXLimit;
						float _SpliceLeft;
						float _SpliceRight;
						float _SpliceYLimit;
						float _SpliceFix;
						float _ToggleUpsideDown;
						float _ToggleScreenFlip;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _emptyTex;
					uniform  sampler2D _RedMap;
					uniform  sampler2D _LukaSecondPass;
					uniform  sampler2D _ScreenpullMap;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					int u_xlati1;
					vec2 u_xlat2;
					vec3 u_xlat16_2;
					ivec2 u_xlati2;
					bvec4 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec3 u_xlat5;
					vec4 u_xlat10_5;
					bvec3 u_xlatb5;
					vec3 u_xlat6;
					vec4 u_xlat10_6;
					vec3 u_xlat7;
					vec2 u_xlat9;
					bool u_xlatb9;
					vec3 u_xlat10;
					bool u_xlatb10;
					vec3 u_xlat11;
					float u_xlat12;
					bvec3 u_xlatb12;
					float u_xlat13;
					vec2 u_xlat17;
					bool u_xlatb17;
					vec2 u_xlat18;
					bool u_xlatb18;
					vec2 u_xlat19;
					vec2 u_xlat20;
					bvec2 u_xlatb20;
					float u_xlat21;
					float u_xlat25;
					bool u_xlatb25;
					float u_xlat26;
					bool u_xlatb26;
					float u_xlat27;
					bool u_xlatb27;
					void main()
					{
					    u_xlat0.yz = vs_TEXCOORD0.yx / vs_TEXCOORD0.ww;
					    u_xlati1 = unity_StereoEyeIndex;
					    u_xlat1.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati1].xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlatb9 = u_xlat1.x>=_FalloffRange;
					    if(u_xlatb9){
					        SV_Target0 = texture(_LukaFirstPass, u_xlat0.zy);
					        return;
					    } else {
					        u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassTwoToggle);
					        if(u_xlatb9){
					            u_xlatb9 = _AllowSmartFalloff==1.0;
					            u_xlat1.x = max(u_xlat1.x, _SmartFalloffMin);
					            u_xlat1.x = min(u_xlat1.x, _SmartFalloffMax);
					            u_xlat1.x = u_xlat1.x + (-_SmartFalloffMin);
					            u_xlat1.x = u_xlat1.x / _SmartFalloffMin;
					            u_xlat1.x = (-u_xlat1.x) + 1.0;
					            u_xlatb17 = u_xlat1.x<0.0;
					            u_xlatb25 = 1.0<u_xlat1.x;
					            u_xlat1.x = (u_xlatb25) ? 1.0 : u_xlat1.x;
					            u_xlat1.x = (u_xlatb17) ? 0.0 : u_xlat1.x;
					            u_xlat1.x = (u_xlatb9) ? u_xlat1.x : 1.0;
					            u_xlatb2.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleScreenFlip, _ToggleUpsideDown, _SpliceFix, _ToggleScreenFlip)).xyz;
					            u_xlat17.xy = (-u_xlat0.zy) + vec2(1.0, 1.0);
					            {
					                vec2 hlslcc_movcTemp = u_xlat17;
					                hlslcc_movcTemp.x = (u_xlatb2.x) ? u_xlat17.x : u_xlat0.z;
					                hlslcc_movcTemp.y = (u_xlatb2.y) ? u_xlat17.y : u_xlat0.y;
					                u_xlat17 = hlslcc_movcTemp;
					            }
					            u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleBulge, _ToggleCircularShake, _ToggleBulge, _ToggleBulge)).xy;
					            u_xlat26 = u_xlat1.x * _OwOStrength;
					            u_xlat26 = (u_xlatb9) ? u_xlat26 : _OwOStrength;
					            u_xlat3.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					            u_xlat19.x = dot(u_xlat3.xy, u_xlat3.xy);
					            u_xlat19.x = sqrt(u_xlat19.x);
					            u_xlat19.x = (-u_xlat19.x) + 1.0;
					            u_xlat26 = u_xlat26 * u_xlat19.x;
					            u_xlat3.xy = u_xlat3.xy / vec2(u_xlat26);
					            u_xlat3.xy = u_xlat3.xy + vec2(0.5, 0.5);
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleTwist);
					            u_xlatb26 = _AllowScalarFalloff==1.0;
					            u_xlatb26 = u_xlatb9 && u_xlatb26;
					            u_xlat3.xy = u_xlat1.xx * vec2(_TwistValue, _TwistOffset);
					            u_xlat3.xy = (bool(u_xlatb26)) ? u_xlat3.xy : vec2(_TwistValue, _TwistOffset);
					            u_xlat26 = u_xlat17.x * u_xlat3.x;
					            u_xlat3.xy = vec2(u_xlat26) * u_xlat3.yy + u_xlat17.xy;
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.xw = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleShake, _ToggleShake, _ToggleShake, _ToggleRotater)).xw;
					            if(u_xlatb2.x){
					                u_xlat3.xy = u_xlat17.xy * _emptyTex_ST.xy + _emptyTex_ST.zw;
					                u_xlat10_3 = texture(_emptyTex, u_xlat3.xy);
					                u_xlat19.xy = u_xlat1.xx * vec2(_ShakeStrength, _ShakeStrength2);
					                u_xlat19.xy = (bool(u_xlatb9)) ? u_xlat19.xy : vec2(_ShakeStrength, _ShakeStrength2);
					                u_xlat4.xy = vec2(_ShakeSpeed, _ShakeSpeed2) * _Time.ww;
					                u_xlat4.xy = sin(u_xlat4.xy);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleXYShake);
					                u_xlat20.x = u_xlat19.x * u_xlat4.x;
					                u_xlat19.xy = u_xlat19.xy * u_xlat4.xy + u_xlat17.xy;
					                u_xlat3.xy = u_xlat10_3.xy * u_xlat20.xx + u_xlat17.xy;
					                u_xlat17.xy = (u_xlatb2.x) ? u_xlat19.xy : u_xlat3.xy;
					            //ENDIF
					            }
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleMagnitude);
					            if(u_xlatb2.x){
					                u_xlat2.x = _MagnitudeZoom * 0.0500000007;
					                u_xlat3.x = _MagnitudeZoom * 0.0500000007 + 0.5;
					                u_xlat11.x = dot(vec2(vec2(_MagnitudeShake, _MagnitudeShake)), vec2(12.9898005, 78.2330017));
					                u_xlat11.x = sin(u_xlat11.x);
					                u_xlat11.x = u_xlat11.x * 43758.5469;
					                u_xlat11.x = fract(u_xlat11.x);
					                u_xlat19.x = (-_MagnitudeShake) + 1.0;
					                u_xlat19.x = dot(u_xlat19.xx, vec2(12.9898005, 78.2330017));
					                u_xlat11.y = sin(u_xlat19.x);
					                u_xlat11.xy = u_xlat11.xy * vec2(0.166666672, 43758.5469);
					                u_xlat3.z = fract(u_xlat11.y);
					                u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleMagRanZoom);
					                u_xlat4.x = dot(vec2(vec2(_MagnitudeZoom, _MagnitudeZoom)), vec2(12.9898005, 78.2330017));
					                u_xlat4.x = sin(u_xlat4.x);
					                u_xlat4.x = u_xlat4.x * 43758.5469;
					                u_xlat4.x = fract(u_xlat4.x);
					                u_xlatb12.x = u_xlat4.x<1.0;
					                u_xlat20.x = (-u_xlat4.x) + 1.0;
					                u_xlat20.x = u_xlat20.x * 2.0 + u_xlat4.x;
					                u_xlat4.x = (u_xlatb12.x) ? u_xlat20.x : u_xlat4.x;
					                u_xlat4.x = u_xlat3.x * u_xlat4.x;
					                u_xlat4.x = (u_xlatb27) ? u_xlat4.x : u_xlat3.x;
					                u_xlat3.x = u_xlat11.x * _MagnitudeShake;
					                u_xlat3.xz = u_xlat3.xz * vec2(3.14159274, 0.166666672);
					                u_xlat27 = _MagnitudeShake * _Time.y;
					                u_xlat5.x = sin(u_xlat27);
					                u_xlat6.x = cos(u_xlat27);
					                u_xlat27 = _Time.y * u_xlat6.x + u_xlat3.x;
					                u_xlat27 = sin(u_xlat27);
					                u_xlat3.x = _Time.y * u_xlat5.x + u_xlat3.x;
					                u_xlat3.x = cos(u_xlat3.x);
					                u_xlat27 = u_xlat2.x * u_xlat27;
					                u_xlat4.y = u_xlat11.x * u_xlat27;
					                u_xlat2.x = u_xlat2.x * u_xlat3.x;
					                u_xlat4.z = u_xlat3.z * u_xlat2.x;
					                u_xlat11.yz = u_xlat1.xx * u_xlat4.yz;
					                u_xlat11.x = u_xlat1.x * u_xlat4.x + 1.0;
					                u_xlat3.xyz = (bool(u_xlatb9)) ? u_xlat11.xyz : u_xlat4.xyz;
					                u_xlat4.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					                u_xlat3.xw = u_xlat4.xy / u_xlat3.xx;
					                u_xlat3.xw = u_xlat3.xw + vec2(0.5, 0.5);
					                u_xlat17.xy = u_xlat3.zy + u_xlat3.xw;
					            //ENDIF
					            }
					            u_xlat2.x = _CircShakeStr + -500.0;
					            u_xlat2.x = u_xlat1.x * u_xlat2.x + 500.0;
					            u_xlat2.x = (u_xlatb9) ? u_xlat2.x : _CircShakeStr;
					            u_xlat3.x = _CircShakeSpeed * _Time.y;
					            u_xlat4.x = sin(u_xlat3.x);
					            u_xlat5.x = cos(u_xlat3.x);
					            u_xlat3.x = sin((-u_xlat3.x));
					            u_xlat3.y = u_xlat5.x;
					            u_xlat3.z = u_xlat4.x;
					            u_xlat4.x = dot(vec2(0.707106769, 0.707106769), u_xlat3.yz);
					            u_xlat4.y = dot(vec2(0.707106769, 0.707106769), u_xlat3.xy);
					            u_xlat3.xy = u_xlat4.xy / u_xlat2.xx;
					            u_xlat3.xy = u_xlat17.xy + u_xlat3.xy;
					            u_xlat17.xy = (u_xlatb2.y) ? u_xlat3.xy : u_xlat17.xy;
					            u_xlatb2.x = _ToggleRotaterAnimate==1.0;
					            u_xlat10.x = _RotaterSpin * _Time.w;
					            u_xlat2.x = (u_xlatb2.x) ? u_xlat10.x : 1.0;
					            u_xlat10.x = u_xlat1.x * _RotaterValue;
					            u_xlat10.x = (u_xlatb9) ? u_xlat10.x : _RotaterValue;
					            u_xlat2.x = u_xlat10.x * u_xlat2.x;
					            u_xlat3.x = cos(u_xlat2.x);
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat11.xy = u_xlat17.xy + vec2(-0.5, -0.5);
					            u_xlat4.x = (-u_xlat2.x);
					            u_xlat4.y = u_xlat3.x;
					            u_xlat4.z = u_xlat2.x;
					            u_xlat2.x = dot(u_xlat11.xy, u_xlat4.yz);
					            u_xlat2.y = dot(u_xlat11.xy, u_xlat4.xy);
					            u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					            u_xlat3.zw = (u_xlatb2.w) ? u_xlat2.xy : u_xlat17.xy;
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDistort);
					            if(u_xlatb17){
					                u_xlat2.x = u_xlat1.x * _DistortAmount;
					                u_xlat2.y = u_xlat1.x * _DistortOffset;
					                u_xlat4.x = _DistortAmount;
					                u_xlat4.y = _DistortOffset;
					                u_xlat17.xy = (bool(u_xlatb9)) ? u_xlat2.xy : u_xlat4.xy;
					                u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleDistortAnimate, _ToggleDistortAdvControl, _ToggleDistortAnimate, _ToggleDistortAnimate)).xy;
					                u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
					                if(u_xlatb2.x){
					                    u_xlatb2.x = _ToggleDistortAnimate==1.0;
					                    u_xlat10.x = _DistortRedSpeed * _Time.y;
					                    u_xlat10.xz = u_xlat10.xx * vec2(_DistortXAnim, _DistortYAnim) + u_xlat3.zw;
					                    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_DistortYAnim, _DistortXAnim);
					                    u_xlat20.x = u_xlat4.x * _DistortTileAnim;
					                    u_xlat5.y = floor(u_xlat20.x);
					                    u_xlat5.x = u_xlat5.y * _DistortYAnim;
					                    u_xlat20.xy = u_xlat3.zw + u_xlat5.xy;
					                    u_xlat4.xy = u_xlat4.xy * u_xlat20.xy;
					                    u_xlat2.xy = (u_xlatb2.x) ? u_xlat10.xz : u_xlat4.xy;
					                    u_xlat2.xy = u_xlat2.xy * _RedMap_ST.xy + _RedMap_ST.zw;
					                    u_xlat4 = texture(_RedMap, u_xlat2.xy);
					                } else {
					                    u_xlat2.xy = u_xlat3.zw * _RedMap_ST.xy + _RedMap_ST.zw;
					                    u_xlat4 = texture(_RedMap, u_xlat2.xy);
					                //ENDIF
					                }
					                u_xlat2.xy = u_xlat17.xx * u_xlat4.xy;
					                u_xlat3.zw = u_xlat2.xy * u_xlat17.yy + u_xlat3.zw;
					            //ENDIF
					            }
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgeDistort);
					            if(u_xlatb17){
					                u_xlat10_4 = texture(_LukaSecondPass, u_xlat3.zw);
					                u_xlat17.xy = u_xlat1.xx * vec2(_EdgeDisX, _EdgeDisY);
					                u_xlat17.xy = (bool(u_xlatb9)) ? u_xlat17.xy : vec2(_EdgeDisX, _EdgeDisY);
					                u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleEdgeDisRotate);
					                u_xlat10.x = _EdgeDisRotSpeed * _Time.y;
					                u_xlat5.x = sin(u_xlat10.x);
					                u_xlat6.x = cos(u_xlat10.x);
					                u_xlat7.x = sin((-u_xlat10.x));
					                u_xlat7.y = u_xlat6.x;
					                u_xlat7.z = u_xlat5.x;
					                u_xlat5.x = dot(vec2(0.707106769, 0.707106769), u_xlat7.yz);
					                u_xlat5.y = dot(vec2(0.707106769, 0.707106769), u_xlat7.xy);
					                u_xlat10.xz = u_xlat17.xy * u_xlat10_4.xy;
					                u_xlat20.xy = u_xlat5.xy / vec2(vec2(_EdgeDisRotStr, _EdgeDisRotStr));
					                u_xlat10.xz = u_xlat10.xz * u_xlat20.xy + u_xlat3.zw;
					                u_xlat17.xy = u_xlat10_4.xy * u_xlat17.xy + u_xlat3.zw;
					                u_xlat3.zw = (u_xlatb2.x) ? u_xlat10.xz : u_xlat17.xy;
					            //ENDIF
					            }
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleScreenpull);
					            if(u_xlatb17){
					                u_xlat17.x = u_xlat1.x * _ScreenpullStrength;
					                u_xlat17.x = (u_xlatb9) ? u_xlat17.x : _ScreenpullStrength;
					                u_xlat2.xy = vs_TEXCOORD0.xy * _ScreenpullMap_ST.xy + _ScreenpullMap_ST.zw;
					                u_xlat10_4 = texture(_ScreenpullMap, u_xlat2.xy);
					                u_xlat5.z = u_xlat3.w + _ScreenpullStrengthTwo;
					                u_xlat5.xy = u_xlat17.xx + u_xlat3.zw;
					                u_xlatb2.xyw = equal(vec4(vec4(_ScreenpullMode, _ScreenpullMode, _ScreenpullMode, _ScreenpullMode)), vec4(1.0, 2.0, 0.0, 3.0)).xyw;
					                u_xlat17.xy = u_xlat10_4.xy * u_xlat17.xx + u_xlat3.zw;
					                u_xlat17.xy = (u_xlatb2.w) ? u_xlat17.xy : u_xlat3.zw;
					                u_xlat17.xy = (u_xlatb2.y) ? u_xlat5.xy : u_xlat17.xy;
					                u_xlat3.zw = (u_xlatb2.x) ? u_xlat5.xz : u_xlat17.xy;
					            //ENDIF
					            }
					            u_xlat2.x = u_xlat1.x * _SSValue;
					            u_xlat2.y = u_xlat1.x * _SSValueVert;
					            u_xlat3.x = _SSValue;
					            u_xlat3.y = _SSValueVert;
					            u_xlat4.xy = (bool(u_xlatb9)) ? u_xlat2.xy : u_xlat3.xy;
					            u_xlat17.xy = u_xlat4.xy * vec2(0.200000003, 0.200000003);
					            u_xlat2.x = _SSSpeed * _Time.w;
					            u_xlat2.x = u_xlat2.x * 3.79999995;
					            u_xlat10.x = _SSSpeedVert * _Time.w;
					            u_xlat2.y = u_xlat10.x * 3.79999995;
					            u_xlat2.xy = sin(u_xlat2.xy);
					            u_xlatb5.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleSplitShake, _SSAllowHorizontalShake, _SSAllowVerticalShake, _ToggleSplitShake)).xyz;
					            u_xlat17.x = u_xlat17.x * u_xlat2.x + u_xlat3.z;
					            u_xlat4.z = (u_xlatb5.y) ? u_xlat17.x : u_xlat3.z;
					            u_xlat17.x = u_xlat17.y * u_xlat2.y + u_xlat3.w;
					            u_xlat4.w = (u_xlatb5.z) ? u_xlat17.x : u_xlat3.w;
					            u_xlat3 = (u_xlatb5.x) ? u_xlat4 : u_xlat3;
					            u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSplice);
					            u_xlatb2.xy = lessThan(vec4(_SpliceXLimit, _SpliceYLimit, _SpliceXLimit, _SpliceXLimit), u_xlat3.wzww).xy;
					            u_xlat25 = (u_xlatb2.x) ? _SpliceTop : _SpliceBot;
					            u_xlat2.x = (u_xlatb2.y) ? _SpliceLeft : _SpliceRight;
					            u_xlat4.x = u_xlat25 + u_xlat3.z;
					            u_xlat4.y = u_xlat2.x + u_xlat3.w;
					            u_xlatb2.xy = greaterThanEqual(vec4(2.0, 2.0, 0.0, 0.0), u_xlat4.xyxx).xy;
					            u_xlatb20.xy = greaterThanEqual(u_xlat4.xyxy, vec4(1.0, 1.0, 1.0, 1.0)).xy;
					            u_xlati2.xy = ivec2((uvec2(u_xlatb2.xy) * 0xffffffffu) & (uvec2(u_xlatb20.xy) * 0xffffffffu));
					            u_xlat20.xy = (-u_xlat4.xy) + vec2(1.0, 1.0);
					            u_xlat2.x = (u_xlati2.x != 0) ? u_xlat20.x : u_xlat4.x;
					            u_xlat2.y = (u_xlati2.y != 0) ? u_xlat20.y : u_xlat4.y;
					            u_xlat2.xy = (u_xlatb2.z) ? u_xlat2.xy : u_xlat4.xy;
					            u_xlat17.xy = (bool(u_xlatb17)) ? u_xlat2.xy : u_xlat3.zw;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDivide);
					            u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_AllowSmartFalloff);
					            u_xlat4.x = u_xlat1.x * _DivideL;
					            u_xlat4.z = u_xlat1.x * _DivideR + -2.0;
					            u_xlat18.xy = (bool(u_xlatb10)) ? u_xlat4.xz : vec2(_DivideL, _DivideR);
					            u_xlat18.x = (-u_xlat17.y) + u_xlat18.x;
					            u_xlatb18 = u_xlat17.x>=u_xlat18.x;
					            u_xlat4.x = u_xlatb18 ? 0.0151515156 : float(0.0);
					            u_xlat18.x = u_xlat17.x + u_xlat18.y;
					            u_xlatb18 = u_xlat17.y>=u_xlat18.x;
					            u_xlat4.y = u_xlatb18 ? 0.0151515156 : float(0.0);
					            u_xlat18.xy = u_xlat17.xy + u_xlat4.xy;
					            u_xlat17.xy = (u_xlatb2.x) ? u_xlat18.xy : u_xlat17.xy;
					            u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSwirl);
					            u_xlat18.x = u_xlat1.x * _SwirlPower;
					            u_xlat9.x = (u_xlatb9) ? u_xlat18.x : _SwirlPower;
					            u_xlat18.xy = (-u_xlat17.xy) + vec2(_SwirlCenterX, _SwirlCenterY);
					            u_xlat18.x = dot(u_xlat18.xy, u_xlat18.xy);
					            u_xlat18.x = sqrt(u_xlat18.x);
					            u_xlatb26 = u_xlat18.x<_SwirlRadius;
					            u_xlat19.xy = u_xlat17.xy + (-vec2(_SwirlCenterX, _SwirlCenterY));
					            u_xlat18.x = (-u_xlat18.x) + _SwirlRadius;
					            u_xlat18.x = u_xlat18.x / _SwirlRadius;
					            u_xlat18.x = u_xlat18.x * u_xlat18.x;
					            u_xlat18.x = u_xlat18.x * _SwirlAngle;
					            u_xlat9.x = u_xlat9.x * u_xlat18.x;
					            u_xlat4.x = sin(u_xlat9.x);
					            u_xlat5.x = cos(u_xlat9.x);
					            u_xlat6.x = (-u_xlat4.x);
					            u_xlat6.y = u_xlat5.x;
					            u_xlat5.x = dot(u_xlat19.yx, u_xlat6.xy);
					            u_xlat6.z = u_xlat4.x;
					            u_xlat5.y = dot(u_xlat19.yx, u_xlat6.yz);
					            u_xlat19.xy = u_xlat5.xy + vec2(_SwirlCenterX, _SwirlCenterY);
					            u_xlat18.xy = (bool(u_xlatb26)) ? u_xlat19.xy : u_xlat17.xy;
					            u_xlat9.xy = (u_xlatb2.x) ? u_xlat18.xy : u_xlat17.xy;
					            u_xlatb2.xz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleMultiScreen, _ToggleMultiScreen, _ToggleMultiFalloff, _ToggleMultiScreen)).xz;
					            u_xlatb25 = u_xlatb2.z && u_xlatb10;
					            u_xlat10.xy = u_xlat1.xx * vec2(_ScreensXRow, _ScreensYRow) + vec2(1.0, 1.0);
					            u_xlat19.xy = max(vec2(_ScreensXRow, _ScreensYRow), vec2(1.0, 1.0));
					            u_xlat10.xy = min(u_xlat10.xy, u_xlat19.xy);
					            u_xlat1.xw = (bool(u_xlatb25)) ? u_xlat10.xy : vec2(_ScreensXRow, _ScreensYRow);
					            u_xlat10.xy = u_xlat9.xy * u_xlat1.xw;
					            u_xlat10.xy = floor(u_xlat10.xy);
					            u_xlat10.xy = u_xlat10.xy / u_xlat1.xw;
					            u_xlat10.xy = u_xlat9.xy + (-u_xlat10.xy);
					            u_xlat1.xw = u_xlat1.xw * u_xlat10.xy;
					            u_xlat0.yz = (u_xlatb2.x) ? u_xlat1.wx : u_xlat9.yx;
					        } else {
					            u_xlat3.x = _SSValue;
					            u_xlat3.y = _SSValueVert;
					        //ENDIF
					        }
					        u_xlat1 = texture(_LukaSecondPass, u_xlat0.zy);
					        u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDizzyEffect);
					        if(u_xlatb2.x){
					            u_xlatb2.x = _DizzyMode==1.0;
					            if(u_xlatb2.x){
					                u_xlat2.x = _DizzyRotationSpeed * _Time.x;
					                u_xlat4.x = cos(u_xlat2.x);
					                u_xlat2.x = sin(u_xlat2.x);
					                u_xlat10.x = _DizzyAmountValue * _Time.x;
					                u_xlat10.x = sin(u_xlat10.x);
					            } else {
					                u_xlatb18 = _DizzyMode==2.0;
					                if(u_xlatb18){
					                    u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                    u_xlat5.x = sin(u_xlat18.x);
					                    u_xlat2.x = cos(u_xlat18.x);
					                    u_xlat4.x = u_xlat5.x / u_xlat2.x;
					                    u_xlat18.x = _DizzyAmountValue * _Time.x;
					                    u_xlat5.x = sin(u_xlat18.x);
					                    u_xlat6.x = cos(u_xlat18.x);
					                    u_xlat10.x = u_xlat5.x / u_xlat6.x;
					                } else {
					                    u_xlatb18 = _DizzyMode==3.0;
					                    if(u_xlatb18){
					                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                        u_xlat2.x = sin(u_xlat18.x);
					                        u_xlat4.x = cos(u_xlat18.x);
					                        u_xlat18.x = _DizzyAmountValue * _Time.x;
					                        u_xlat10.x = sin(u_xlat18.x);
					                    } else {
					                        u_xlatb18 = _DizzyMode==4.0;
					                        if(u_xlatb18){
					                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                            u_xlat5.x = sin(u_xlat18.x);
					                            u_xlat4.x = cos(u_xlat18.x);
					                            u_xlat2.x = u_xlat5.x / u_xlat4.x;
					                            u_xlat18.x = _DizzyAmountValue * _Time.x;
					                            u_xlat5.x = sin(u_xlat18.x);
					                            u_xlat6.x = cos(u_xlat18.x);
					                            u_xlat10.x = u_xlat5.x / u_xlat6.x;
					                        } else {
					                            u_xlatb18 = _DizzyMode==5.0;
					                            if(u_xlatb18){
					                                u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                u_xlat2.x = sin(u_xlat18.x);
					                                u_xlat4.x = cos(u_xlat18.x);
					                                u_xlat18.x = _DizzyAmountValue * _Time.x;
					                                u_xlat10.x = sin(u_xlat18.x);
					                            } else {
					                                u_xlatb18 = _DizzyMode==6.0;
					                                if(u_xlatb18){
					                                    u_xlatb18 = _dizcosXRValue==0.0;
					                                    if(u_xlatb18){
					                                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                        u_xlat4.x = sin(u_xlat18.x);
					                                    } else {
					                                        u_xlatb18 = _dizcosXRValue==1.0;
					                                        if(u_xlatb18){
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat4.x = cos(u_xlat18.x);
					                                        } else {
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat5.x = sin(u_xlat18.x);
					                                            u_xlat6.x = cos(u_xlat18.x);
					                                            u_xlat26 = u_xlat5.x / u_xlat6.x;
					                                            u_xlat19.x = u_xlat18.x * 1.44269502;
					                                            u_xlat27 = exp2(u_xlat19.x);
					                                            u_xlat19.x = exp2((-u_xlat19.x));
					                                            u_xlat12 = (-u_xlat19.x) + u_xlat27;
					                                            u_xlat19.x = u_xlat19.x + u_xlat27;
					                                            u_xlat19.x = float(1.0) / u_xlat19.x;
					                                            u_xlat19.x = u_xlat19.x * u_xlat12;
					                                            u_xlatb12.xyz = equal(vec4(vec4(_dizcosXRValue, _dizcosXRValue, _dizcosXRValue, _dizcosXRValue)), vec4(2.0, 3.0, 4.0, 4.0)).xyz;
					                                            u_xlat27 = -abs(u_xlat18.x) + 1.0;
					                                            u_xlat27 = sqrt(u_xlat27);
					                                            u_xlat13 = abs(u_xlat18.x) * -0.0187292993 + 0.0742610022;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + -0.212114394;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + 1.57072878;
					                                            u_xlat21 = u_xlat27 * u_xlat13;
					                                            u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
					                                            u_xlatb18 = u_xlat18.x<(-u_xlat18.x);
					                                            u_xlat18.x = u_xlatb18 ? u_xlat21 : float(0.0);
					                                            u_xlat18.x = u_xlat13 * u_xlat27 + u_xlat18.x;
					                                            u_xlat18.x = (u_xlatb12.z) ? u_xlat18.x : u_xlat5.x;
					                                            u_xlat18.x = (u_xlatb12.y) ? u_xlat19.x : u_xlat18.x;
					                                            u_xlat4.x = (u_xlatb12.x) ? u_xlat26 : u_xlat18.x;
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                    u_xlatb18 = _dizsinYRValue==0.0;
					                                    if(u_xlatb18){
					                                        u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                        u_xlat2.x = sin(u_xlat18.x);
					                                    } else {
					                                        u_xlatb18 = _dizsinYRValue==1.0;
					                                        if(u_xlatb18){
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat2.x = cos(u_xlat18.x);
					                                        } else {
					                                            u_xlat18.x = _DizzyRotationSpeed * _Time.x;
					                                            u_xlat5.x = sin(u_xlat18.x);
					                                            u_xlat6.x = cos(u_xlat18.x);
					                                            u_xlat26 = u_xlat5.x / u_xlat6.x;
					                                            u_xlat19.x = u_xlat18.x * 1.44269502;
					                                            u_xlat27 = exp2(u_xlat19.x);
					                                            u_xlat19.x = exp2((-u_xlat19.x));
					                                            u_xlat12 = (-u_xlat19.x) + u_xlat27;
					                                            u_xlat19.x = u_xlat19.x + u_xlat27;
					                                            u_xlat19.x = float(1.0) / u_xlat19.x;
					                                            u_xlat19.x = u_xlat19.x * u_xlat12;
					                                            u_xlatb12.xyz = equal(vec4(_dizsinYRValue), vec4(2.0, 3.0, 4.0, 4.0)).xyz;
					                                            u_xlat27 = -abs(u_xlat18.x) + 1.0;
					                                            u_xlat27 = sqrt(u_xlat27);
					                                            u_xlat13 = abs(u_xlat18.x) * -0.0187292993 + 0.0742610022;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + -0.212114394;
					                                            u_xlat13 = u_xlat13 * abs(u_xlat18.x) + 1.57072878;
					                                            u_xlat21 = u_xlat27 * u_xlat13;
					                                            u_xlat21 = u_xlat21 * -2.0 + 3.14159274;
					                                            u_xlatb18 = u_xlat18.x<(-u_xlat18.x);
					                                            u_xlat18.x = u_xlatb18 ? u_xlat21 : float(0.0);
					                                            u_xlat18.x = u_xlat13 * u_xlat27 + u_xlat18.x;
					                                            u_xlat18.x = (u_xlatb12.z) ? u_xlat18.x : u_xlat5.x;
					                                            u_xlat18.x = (u_xlatb12.y) ? u_xlat19.x : u_xlat18.x;
					                                            u_xlat2.x = (u_xlatb12.x) ? u_xlat26 : u_xlat18.x;
					                                        //ENDIF
					                                        }
					                                    //ENDIF
					                                    }
					                                    u_xlat18.x = _DizzyAmountValue * _Time.x;
					                                    u_xlat10.x = sin(u_xlat18.x);
					                                } else {
					                                    u_xlat4.x = 0.0;
					                                    u_xlat2.x = float(0.0);
					                                    u_xlat10.x = float(0.0);
					                                //ENDIF
					                                }
					                            //ENDIF
					                            }
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            u_xlat0.x = u_xlat0.z + u_xlat10.x;
					            u_xlat18.x = _DizzyDirection * _DizzyDirection;
					            u_xlat18.x = inversesqrt(u_xlat18.x);
					            u_xlat18.x = u_xlat18.x * _DizzyDirection;
					            u_xlat5.x = u_xlat2.x * u_xlat18.x;
					            u_xlat5.y = u_xlat4.x * u_xlat18.x;
					            u_xlat0.yz = u_xlat10.xx * u_xlat5.yx + u_xlat0.yx;
					            u_xlat10_4 = texture(_LukaSecondPass, u_xlat0.zy);
					            u_xlat2.x = (-u_xlat10.x) * 0.5 + 1.0;
					            u_xlat1.xyz = u_xlat10_4.xyz;
					            u_xlat1 = u_xlat2.xxxx * u_xlat1;
					            SV_Target0.w = u_xlat1.w;
					        } else {
					            SV_Target0.w = u_xlat1.w;
					        //ENDIF
					        }
					        u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleSplitShake);
					        if(u_xlatb25){
					            u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_SSAllowHorizontalBlur, _SSAllowVerticalBlur, _SSAllowHorizontalBlur, _SSAllowHorizontalBlur)).xy;
					            u_xlat25 = _SSSpeed * _Time.w;
					            u_xlat25 = sin(u_xlat25);
					            u_xlat25 = u_xlat25 * u_xlat3.x;
					            u_xlat25 = u_xlatb2.x ? u_xlat25 : float(0.0);
					            u_xlat2.x = _SSSpeedVert * _Time.w;
					            u_xlat2.x = sin(u_xlat2.x);
					            u_xlat2.x = u_xlat2.x * u_xlat3.y;
					            u_xlat2.x = u_xlatb2.y ? u_xlat2.x : float(0.0);
					            u_xlat0.x = u_xlat0.z + u_xlat25;
					            u_xlat10_3 = texture(_LukaSecondPass, u_xlat0.xy);
					            u_xlat0.w = u_xlat0.y + u_xlat2.x;
					            u_xlat10_4 = texture(_LukaSecondPass, u_xlat0.zw);
					            u_xlat10_5 = texture(_LukaSecondPass, u_xlat0.zy);
					            u_xlat0.x = u_xlat0.z + (-u_xlat25);
					            u_xlat10_6 = texture(_LukaSecondPass, u_xlat0.xy);
					            u_xlat0.w = u_xlat0.y + (-u_xlat2.x);
					            u_xlat10_0 = texture(_LukaSecondPass, u_xlat0.zw);
					            u_xlat16_2.xyz = u_xlat10_3.xyz + u_xlat10_4.xyz;
					            u_xlat16_2.xyz = u_xlat10_5.xyz + u_xlat16_2.xyz;
					            u_xlat16_2.xyz = u_xlat10_6.xyz + u_xlat16_2.xyz;
					            u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
					            u_xlat16_0.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
					            u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.142857149, 0.142857149, 0.142857149) + (-u_xlat1.xyz);
					            SV_Target0.xyz = vec3(vec3(_SSTransparency, _SSTransparency, _SSTransparency)) * u_xlat0.xyz + u_xlat1.xyz;
					        } else {
					            SV_Target0.xyz = u_xlat1.xyz;
					        //ENDIF
					        }
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_LukaThirdPass"
		}
		Pass {
			Name "LSONGPASSBLURS"
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 196062
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[12];
						float _ToggleZoom;
						vec4 unused_0_5;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat7;
					bool u_xlatb7;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat7 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlatb7 = u_xlat7>=_FalloffRange;
					    if(u_xlatb7){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb7 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb10 = _ToggleZoom==1.0;
					        u_xlatb7 = u_xlatb10 || u_xlatb7;
					        if(u_xlatb7){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            vs_TEXCOORD0.xy = u_xlat2.xx + u_xlat2.yz;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[12];
						float _ToggleZoom;
						vec4 unused_0_5;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec3 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					bool u_xlatb2;
					int u_xlati7;
					vec2 u_xlat8;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlati7 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					    u_xlat1.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat2.xy;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati7].xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlatb10 = u_xlat10>=_FalloffRange;
					    if(u_xlatb10){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb10 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb2 = _ToggleZoom==1.0;
					        u_xlatb10 = u_xlatb10 || u_xlatb2;
					        if(u_xlatb10){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            u_xlat2.xy = u_xlat2.xx + u_xlat2.yz;
					            u_xlat8.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					            vs_TEXCOORD0.xy = u_xlat2.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat8.xy;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleBlur;
						float _BlurOffset;
						float _ToggleSimpleBlur;
						float _BlurNondistanceOffset;
						float _ToggleUnfocusBlur;
						float _UnfocusBlurOffset;
						float _ToggleAutoanimateBlur;
						float _BlurAutoanimateSpeed;
						vec4 _ColorSplitRGBone;
						vec4 _ColorSplitRGBtwo;
						vec4 _ColorSplitRGBthree;
						float _ToggleColorSplit;
						float _ColorSplitAmount;
						float _ToggleAutoanimateColorSplit;
						float _ColorSplitSpeed;
						float _ToggleColorSplitStaySides;
						float _ColSpONEopacity;
						float _ColSpTWOopacity;
						float _ColSpTHREEopacity;
						float _CSLX;
						float _CSLY;
						float _CSMX;
						float _CSMY;
						float _CSRX;
						float _CSRY;
						float _ToggleVerticalBlur;
						float _VerticalBlurOffset;
						float _ToggleAnimateVerticalBlur;
						float _VerticalBlurAnimateSpeed;
						float _ToggleAfterimage;
						float _Offset;
						float _ExtraOffset;
						float _offsetthree;
						float _runPassThreeToggle;
						float _ToggleHorizontalBlur;
						float _HorizontalBlurOffset;
						float _ToggleAnimateHorizontalBlur;
						float _HorizontalBlurAnimateSpeed;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _LukaThirdPass;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					bvec2 u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec3 u_xlat12;
					vec4 u_xlat10_12;
					vec4 u_xlat10_13;
					vec4 u_xlat10_14;
					vec4 u_xlat10_15;
					vec4 u_xlat16;
					vec4 u_xlat10_16;
					vec4 u_xlat10_17;
					bvec2 u_xlatb20;
					bvec2 u_xlatb22;
					vec2 u_xlat27;
					vec2 u_xlat28;
					vec3 u_xlat29;
					vec3 u_xlat30;
					float u_xlat40;
					bvec2 u_xlatb40;
					vec2 u_xlat41;
					bool u_xlatb41;
					float u_xlat56;
					bool u_xlatb56;
					float u_xlat58;
					float u_xlat59;
					bool u_xlatb59;
					void main()
					{
					    u_xlat0.yw = vs_TEXCOORD0.yx / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaFirstPass, u_xlat0.wy);
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlatb20.x = u_xlat2.x>=_FalloffRange;
					    if(u_xlatb20.x){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlat10_3 = texture(_LukaThirdPass, u_xlat0.wy);
					        u_xlatb20.x = _runPassThreeToggle==1.0;
					        if(u_xlatb20.x){
					            u_xlatb20.xy = equal(vec4(_AllowSmartFalloff, _AllowFadingFalloff, _AllowSmartFalloff, _AllowSmartFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlat2.x = max(u_xlat2.x, _SmartFalloffMin);
					            u_xlat2.x = min(u_xlat2.x, _SmartFalloffMax);
					            u_xlat2.x = u_xlat2.x + (-_SmartFalloffMin);
					            u_xlat2.x = u_xlat2.x / _SmartFalloffMin;
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlatb56 = u_xlat2.x<0.0;
					            u_xlatb4 = 1.0<u_xlat2.x;
					            u_xlat2.x = (u_xlatb4) ? 1.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb56) ? 0.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb20.x) ? u_xlat2.x : 1.0;
					            u_xlat4.xyz = (-_WorldSpaceCameraPos.xyz) + unity_ObjectToWorld[3].xyz;
					            u_xlat56 = dot(u_xlat4.xyz, u_xlat4.xyz);
					            u_xlat56 = sqrt(u_xlat56);
					            u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBlur);
					            u_xlatb22.xy = equal(vec4(_AllowScalarFalloff, _ToggleSimpleBlur, _AllowScalarFalloff, _AllowScalarFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlatb22.x = u_xlatb20.x && u_xlatb22.x;
					            u_xlat58 = u_xlat2.x * _BlurOffset;
					            u_xlat58 = (u_xlatb22.x) ? u_xlat58 : _BlurOffset;
					            u_xlatb5.xy = equal(vec4(_BlurNondistanceOffset, _ToggleAutoanimateBlur, _BlurNondistanceOffset, _BlurNondistanceOffset), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlat5.x = (u_xlatb5.x) ? 2.0 : _BlurNondistanceOffset;
					            u_xlat56 = (u_xlatb22.y) ? u_xlat5.x : u_xlat56;
					            u_xlat40 = _BlurAutoanimateSpeed * _Time.w;
					            u_xlat40 = sin(u_xlat40);
					            u_xlat40 = u_xlat58 * u_xlat40;
					            u_xlat40 = (u_xlatb5.y) ? u_xlat40 : u_xlat58;
					            u_xlat58 = log2(u_xlat56);
					            u_xlat58 = u_xlat58 * 0.693147182;
					            u_xlat56 = u_xlat58 / u_xlat56;
					            u_xlat56 = u_xlat40 / u_xlat56;
					            u_xlat5.xy = mix(vec2(0.0, 0.0), vec2(u_xlat56), vec2(bvec2(u_xlatb4)));
					            u_xlat5.z = (u_xlatb4) ? 10.0 : 1.0;
					            u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleUnfocusBlur);
					            u_xlat40 = u_xlat2.x * _UnfocusBlurOffset;
					            u_xlat40 = (u_xlatb22.x) ? u_xlat40 : _UnfocusBlurOffset;
					            u_xlat58 = u_xlat40 + 2.0;
					            u_xlat59 = log2(u_xlat58);
					            u_xlat59 = u_xlat59 * 0.693147182;
					            u_xlat58 = u_xlat59 / u_xlat58;
					            u_xlat40 = u_xlat40 / u_xlat58;
					            u_xlat6.x = u_xlat40 + u_xlat5.y;
					            u_xlat6.y = u_xlat5.y + u_xlat6.x;
					            u_xlat6.z = 10.0;
					            u_xlat7.xyz = (bool(u_xlatb56)) ? u_xlat6.xyz : u_xlat5.xyz;
					            u_xlatb40.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleColorSplit, _ToggleAutoanimateColorSplit, _ToggleColorSplit, _ToggleAutoanimateColorSplit)).xy;
					            u_xlat8.x = u_xlat7.z + 3.0;
					            u_xlat5.x = u_xlat2.x * _ColorSplitAmount;
					            u_xlat27.x = (u_xlatb22.x) ? u_xlat5.x : _ColorSplitAmount;
					            u_xlatb5.x = _ToggleAutoanimateColorSplit==1.0;
					            u_xlatb41 = _ToggleColorSplitStaySides==1.0;
					            u_xlat59 = _ColorSplitSpeed * _Time.w;
					            u_xlat59 = sin(u_xlat59);
					            u_xlat6.z = u_xlat27.x * u_xlat59;
					            u_xlat28.x = abs(u_xlat6.z);
					            u_xlat6.xw = (-u_xlat6.zz);
					            u_xlatb59 = u_xlat6.z<-0.0;
					            u_xlat28.y = (u_xlatb59) ? u_xlat6.z : u_xlat6.x;
					            u_xlat41.xy = (bool(u_xlatb41)) ? u_xlat28.xy : u_xlat6.zw;
					            u_xlat27.y = (-u_xlat27.x);
					            u_xlat8.yz = (u_xlatb5.x) ? u_xlat41.xy : u_xlat27.xy;
					            u_xlat7.w = 0.0;
					            u_xlat8.xyz = (u_xlatb40.x) ? u_xlat8.xyz : u_xlat7.zww;
					            u_xlatb5.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVerticalBlur);
					            u_xlat9.x = u_xlat8.x + 3.0;
					            u_xlatb41 = _ToggleAnimateVerticalBlur==1.0;
					            u_xlat59 = _VerticalBlurAnimateSpeed * _Time.w;
					            u_xlat59 = sin(u_xlat59);
					            u_xlat59 = u_xlat59 * _VerticalBlurOffset;
					            u_xlat41.x = (u_xlatb41) ? u_xlat59 : _VerticalBlurOffset;
					            u_xlat59 = u_xlat2.x * u_xlat41.x;
					            u_xlat9.y = (u_xlatb22.x) ? u_xlat59 : u_xlat41.x;
					            u_xlat8.w = 0.0;
					            u_xlat9.xy = (u_xlatb5.x) ? u_xlat9.xy : u_xlat8.xw;
					            u_xlatb41 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAfterimage);
					            u_xlat10.x = u_xlat9.x + 9.0;
					            u_xlat29.y = u_xlat2.x * _Offset;
					            u_xlat29.xz = u_xlat2.xx * vec2(_ExtraOffset, _offsetthree);
					            u_xlat30.xz = vec2(_ExtraOffset, _offsetthree);
					            u_xlat30.y = _Offset;
					            u_xlat10.yzw = (u_xlatb22.x) ? u_xlat29.xyz : u_xlat30.xyz;
					            u_xlat9.z = 0.0;
					            u_xlat10 = (bool(u_xlatb41)) ? u_xlat10 : u_xlat9.xzzz;
					            if(u_xlatb40.y){
					                u_xlat6.xzw = u_xlat10_3.xyz * _ColorSplitRGBtwo.xyz;
					                u_xlat6.xzw = u_xlat6.xzw * vec3(vec3(_ColSpTWOopacity, _ColSpTWOopacity, _ColSpTWOopacity));
					                u_xlat0.xz = u_xlat0.ww + u_xlat8.yz;
					                u_xlat10_8 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat8.xyz = u_xlat10_8.xyz * _ColorSplitRGBone.xyz;
					                u_xlat8.xyz = u_xlat8.xyz * vec3(vec3(_ColSpONEopacity, _ColSpONEopacity, _ColSpONEopacity));
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat9.xzw = u_xlat10_11.xyz * _ColorSplitRGBthree.xyz;
					                u_xlat9.xzw = u_xlat9.xzw * vec3(vec3(_ColSpTHREEopacity, _ColSpTHREEopacity, _ColSpTHREEopacity));
					            } else {
					                u_xlat11.x = u_xlat0.w + _CSRX;
					                u_xlat11.y = u_xlat0.y + (-_CSRY);
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.xy);
					                u_xlat11.xyz = u_xlat10_11.xyz * _ColorSplitRGBtwo.xyz;
					                u_xlat6.xzw = u_xlat11.xyz * vec3(vec3(_ColSpTWOopacity, _ColSpTWOopacity, _ColSpTWOopacity));
					                u_xlat11.xy = u_xlat0.ww + vec2(_CSLX, _CSMX);
					                u_xlat11.zw = u_xlat0.yy + (-vec2(_CSLY, _CSMY));
					                u_xlat10_12 = texture(_LukaThirdPass, u_xlat11.xz);
					                u_xlat12.xyz = u_xlat10_12.xyz * _ColorSplitRGBone.xyz;
					                u_xlat8.xyz = u_xlat12.xyz * vec3(vec3(_ColSpONEopacity, _ColSpONEopacity, _ColSpONEopacity));
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.yw);
					                u_xlat11.xyz = u_xlat10_11.xyz * _ColorSplitRGBthree.xyz;
					                u_xlat9.xzw = u_xlat11.xyz * vec3(vec3(_ColSpTHREEopacity, _ColSpTHREEopacity, _ColSpTHREEopacity));
					            //ENDIF
					            }
					            u_xlatb4 = u_xlatb56 || u_xlatb4;
					            if(u_xlatb4){
					                u_xlat56 = (u_xlatb56) ? u_xlat6.y : u_xlat5.y;
					                u_xlat11 = u_xlat0.wywy + u_xlat7.xxyy;
					                u_xlat0.x = u_xlat11.x;
					                u_xlat10_12 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat0.x = u_xlat11.y;
					                u_xlat10_13 = texture(_LukaThirdPass, u_xlat0.wx);
					                u_xlat7 = u_xlat0.wywy + (-u_xlat7.xxyy);
					                u_xlat0.z = u_xlat7.x;
					                u_xlat10_14 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat0.z = u_xlat7.y;
					                u_xlat10_15 = texture(_LukaThirdPass, u_xlat0.wz);
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.zw);
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat7.zw);
					                u_xlat16.xy = u_xlat0.wy + vec2(u_xlat56);
					                u_xlat16.zw = u_xlat0.yw + (-vec2(u_xlat56));
					                u_xlat10_17 = texture(_LukaThirdPass, u_xlat16.xz);
					                u_xlat10_16 = texture(_LukaThirdPass, u_xlat16.wy);
					                u_xlat16_4.xyw = u_xlat10_12.xyz + u_xlat10_13.xyz;
					                u_xlat16_4.xyw = u_xlat10_3.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_14.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_15.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_11.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_7.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_17.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_16.xyz + u_xlat16_4.xyw;
					                u_xlat4.xyw = u_xlat10_3.xyz + u_xlat16_4.xyw;
					            } else {
					                u_xlat4.xyw = u_xlat10_3.xyz;
					            //ENDIF
					            }
					            u_xlat6.xyz = u_xlat6.xzw + u_xlat8.xyz;
					            u_xlat6.xyz = u_xlat9.xzw + u_xlat6.xyz;
					            u_xlat6.xyz = u_xlat4.xyw + u_xlat6.xyz;
					            u_xlat4.xyz = (u_xlatb40.x) ? u_xlat6.xyz : u_xlat4.xyw;
					            if(u_xlatb5.x){
					                u_xlat0.x = u_xlat0.y + (-u_xlat9.y);
					                u_xlat10_6 = texture(_LukaThirdPass, u_xlat0.wx);
					                u_xlat0.z = u_xlat0.y + u_xlat9.y;
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat0.wz);
					                u_xlat16_5.xyw = u_xlat10_6.xyz + u_xlat10_7.xyz;
					                u_xlat16_5.xyw = u_xlat10_3.xyz + u_xlat16_5.xyw;
					                u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyw;
					            //ENDIF
					            }
					            if(u_xlatb41){
					                u_xlat5.xyz = u_xlat0.www + u_xlat10.yzw;
					                u_xlat5.w = u_xlat0.y;
					                u_xlat10_6 = texture(_LukaThirdPass, u_xlat5.xw);
					                u_xlat6.xyz = u_xlat4.xyz + u_xlat10_6.xyz;
					                u_xlat6.xyz = u_xlat10_3.xyz + u_xlat6.xyz;
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat5.yw);
					                u_xlat7.xyz = u_xlat4.xyz + u_xlat10_7.xyz;
					                u_xlat7.xyz = u_xlat10_3.xyz + u_xlat7.xyz;
					                u_xlat6.xyz = u_xlat6.xyz + u_xlat7.xyz;
					                u_xlat10_5 = texture(_LukaThirdPass, u_xlat5.zw);
					                u_xlat5.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
					                u_xlat5.xyz = u_xlat10_3.xyz + u_xlat5.xyz;
					                u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					                u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					            //ENDIF
					            }
					            u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleHorizontalBlur);
					            if(u_xlatb56){
					                u_xlat10.x = u_xlat10.x + 2.0;
					                u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAnimateHorizontalBlur);
					                u_xlat58 = _HorizontalBlurAnimateSpeed * _Time.w;
					                u_xlat58 = sin(u_xlat58);
					                u_xlat58 = u_xlat58 * _HorizontalBlurOffset;
					                u_xlat56 = (u_xlatb56) ? u_xlat58 : _HorizontalBlurOffset;
					                u_xlat0.z = u_xlat0.w + u_xlat56;
					                u_xlat10_5 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat0.x = u_xlat0.w + (-u_xlat56);
					                u_xlat10_0 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_5.xyz;
					                u_xlat4.xyz = u_xlat16_0.xyz + u_xlat4.xyz;
					            //ENDIF
					            }
					            u_xlat0.xyz = u_xlat4.xyz / u_xlat10.xxx;
					            u_xlatb20.x = u_xlatb20.y && u_xlatb20.x;
					            if(u_xlatb20.x){
					                u_xlat0.w = 1.0;
					                u_xlat4 = (-u_xlat10_1) + u_xlat0;
					                SV_Target0 = u_xlat2.xxxx * u_xlat4 + u_xlat10_1;
					                return;
					            } else {
					                SV_Target0.xyz = u_xlat0.xyz;
					                SV_Target0.w = 1.0;
					                return;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        SV_Target0 = u_xlat10_3;
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleBlur;
						float _BlurOffset;
						float _ToggleSimpleBlur;
						float _BlurNondistanceOffset;
						float _ToggleUnfocusBlur;
						float _UnfocusBlurOffset;
						float _ToggleAutoanimateBlur;
						float _BlurAutoanimateSpeed;
						vec4 _ColorSplitRGBone;
						vec4 _ColorSplitRGBtwo;
						vec4 _ColorSplitRGBthree;
						float _ToggleColorSplit;
						float _ColorSplitAmount;
						float _ToggleAutoanimateColorSplit;
						float _ColorSplitSpeed;
						float _ToggleColorSplitStaySides;
						float _ColSpONEopacity;
						float _ColSpTWOopacity;
						float _ColSpTHREEopacity;
						float _CSLX;
						float _CSLY;
						float _CSMX;
						float _CSMY;
						float _CSRX;
						float _CSRY;
						float _ToggleVerticalBlur;
						float _VerticalBlurOffset;
						float _ToggleAnimateVerticalBlur;
						float _VerticalBlurAnimateSpeed;
						float _ToggleAfterimage;
						float _Offset;
						float _ExtraOffset;
						float _offsetthree;
						float _runPassThreeToggle;
						float _ToggleHorizontalBlur;
						float _HorizontalBlurOffset;
						float _ToggleAnimateHorizontalBlur;
						float _HorizontalBlurAnimateSpeed;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LukaFirstPass;
					uniform  sampler2D _LukaThirdPass;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					float u_xlat2;
					int u_xlati2;
					bool u_xlatb2;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat16_4;
					bool u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat16_5;
					vec4 u_xlat10_5;
					bvec2 u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10;
					vec4 u_xlat11;
					vec4 u_xlat10_11;
					vec3 u_xlat12;
					vec4 u_xlat10_12;
					vec4 u_xlat10_13;
					vec4 u_xlat10_14;
					vec4 u_xlat10_15;
					vec4 u_xlat16;
					vec4 u_xlat10_16;
					vec4 u_xlat10_17;
					vec3 u_xlat20;
					bvec2 u_xlatb22;
					vec2 u_xlat27;
					vec2 u_xlat28;
					vec3 u_xlat29;
					vec3 u_xlat30;
					bvec2 u_xlatb38;
					float u_xlat40;
					bvec2 u_xlatb40;
					vec2 u_xlat41;
					bool u_xlatb41;
					float u_xlat58;
					float u_xlat59;
					bool u_xlatb59;
					void main()
					{
					    u_xlat0.yw = vs_TEXCOORD0.yx / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaFirstPass, u_xlat0.wy);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat20.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat20.x = dot(u_xlat20.xyz, u_xlat20.xyz);
					    u_xlat20.x = sqrt(u_xlat20.x);
					    u_xlatb38.x = u_xlat20.x>=_FalloffRange;
					    if(u_xlatb38.x){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlat10_3 = texture(_LukaThirdPass, u_xlat0.wy);
					        u_xlatb38.x = _runPassThreeToggle==1.0;
					        if(u_xlatb38.x){
					            u_xlatb38.xy = equal(vec4(_AllowSmartFalloff, _AllowFadingFalloff, _AllowSmartFalloff, _AllowFadingFalloff), vec4(1.0, 1.0, 1.0, 1.0)).xy;
					            u_xlat20.x = max(u_xlat20.x, _SmartFalloffMin);
					            u_xlat20.x = min(u_xlat20.x, _SmartFalloffMax);
					            u_xlat20.x = u_xlat20.x + (-_SmartFalloffMin);
					            u_xlat20.x = u_xlat20.x / _SmartFalloffMin;
					            u_xlat20.x = (-u_xlat20.x) + 1.0;
					            u_xlatb4 = u_xlat20.x<0.0;
					            u_xlatb22.x = 1.0<u_xlat20.x;
					            u_xlat20.x = (u_xlatb22.x) ? 1.0 : u_xlat20.x;
					            u_xlat20.x = (u_xlatb4) ? 0.0 : u_xlat20.x;
					            u_xlat20.x = (u_xlatb38.x) ? u_xlat20.x : 1.0;
					            u_xlat4.xyz = unity_ObjectToWorld[3].xyz + (-unity_StereoWorldSpaceCameraPos[u_xlati2].xyz);
					            u_xlat2 = dot(u_xlat4.xyz, u_xlat4.xyz);
					            u_xlat2 = sqrt(u_xlat2);
					            u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleBlur);
					            u_xlatb22.xy = equal(vec4(_AllowScalarFalloff, _ToggleSimpleBlur, _AllowScalarFalloff, _AllowScalarFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlatb22.x = u_xlatb38.x && u_xlatb22.x;
					            u_xlat58 = u_xlat20.x * _BlurOffset;
					            u_xlat58 = (u_xlatb22.x) ? u_xlat58 : _BlurOffset;
					            u_xlatb5.xy = equal(vec4(_BlurNondistanceOffset, _ToggleAutoanimateBlur, _BlurNondistanceOffset, _BlurNondistanceOffset), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlat5.x = (u_xlatb5.x) ? 2.0 : _BlurNondistanceOffset;
					            u_xlat2 = (u_xlatb22.y) ? u_xlat5.x : u_xlat2;
					            u_xlat40 = _BlurAutoanimateSpeed * _Time.w;
					            u_xlat40 = sin(u_xlat40);
					            u_xlat40 = u_xlat58 * u_xlat40;
					            u_xlat40 = (u_xlatb5.y) ? u_xlat40 : u_xlat58;
					            u_xlat58 = log2(u_xlat2);
					            u_xlat58 = u_xlat58 * 0.693147182;
					            u_xlat2 = u_xlat58 / u_xlat2;
					            u_xlat2 = u_xlat40 / u_xlat2;
					            u_xlat5.xy = mix(vec2(0.0, 0.0), vec2(u_xlat2), vec2(bvec2(u_xlatb4)));
					            u_xlat5.z = (u_xlatb4) ? 10.0 : 1.0;
					            u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleUnfocusBlur);
					            u_xlat40 = u_xlat20.x * _UnfocusBlurOffset;
					            u_xlat40 = (u_xlatb22.x) ? u_xlat40 : _UnfocusBlurOffset;
					            u_xlat58 = u_xlat40 + 2.0;
					            u_xlat59 = log2(u_xlat58);
					            u_xlat59 = u_xlat59 * 0.693147182;
					            u_xlat58 = u_xlat59 / u_xlat58;
					            u_xlat40 = u_xlat40 / u_xlat58;
					            u_xlat6.x = u_xlat40 + u_xlat5.y;
					            u_xlat6.y = u_xlat5.y + u_xlat6.x;
					            u_xlat6.z = 10.0;
					            u_xlat7.xyz = (bool(u_xlatb2)) ? u_xlat6.xyz : u_xlat5.xyz;
					            u_xlatb40.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleColorSplit, _ToggleAutoanimateColorSplit, _ToggleColorSplit, _ToggleAutoanimateColorSplit)).xy;
					            u_xlat8.x = u_xlat7.z + 3.0;
					            u_xlat5.x = u_xlat20.x * _ColorSplitAmount;
					            u_xlat27.x = (u_xlatb22.x) ? u_xlat5.x : _ColorSplitAmount;
					            u_xlatb5.x = _ToggleAutoanimateColorSplit==1.0;
					            u_xlatb41 = _ToggleColorSplitStaySides==1.0;
					            u_xlat59 = _ColorSplitSpeed * _Time.w;
					            u_xlat59 = sin(u_xlat59);
					            u_xlat6.z = u_xlat27.x * u_xlat59;
					            u_xlat28.x = abs(u_xlat6.z);
					            u_xlat6.xw = (-u_xlat6.zz);
					            u_xlatb59 = u_xlat6.z<-0.0;
					            u_xlat28.y = (u_xlatb59) ? u_xlat6.z : u_xlat6.x;
					            u_xlat41.xy = (bool(u_xlatb41)) ? u_xlat28.xy : u_xlat6.zw;
					            u_xlat27.y = (-u_xlat27.x);
					            u_xlat8.yz = (u_xlatb5.x) ? u_xlat41.xy : u_xlat27.xy;
					            u_xlat7.w = 0.0;
					            u_xlat8.xyz = (u_xlatb40.x) ? u_xlat8.xyz : u_xlat7.zww;
					            u_xlatb5.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleVerticalBlur);
					            u_xlat9.x = u_xlat8.x + 3.0;
					            u_xlatb41 = _ToggleAnimateVerticalBlur==1.0;
					            u_xlat59 = _VerticalBlurAnimateSpeed * _Time.w;
					            u_xlat59 = sin(u_xlat59);
					            u_xlat59 = u_xlat59 * _VerticalBlurOffset;
					            u_xlat41.x = (u_xlatb41) ? u_xlat59 : _VerticalBlurOffset;
					            u_xlat59 = u_xlat20.x * u_xlat41.x;
					            u_xlat9.y = (u_xlatb22.x) ? u_xlat59 : u_xlat41.x;
					            u_xlat8.w = 0.0;
					            u_xlat9.xy = (u_xlatb5.x) ? u_xlat9.xy : u_xlat8.xw;
					            u_xlatb41 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAfterimage);
					            u_xlat10.x = u_xlat9.x + 9.0;
					            u_xlat29.y = u_xlat20.x * _Offset;
					            u_xlat29.xz = u_xlat20.xx * vec2(_ExtraOffset, _offsetthree);
					            u_xlat30.xz = vec2(_ExtraOffset, _offsetthree);
					            u_xlat30.y = _Offset;
					            u_xlat10.yzw = (u_xlatb22.x) ? u_xlat29.xyz : u_xlat30.xyz;
					            u_xlat9.z = 0.0;
					            u_xlat10 = (bool(u_xlatb41)) ? u_xlat10 : u_xlat9.xzzz;
					            if(u_xlatb40.y){
					                u_xlat6.xzw = u_xlat10_3.xyz * _ColorSplitRGBtwo.xyz;
					                u_xlat6.xzw = u_xlat6.xzw * vec3(vec3(_ColSpTWOopacity, _ColSpTWOopacity, _ColSpTWOopacity));
					                u_xlat0.xz = u_xlat0.ww + u_xlat8.yz;
					                u_xlat10_8 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat8.xyz = u_xlat10_8.xyz * _ColorSplitRGBone.xyz;
					                u_xlat8.xyz = u_xlat8.xyz * vec3(vec3(_ColSpONEopacity, _ColSpONEopacity, _ColSpONEopacity));
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat9.xzw = u_xlat10_11.xyz * _ColorSplitRGBthree.xyz;
					                u_xlat9.xzw = u_xlat9.xzw * vec3(vec3(_ColSpTHREEopacity, _ColSpTHREEopacity, _ColSpTHREEopacity));
					            } else {
					                u_xlat11.x = u_xlat0.w + _CSRX;
					                u_xlat11.y = u_xlat0.y + (-_CSRY);
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.xy);
					                u_xlat11.xyz = u_xlat10_11.xyz * _ColorSplitRGBtwo.xyz;
					                u_xlat6.xzw = u_xlat11.xyz * vec3(vec3(_ColSpTWOopacity, _ColSpTWOopacity, _ColSpTWOopacity));
					                u_xlat11.xy = u_xlat0.ww + vec2(_CSLX, _CSMX);
					                u_xlat11.zw = u_xlat0.yy + (-vec2(_CSLY, _CSMY));
					                u_xlat10_12 = texture(_LukaThirdPass, u_xlat11.xz);
					                u_xlat12.xyz = u_xlat10_12.xyz * _ColorSplitRGBone.xyz;
					                u_xlat8.xyz = u_xlat12.xyz * vec3(vec3(_ColSpONEopacity, _ColSpONEopacity, _ColSpONEopacity));
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.yw);
					                u_xlat11.xyz = u_xlat10_11.xyz * _ColorSplitRGBthree.xyz;
					                u_xlat9.xzw = u_xlat11.xyz * vec3(vec3(_ColSpTHREEopacity, _ColSpTHREEopacity, _ColSpTHREEopacity));
					            //ENDIF
					            }
					            u_xlatb4 = u_xlatb2 || u_xlatb4;
					            if(u_xlatb4){
					                u_xlat2 = (u_xlatb2) ? u_xlat6.y : u_xlat5.y;
					                u_xlat11 = u_xlat0.wywy + u_xlat7.xxyy;
					                u_xlat0.x = u_xlat11.x;
					                u_xlat10_12 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat0.x = u_xlat11.y;
					                u_xlat10_13 = texture(_LukaThirdPass, u_xlat0.wx);
					                u_xlat7 = u_xlat0.wywy + (-u_xlat7.xxyy);
					                u_xlat0.z = u_xlat7.x;
					                u_xlat10_14 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat0.z = u_xlat7.y;
					                u_xlat10_15 = texture(_LukaThirdPass, u_xlat0.wz);
					                u_xlat10_11 = texture(_LukaThirdPass, u_xlat11.zw);
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat7.zw);
					                u_xlat16.xy = u_xlat0.wy + vec2(u_xlat2);
					                u_xlat16.zw = u_xlat0.yw + (-vec2(u_xlat2));
					                u_xlat10_17 = texture(_LukaThirdPass, u_xlat16.xz);
					                u_xlat10_16 = texture(_LukaThirdPass, u_xlat16.wy);
					                u_xlat16_4.xyw = u_xlat10_12.xyz + u_xlat10_13.xyz;
					                u_xlat16_4.xyw = u_xlat10_3.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_14.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_15.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_11.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_7.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_17.xyz + u_xlat16_4.xyw;
					                u_xlat16_4.xyw = u_xlat10_16.xyz + u_xlat16_4.xyw;
					                u_xlat4.xyw = u_xlat10_3.xyz + u_xlat16_4.xyw;
					            } else {
					                u_xlat4.xyw = u_xlat10_3.xyz;
					            //ENDIF
					            }
					            u_xlat6.xyz = u_xlat6.xzw + u_xlat8.xyz;
					            u_xlat6.xyz = u_xlat9.xzw + u_xlat6.xyz;
					            u_xlat6.xyz = u_xlat4.xyw + u_xlat6.xyz;
					            u_xlat4.xyz = (u_xlatb40.x) ? u_xlat6.xyz : u_xlat4.xyw;
					            if(u_xlatb5.x){
					                u_xlat0.x = u_xlat0.y + (-u_xlat9.y);
					                u_xlat10_6 = texture(_LukaThirdPass, u_xlat0.wx);
					                u_xlat0.z = u_xlat0.y + u_xlat9.y;
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat0.wz);
					                u_xlat16_5.xyw = u_xlat10_6.xyz + u_xlat10_7.xyz;
					                u_xlat16_5.xyw = u_xlat10_3.xyz + u_xlat16_5.xyw;
					                u_xlat4.xyz = u_xlat4.xyz + u_xlat16_5.xyw;
					            //ENDIF
					            }
					            if(u_xlatb41){
					                u_xlat5.xyz = u_xlat0.www + u_xlat10.yzw;
					                u_xlat5.w = u_xlat0.y;
					                u_xlat10_6 = texture(_LukaThirdPass, u_xlat5.xw);
					                u_xlat6.xyz = u_xlat4.xyz + u_xlat10_6.xyz;
					                u_xlat6.xyz = u_xlat10_3.xyz + u_xlat6.xyz;
					                u_xlat10_7 = texture(_LukaThirdPass, u_xlat5.yw);
					                u_xlat7.xyz = u_xlat4.xyz + u_xlat10_7.xyz;
					                u_xlat7.xyz = u_xlat10_3.xyz + u_xlat7.xyz;
					                u_xlat6.xyz = u_xlat6.xyz + u_xlat7.xyz;
					                u_xlat10_5 = texture(_LukaThirdPass, u_xlat5.zw);
					                u_xlat5.xyz = u_xlat4.xyz + u_xlat10_5.xyz;
					                u_xlat5.xyz = u_xlat10_3.xyz + u_xlat5.xyz;
					                u_xlat5.xyz = u_xlat5.xyz + u_xlat6.xyz;
					                u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					            //ENDIF
					            }
					            u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleHorizontalBlur);
					            if(u_xlatb2){
					                u_xlat10.x = u_xlat10.x + 2.0;
					                u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleAnimateHorizontalBlur);
					                u_xlat58 = _HorizontalBlurAnimateSpeed * _Time.w;
					                u_xlat58 = sin(u_xlat58);
					                u_xlat58 = u_xlat58 * _HorizontalBlurOffset;
					                u_xlat2 = (u_xlatb2) ? u_xlat58 : _HorizontalBlurOffset;
					                u_xlat0.z = u_xlat0.w + u_xlat2;
					                u_xlat10_5 = texture(_LukaThirdPass, u_xlat0.zy);
					                u_xlat0.x = u_xlat0.w + (-u_xlat2);
					                u_xlat10_0 = texture(_LukaThirdPass, u_xlat0.xy);
					                u_xlat16_0.xyz = u_xlat10_0.xyz + u_xlat10_5.xyz;
					                u_xlat4.xyz = u_xlat16_0.xyz + u_xlat4.xyz;
					            //ENDIF
					            }
					            u_xlat0.xyz = u_xlat4.xyz / u_xlat10.xxx;
					            u_xlatb2 = u_xlatb38.y && u_xlatb38.x;
					            if(u_xlatb2){
					                u_xlat0.w = 1.0;
					                u_xlat4 = (-u_xlat10_1) + u_xlat0;
					                SV_Target0 = u_xlat20.xxxx * u_xlat4 + u_xlat10_1;
					                return;
					            } else {
					                SV_Target0.xyz = u_xlat0.xyz;
					                SV_Target0.w = 1.0;
					                return;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        SV_Target0 = u_xlat10_3;
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_LukaRGBPass"
		}
		Pass {
			Name "LSONGPASSRGB"
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
			Cull Off
			GpuProgramID 223893
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[15];
						float _ToggleZoom;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat7;
					bool u_xlatb7;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat7 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlatb7 = u_xlat7>=_FalloffRange;
					    if(u_xlatb7){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb7 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb10 = _ToggleZoom==1.0;
					        u_xlatb7 = u_xlatb10 || u_xlatb7;
					        if(u_xlatb7){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            vs_TEXCOORD0.xy = u_xlat2.xx + u_xlat2.yz;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[15];
						float _ToggleZoom;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec3 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					bool u_xlatb2;
					int u_xlati7;
					vec2 u_xlat8;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlati7 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					    u_xlat1.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat2.xy;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati7].xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlatb10 = u_xlat10>=_FalloffRange;
					    if(u_xlatb10){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb10 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb2 = _ToggleZoom==1.0;
					        u_xlatb10 = u_xlatb10 || u_xlatb2;
					        if(u_xlatb10){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            u_xlat2.xy = u_xlat2.xx + u_xlat2.yz;
					            u_xlat8.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					            vs_TEXCOORD0.xy = u_xlat2.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat8.xy;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleRGB;
						float _ToggleVerticalRGB;
						float _AmountValue;
						float _ToggleAutoanimate;
						float _RGBAutoanimateSpeed;
						float _ToggleColor;
						float _ToggleRotation;
						float _ToggleGreenMovement;
						float _RotationSpeedRed;
						float _RotationSpeedBlue;
						float _RotationSpeedGreen;
						float _DirectionRed;
						float _DirectionBlue;
						float _DirectionGreen;
						float _ToggleScreenFollow;
						float _StrengthMod;
						vec4 _RedCustomColor;
						vec4 _GreenCustomColor;
						vec4 _BlueCustomColor;
						float _ToggleGlitchChromatic;
						float _GlitchRGB;
						float _GlitchRGBSpeed;
						float _GlitchRGBStrength;
						float _runPassFourToggle;
						vec4 unused_0_31;
						vec4 _BGOverlayColor;
						float _ToggleBlockyRGB;
						float _BlockyRGBPush;
						float _ToggleBlockyGlitch;
						float _AllowBGColors;
						float _BGOverlayIntensity;
						float _BGBrokenColorIntensity;
						float _BlockyGlitchStrength;
						float _BlockyGlitchSpeed;
						float _BlockyRGBSpeed;
						float _BDepthX;
						float _BDepthY;
						float _ToggleRGBHide;
						float _RGBHideOffset;
						float _HideRedTrans;
						float _HideGreenTrans;
						float _HideBlueTrans;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					uniform  sampler2D _LukaRGBPass;
					uniform  sampler2D _BlockGlitchMap;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					bvec2 u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					bool u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					bool u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_10;
					bvec2 u_xlatb13;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat15;
					bvec2 u_xlatb15;
					vec3 u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					vec2 u_xlat25;
					bool u_xlatb25;
					vec2 u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat27;
					bool u_xlatb35;
					bool u_xlatb36;
					float u_xlat37;
					bool u_xlatb37;
					float u_xlat38;
					void main()
					{
					    u_xlat0.zw = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaRGBPass, u_xlat0.zw);
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlatb13.x = u_xlat2.x>=_FalloffRange;
					    if(u_xlatb13.x){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlatb13.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassFourToggle);
					        if(u_xlatb13.x){
					            u_xlatb13.xy = equal(vec4(_AllowSmartFalloff, _AllowFadingFalloff, _AllowSmartFalloff, _AllowSmartFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlat2.x = max(u_xlat2.x, _SmartFalloffMin);
					            u_xlat2.x = min(u_xlat2.x, _SmartFalloffMax);
					            u_xlat2.x = u_xlat2.x + (-_SmartFalloffMin);
					            u_xlat2.x = u_xlat2.x / _SmartFalloffMin;
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlatb35 = u_xlat2.x<0.0;
					            u_xlatb3 = 1.0<u_xlat2.x;
					            u_xlat2.x = (u_xlatb3) ? 1.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb35) ? 0.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb13.x) ? u_xlat2.x : 1.0;
					            u_xlatb35 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGB);
					            if(u_xlatb35){
					                u_xlatb3 = _AllowScalarFalloff==1.0;
					                u_xlatb3 = u_xlatb13.x && u_xlatb3;
					                u_xlat14.x = u_xlat2.x * _AmountValue;
					                u_xlat3.x = (u_xlatb3) ? u_xlat14.x : _AmountValue;
					                u_xlatb14 = _ToggleScreenFollow==1.0;
					                u_xlat25.x = u_xlat3.x + _StrengthMod;
					                u_xlat25.x = u_xlat25.x * _Time.x;
					                u_xlat25.x = sin(u_xlat25.x);
					                u_xlatb36 = _ToggleAutoanimate==1.0;
					                u_xlatb4.xy = equal(vec4(_ToggleRotation), vec4(0.0, 1.0, 0.0, 0.0)).xy;
					                u_xlatb36 = u_xlatb36 && u_xlatb4.x;
					                u_xlat4.x = _RGBAutoanimateSpeed * _Time.w;
					                u_xlat4.x = sin(u_xlat4.x);
					                u_xlat4.x = u_xlat3.x * u_xlat4.x;
					                u_xlat4.x = log2(abs(u_xlat4.x));
					                u_xlat4.x = u_xlat4.x * 0.300000012;
					                u_xlat4.x = exp2(u_xlat4.x);
					                u_xlat3.x = (u_xlatb36) ? u_xlat4.x : u_xlat3.x;
					                u_xlat3.x = (u_xlatb14) ? u_xlat25.x : u_xlat3.x;
					                if(u_xlatb4.y){
					                    u_xlat14.xy = vec2(_RotationSpeedRed, _RotationSpeedBlue) * _Time.xx;
					                    u_xlat4.x = sin(u_xlat14.x);
					                    u_xlat5.x = cos(u_xlat14.x);
					                    u_xlat6.x = sin(u_xlat14.y);
					                    u_xlat7.x = cos(u_xlat14.y);
					                    u_xlat14.xy = vec2(_DirectionRed, _DirectionBlue) * vec2(_DirectionRed, _DirectionBlue);
					                    u_xlat14.xy = inversesqrt(u_xlat14.xy);
					                    u_xlat14.xy = u_xlat14.xy * vec2(_DirectionRed, _DirectionBlue);
					                    u_xlat4.x = u_xlat4.x * u_xlat14.x;
					                    u_xlat4.y = u_xlat5.x * u_xlat14.x;
					                    u_xlat5.x = u_xlat6.x * u_xlat14.y;
					                    u_xlat5.y = u_xlat7.x * u_xlat14.y;
					                    u_xlatb14 = _ToggleGreenMovement==1.0;
					                    if(u_xlatb14){
					                        u_xlat14.x = _RotationSpeedGreen * _Time.x;
					                        u_xlat6.x = sin(u_xlat14.x);
					                        u_xlat7.x = cos(u_xlat14.x);
					                        u_xlat14.x = _DirectionGreen * _DirectionGreen;
					                        u_xlat14.x = inversesqrt(u_xlat14.x);
					                        u_xlat14.x = u_xlat14.x * _DirectionGreen;
					                        u_xlat6.x = u_xlat6.x * u_xlat14.x;
					                        u_xlat6.y = u_xlat7.x * u_xlat14.x;
					                        u_xlatb14 = _ToggleColor==1.0;
					                        if(u_xlatb14){
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_7.x * _RedCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.y = u_xlat10_8.y * _GreenCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.z = u_xlat10_8.z * _BlueCustomColor.x;
					                        } else {
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_8.x;
					                            u_xlat7.y = u_xlat10_6.y;
					                        //ENDIF
					                        }
					                    } else {
					                        u_xlatb14 = _ToggleColor==1.0;
					                        if(u_xlatb14){
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_6.x * _RedCustomColor.x;
					                            u_xlat7.y = u_xlat10_1.y * _GreenCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.z = u_xlat10_6.z * _BlueCustomColor.x;
					                        } else {
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_4 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_4.x;
					                            u_xlat7.y = u_xlat10_1.y;
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                } else {
					                    u_xlatb14 = _ToggleVerticalRGB==1.0;
					                    u_xlat4.xy = u_xlat3.xx + vs_TEXCOORD0.yx;
					                    u_xlat4.zw = vs_TEXCOORD0.xy;
					                    u_xlat4.zw = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                    u_xlatb25 = _ToggleColor==1.0;
					                    if(u_xlatb25){
					                        u_xlat25.xy = u_xlat4.zw / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat7.x = u_xlat10_5.x * _RedCustomColor.x;
					                        u_xlat7.y = u_xlat10_1.y * _GreenCustomColor.x;
					                        u_xlat4.xy = (-u_xlat3.xx) + vs_TEXCOORD0.yx;
					                        u_xlat25.xy = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                        u_xlat25.xy = u_xlat25.xy / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat7.z = u_xlat10_5.z * _BlueCustomColor.x;
					                    } else {
					                        u_xlat25.xy = u_xlat4.zw / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat4.xy = (-u_xlat3.xx) + vs_TEXCOORD0.yx;
					                        u_xlat14.xy = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                        u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                        u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                        u_xlat7.x = u_xlat10_5.x;
					                        u_xlat7.y = u_xlat10_1.y;
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					                u_xlat3.x = (-u_xlat3.x) * 0.5 + 1.0;
					                u_xlat7.w = u_xlat10_1.w;
					                u_xlat3 = u_xlat3.xxxx * u_xlat7;
					            } else {
					                u_xlat3 = u_xlat10_1;
					            //ENDIF
					            }
					            u_xlatb4.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleGlitchChromatic);
					            if(u_xlatb4.x){
					                u_xlat15.xy = vec2(_GlitchRGBSpeed, _GlitchRGB) * _Time.ww;
					                u_xlat15.xy = sin(u_xlat15.xy);
					                u_xlat37 = u_xlat15.x * _GlitchRGBStrength;
					                u_xlatb5 = u_xlat15.y>=0.0;
					                u_xlatb16 = 0.5>=u_xlat15.y;
					                u_xlatb5 = u_xlatb16 && u_xlatb5;
					                if(u_xlatb5){
					                    u_xlat5.x = u_xlat15.x * _GlitchRGBStrength + vs_TEXCOORD0.x;
					                    u_xlat5.yw = vs_TEXCOORD0.yy;
					                    u_xlat5.xy = u_xlat5.xy / vs_TEXCOORD0.ww;
					                    u_xlat10_6 = texture(_LukaRGBPass, u_xlat5.xy);
					                    u_xlat5.z = (-u_xlat15.x) * _GlitchRGBStrength + vs_TEXCOORD0.x;
					                    u_xlat5.xy = u_xlat5.zw / vs_TEXCOORD0.ww;
					                    u_xlat5 = texture(_LukaRGBPass, u_xlat5.xy);
					                    u_xlat17 = (-u_xlat37) * 0.5 + 1.0;
					                    u_xlat5.x = u_xlat10_6.x;
					                    u_xlat5.yw = u_xlat10_1.yw;
					                    u_xlat5 = vec4(u_xlat17) * u_xlat5;
					                } else {
					                    u_xlatb26 = u_xlat15.y>=0.5;
					                    if(u_xlatb26){
					                        u_xlat6.y = u_xlat15.x * _GlitchRGBStrength + vs_TEXCOORD0.y;
					                        u_xlat6.xz = vs_TEXCOORD0.xx;
					                        u_xlat6.xy = u_xlat6.xy / vs_TEXCOORD0.ww;
					                        u_xlat10_7 = texture(_LukaRGBPass, u_xlat6.xy);
					                        u_xlat6.w = (-u_xlat15.x) * _GlitchRGBStrength + vs_TEXCOORD0.y;
					                        u_xlat15.xy = u_xlat6.zw / vs_TEXCOORD0.ww;
					                        u_xlat6 = texture(_LukaRGBPass, u_xlat15.xy);
					                        u_xlat15.x = (-u_xlat37) * 0.5 + 1.0;
					                        u_xlat6.x = u_xlat10_7.x;
					                        u_xlat6.yw = u_xlat10_1.yw;
					                        u_xlat5 = u_xlat15.xxxx * u_xlat6;
					                    } else {
					                        u_xlat5 = u_xlat10_1;
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					                u_xlat6 = u_xlat3 + u_xlat5;
					                u_xlat6 = u_xlat6 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb35)) ? u_xlat6 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleBlockyGlitch, _ToggleBlockyRGB, _ToggleBlockyGlitch, _ToggleBlockyGlitch)).xy;
					            u_xlatb15.x = u_xlatb15.y && u_xlatb15.x;
					            if(u_xlatb15.x){
					                u_xlatb26 = _AllowBGColors==0.0;
					                u_xlat26.xy = (bool(u_xlatb26)) ? vec2(0.0, 0.0) : vec2(_BGOverlayIntensity, _BGBrokenColorIntensity);
					                u_xlat5.x = _BlockyGlitchSpeed * _Time.y;
					                u_xlat5.x = sin(u_xlat5.x);
					                u_xlat16.x = u_xlat5.x * u_xlat5.x;
					                u_xlat16.x = u_xlat16.x * u_xlat16.x;
					                u_xlat5.x = u_xlat16.x * u_xlat5.x;
					                u_xlat5.x = u_xlat5.x * _BlockyGlitchStrength;
					                u_xlat16.x = _Time.y * 11.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + _Time.y;
					                u_xlat27.x = sin(_Time.y);
					                u_xlat16.x = u_xlat27.x + u_xlat16.x;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat38 = u_xlat0.w / _BDepthX;
					                u_xlat38 = u_xlat16.x * 0.769999981 + u_xlat38;
					                u_xlat10_6 = texture(_BlockGlitchMap, vec2(u_xlat38));
					                u_xlat38 = u_xlat10_6.x * 20.0;
					                u_xlat38 = floor(u_xlat38);
					                u_xlat38 = u_xlat38 + 66.5999985;
					                u_xlat38 = floor(u_xlat38);
					                u_xlat6.x = sin(u_xlat38);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat38 = u_xlat38 + 1.0;
					                u_xlat16.z = sin(u_xlat38);
					                u_xlat27.xy = u_xlat16.xz * vec2(0.769999981, 43758.5469);
					                u_xlat38 = fract(u_xlat27.y);
					                u_xlat38 = (-u_xlat6.x) + u_xlat38;
					                u_xlat38 = u_xlat38 * 0.599998474 + u_xlat6.x;
					                u_xlat38 = u_xlat38 + -0.5;
					                u_xlatb6 = u_xlat5.x<abs(u_xlat38);
					                u_xlat38 = (u_xlatb6) ? 0.0 : u_xlat38;
					                u_xlat6.x = u_xlat0.z + u_xlat0.z;
					                u_xlat6.x = u_xlat6.x / _BDepthY;
					                u_xlat16.x = u_xlat16.x * 0.769999981 + u_xlat6.x;
					                u_xlat10_6 = texture(_BlockGlitchMap, u_xlat16.xx);
					                u_xlat16.x = u_xlat10_6.x * 20.0;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + 13.6999998;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat6.x = sin(u_xlat16.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat16.x = u_xlat16.x + 1.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * 43758.5469;
					                u_xlat16.x = fract(u_xlat16.x);
					                u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
					                u_xlat16.x = u_xlat16.x * 0.699999809 + u_xlat6.x;
					                u_xlat16.x = u_xlat16.x + -0.5;
					                u_xlatb5 = u_xlat5.x<abs(u_xlat16.x);
					                u_xlat5.x = (u_xlatb5) ? 0.0 : u_xlat16.x;
					                u_xlat5.x = u_xlat5.x * u_xlat38;
					                u_xlat16.x = _BlockyRGBSpeed * _Time.y;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * _BlockyRGBPush;
					                u_xlat6 = u_xlat0.wwwz * vec4(0.0153846154, 0.0111111114, 0.0909090936, 0.0111111114) + u_xlat27.xxxx;
					                u_xlat10_7 = texture(_BlockGlitchMap, u_xlat6.xx);
					                u_xlat27.x = u_xlat10_7.x * 20.0;
					                u_xlat27.x = floor(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x + 341.0;
					                u_xlat27.x = sin(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x * 43758.5469;
					                u_xlat27.x = fract(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x + -0.5;
					                u_xlatb16 = u_xlat16.x<abs(u_xlat27.x);
					                u_xlat16.x = (u_xlatb16) ? 0.0 : u_xlat27.x;
					                u_xlat7.x = u_xlat16.x * 0.100000001;
					                u_xlat7.y = 0.0;
					                u_xlat16.xy = u_xlat0.zw + (-u_xlat7.xy);
					                u_xlat10_8 = texture(_LukaRGBPass, u_xlat16.xy);
					                u_xlat16.xy = u_xlat0.zw + u_xlat7.xy;
					                u_xlat9 = texture(_LukaRGBPass, u_xlat16.xy);
					                u_xlat10_10 = texture(_BlockGlitchMap, u_xlat6.yy);
					                u_xlat16.x = u_xlat10_10.x * 20.0;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + _Time.y;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat27.x = fract(_Time.y);
					                u_xlat38 = sin(u_xlat16.x);
					                u_xlat16.z = u_xlat38 * 43758.5469;
					                u_xlat16.x = u_xlat16.x + 1.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * 43758.5469;
					                u_xlat16.xz = fract(u_xlat16.xz);
					                u_xlat16.x = (-u_xlat16.z) + u_xlat16.x;
					                u_xlat16.x = u_xlat27.x * u_xlat16.x + u_xlat16.z;
					                u_xlat16.x = u_xlat16.x + -0.5;
					                u_xlatb26 = u_xlat26.x<abs(u_xlat16.x);
					                u_xlat26.x = (u_xlatb26) ? 0.0 : u_xlat16.x;
					                u_xlat5.x = max(u_xlat5.x, u_xlat7.x);
					                u_xlat26.x = (-u_xlat26.x) * u_xlat5.x + 1.0;
					                u_xlatb26 = u_xlat26.x==1.0;
					                u_xlat5.xyw = (bool(u_xlatb26)) ? vec3(1.0, 1.0, 1.0) : _BGOverlayColor.xyz;
					                u_xlat10_7 = texture(_BlockGlitchMap, u_xlat6.zz);
					                u_xlat26.x = u_xlat10_7.x * 20.0;
					                u_xlat26.x = floor(u_xlat26.x);
					                u_xlat26.x = u_xlat26.x + _Time.y;
					                u_xlat26.x = floor(u_xlat26.x);
					                u_xlat6.x = sin(u_xlat26.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat26.x = u_xlat26.x + 1.0;
					                u_xlat26.x = sin(u_xlat26.x);
					                u_xlat26.x = u_xlat26.x * 43758.5469;
					                u_xlat26.x = fract(u_xlat26.x);
					                u_xlat26.x = (-u_xlat6.x) + u_xlat26.x;
					                u_xlat26.x = u_xlat27.x * u_xlat26.x + u_xlat6.x;
					                u_xlat26.x = u_xlat26.x + -0.5;
					                u_xlatb6 = u_xlat26.y<abs(u_xlat26.x);
					                u_xlat26.x = (u_xlatb6) ? 0.0 : u_xlat26.x;
					                u_xlat10_6 = texture(_BlockGlitchMap, u_xlat6.ww);
					                u_xlat6.x = u_xlat10_6.x * 20.0;
					                u_xlat6.x = floor(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x + _Time.y;
					                u_xlat6.x = floor(u_xlat6.x);
					                u_xlat17 = sin(u_xlat6.x);
					                u_xlat6.y = u_xlat17 * 43758.5469;
					                u_xlat6.x = u_xlat6.x + 1.0;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.xy = fract(u_xlat6.xy);
					                u_xlat6.x = (-u_xlat6.y) + u_xlat6.x;
					                u_xlat27.x = u_xlat27.x * u_xlat6.x + u_xlat6.y;
					                u_xlat27.x = u_xlat27.x + -0.5;
					                u_xlatb37 = u_xlat26.y<abs(u_xlat27.x);
					                u_xlat37 = (u_xlatb37) ? 0.0 : u_xlat27.x;
					                u_xlat26.x = u_xlat37 * u_xlat26.x;
					                u_xlat26.x = (-u_xlat26.x) * 5.0 + 1.0;
					                u_xlat5.xyz = u_xlat26.xxx * u_xlat5.xyw;
					                u_xlat9.x = u_xlat10_8.x;
					                u_xlat9.y = u_xlat10_1.y;
					                u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
					                u_xlatb26 = u_xlatb35 || u_xlatb4.x;
					                u_xlat5.w = u_xlat10_1.w;
					                u_xlat6 = u_xlat3 + u_xlat5;
					                u_xlat6 = u_xlat6 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb26)) ? u_xlat6 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb26 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGBHide);
					            if(u_xlatb26){
					                u_xlat0.y = u_xlat0.z + _RGBHideOffset;
					                u_xlat10_5 = texture(_LukaRGBPass, u_xlat0.yw);
					                u_xlat0.x = u_xlat0.z + (-_RGBHideOffset);
					                u_xlat10_0 = texture(_LukaRGBPass, u_xlat0.xw);
					                u_xlat5.x = u_xlat10_5.x * _HideRedTrans;
					                u_xlat5.y = u_xlat10_1.y * _HideGreenTrans;
					                u_xlat5.z = u_xlat10_0.z * _HideBlueTrans;
					                u_xlatb0 = u_xlatb35 || u_xlatb4.x;
					                u_xlatb0 = u_xlatb15.x || u_xlatb0;
					                u_xlat5.w = u_xlat10_1.w;
					                u_xlat4 = u_xlat3 + u_xlat5;
					                u_xlat4 = u_xlat4 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb0 = u_xlatb13.y && u_xlatb13.x;
					            if(u_xlatb0){
					                u_xlat0 = (-u_xlat10_1) + u_xlat3;
					                SV_Target0 = u_xlat2.xxxx * u_xlat0 + u_xlat10_1;
					                return;
					            } else {
					                SV_Target0 = u_xlat3;
					                return;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        SV_Target0 = u_xlat10_1;
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _AllowScalarFalloff;
						float _ToggleRGB;
						float _ToggleVerticalRGB;
						float _AmountValue;
						float _ToggleAutoanimate;
						float _RGBAutoanimateSpeed;
						float _ToggleColor;
						float _ToggleRotation;
						float _ToggleGreenMovement;
						float _RotationSpeedRed;
						float _RotationSpeedBlue;
						float _RotationSpeedGreen;
						float _DirectionRed;
						float _DirectionBlue;
						float _DirectionGreen;
						float _ToggleScreenFollow;
						float _StrengthMod;
						vec4 _RedCustomColor;
						vec4 _GreenCustomColor;
						vec4 _BlueCustomColor;
						float _ToggleGlitchChromatic;
						float _GlitchRGB;
						float _GlitchRGBSpeed;
						float _GlitchRGBStrength;
						float _runPassFourToggle;
						vec4 unused_0_31;
						vec4 _BGOverlayColor;
						float _ToggleBlockyRGB;
						float _BlockyRGBPush;
						float _ToggleBlockyGlitch;
						float _AllowBGColors;
						float _BGOverlayIntensity;
						float _BGBrokenColorIntensity;
						float _BlockyGlitchStrength;
						float _BlockyGlitchSpeed;
						float _BlockyRGBSpeed;
						float _BDepthX;
						float _BDepthY;
						float _ToggleRGBHide;
						float _RGBHideOffset;
						float _HideRedTrans;
						float _HideGreenTrans;
						float _HideBlueTrans;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_3_0[64];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_3_2[3];
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					uniform  sampler2D _LukaRGBPass;
					uniform  sampler2D _BlockGlitchMap;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					bool u_xlatb0;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					int u_xlati2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					bvec2 u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					bool u_xlatb5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					bool u_xlatb6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec4 u_xlat10_10;
					bvec2 u_xlatb13;
					vec2 u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat15;
					bvec2 u_xlatb15;
					vec3 u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					vec2 u_xlat25;
					bool u_xlatb25;
					vec2 u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat27;
					bool u_xlatb35;
					bool u_xlatb36;
					float u_xlat37;
					bool u_xlatb37;
					float u_xlat38;
					void main()
					{
					    u_xlat0.zw = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaRGBPass, u_xlat0.zw);
					    u_xlati2 = unity_StereoEyeIndex;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati2].xyz;
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlatb13.x = u_xlat2.x>=_FalloffRange;
					    if(u_xlatb13.x){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlatb13.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassFourToggle);
					        if(u_xlatb13.x){
					            u_xlatb13.xy = equal(vec4(_AllowSmartFalloff, _AllowFadingFalloff, _AllowSmartFalloff, _AllowSmartFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlat2.x = max(u_xlat2.x, _SmartFalloffMin);
					            u_xlat2.x = min(u_xlat2.x, _SmartFalloffMax);
					            u_xlat2.x = u_xlat2.x + (-_SmartFalloffMin);
					            u_xlat2.x = u_xlat2.x / _SmartFalloffMin;
					            u_xlat2.x = (-u_xlat2.x) + 1.0;
					            u_xlatb35 = u_xlat2.x<0.0;
					            u_xlatb3 = 1.0<u_xlat2.x;
					            u_xlat2.x = (u_xlatb3) ? 1.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb35) ? 0.0 : u_xlat2.x;
					            u_xlat2.x = (u_xlatb13.x) ? u_xlat2.x : 1.0;
					            u_xlatb35 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGB);
					            if(u_xlatb35){
					                u_xlatb3 = _AllowScalarFalloff==1.0;
					                u_xlatb3 = u_xlatb13.x && u_xlatb3;
					                u_xlat14.x = u_xlat2.x * _AmountValue;
					                u_xlat3.x = (u_xlatb3) ? u_xlat14.x : _AmountValue;
					                u_xlatb14 = _ToggleScreenFollow==1.0;
					                u_xlat25.x = u_xlat3.x + _StrengthMod;
					                u_xlat25.x = u_xlat25.x * _Time.x;
					                u_xlat25.x = sin(u_xlat25.x);
					                u_xlatb36 = _ToggleAutoanimate==1.0;
					                u_xlatb4.xy = equal(vec4(_ToggleRotation), vec4(0.0, 1.0, 0.0, 0.0)).xy;
					                u_xlatb36 = u_xlatb36 && u_xlatb4.x;
					                u_xlat4.x = _RGBAutoanimateSpeed * _Time.w;
					                u_xlat4.x = sin(u_xlat4.x);
					                u_xlat4.x = u_xlat3.x * u_xlat4.x;
					                u_xlat4.x = log2(abs(u_xlat4.x));
					                u_xlat4.x = u_xlat4.x * 0.300000012;
					                u_xlat4.x = exp2(u_xlat4.x);
					                u_xlat3.x = (u_xlatb36) ? u_xlat4.x : u_xlat3.x;
					                u_xlat3.x = (u_xlatb14) ? u_xlat25.x : u_xlat3.x;
					                if(u_xlatb4.y){
					                    u_xlat14.xy = vec2(_RotationSpeedRed, _RotationSpeedBlue) * _Time.xx;
					                    u_xlat4.x = sin(u_xlat14.x);
					                    u_xlat5.x = cos(u_xlat14.x);
					                    u_xlat6.x = sin(u_xlat14.y);
					                    u_xlat7.x = cos(u_xlat14.y);
					                    u_xlat14.xy = vec2(_DirectionRed, _DirectionBlue) * vec2(_DirectionRed, _DirectionBlue);
					                    u_xlat14.xy = inversesqrt(u_xlat14.xy);
					                    u_xlat14.xy = u_xlat14.xy * vec2(_DirectionRed, _DirectionBlue);
					                    u_xlat4.x = u_xlat4.x * u_xlat14.x;
					                    u_xlat4.y = u_xlat5.x * u_xlat14.x;
					                    u_xlat5.x = u_xlat6.x * u_xlat14.y;
					                    u_xlat5.y = u_xlat7.x * u_xlat14.y;
					                    u_xlatb14 = _ToggleGreenMovement==1.0;
					                    if(u_xlatb14){
					                        u_xlat14.x = _RotationSpeedGreen * _Time.x;
					                        u_xlat6.x = sin(u_xlat14.x);
					                        u_xlat7.x = cos(u_xlat14.x);
					                        u_xlat14.x = _DirectionGreen * _DirectionGreen;
					                        u_xlat14.x = inversesqrt(u_xlat14.x);
					                        u_xlat14.x = u_xlat14.x * _DirectionGreen;
					                        u_xlat6.x = u_xlat6.x * u_xlat14.x;
					                        u_xlat6.y = u_xlat7.x * u_xlat14.x;
					                        u_xlatb14 = _ToggleColor==1.0;
					                        if(u_xlatb14){
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_7.x * _RedCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.y = u_xlat10_8.y * _GreenCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.z = u_xlat10_8.z * _BlueCustomColor.x;
					                        } else {
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_8 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_8.x;
					                            u_xlat7.y = u_xlat10_6.y;
					                        //ENDIF
					                        }
					                    } else {
					                        u_xlatb14 = _ToggleColor==1.0;
					                        if(u_xlatb14){
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_6.x * _RedCustomColor.x;
					                            u_xlat7.y = u_xlat10_1.y * _GreenCustomColor.x;
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_6 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.z = u_xlat10_6.z * _BlueCustomColor.x;
					                        } else {
					                            u_xlat14.xy = u_xlat3.xx * u_xlat4.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat10_4 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat14.xy = u_xlat3.xx * u_xlat5.xy + vs_TEXCOORD0.xy;
					                            u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                            u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                            u_xlat7.x = u_xlat10_4.x;
					                            u_xlat7.y = u_xlat10_1.y;
					                        //ENDIF
					                        }
					                    //ENDIF
					                    }
					                } else {
					                    u_xlatb14 = _ToggleVerticalRGB==1.0;
					                    u_xlat4.xy = u_xlat3.xx + vs_TEXCOORD0.yx;
					                    u_xlat4.zw = vs_TEXCOORD0.xy;
					                    u_xlat4.zw = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                    u_xlatb25 = _ToggleColor==1.0;
					                    if(u_xlatb25){
					                        u_xlat25.xy = u_xlat4.zw / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat7.x = u_xlat10_5.x * _RedCustomColor.x;
					                        u_xlat7.y = u_xlat10_1.y * _GreenCustomColor.x;
					                        u_xlat4.xy = (-u_xlat3.xx) + vs_TEXCOORD0.yx;
					                        u_xlat25.xy = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                        u_xlat25.xy = u_xlat25.xy / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat7.z = u_xlat10_5.z * _BlueCustomColor.x;
					                    } else {
					                        u_xlat25.xy = u_xlat4.zw / vs_TEXCOORD0.ww;
					                        u_xlat10_5 = texture(_LukaRGBPass, u_xlat25.xy);
					                        u_xlat4.xy = (-u_xlat3.xx) + vs_TEXCOORD0.yx;
					                        u_xlat14.xy = (bool(u_xlatb14)) ? u_xlat4.zx : u_xlat4.yw;
					                        u_xlat14.xy = u_xlat14.xy / vs_TEXCOORD0.ww;
					                        u_xlat7 = texture(_LukaRGBPass, u_xlat14.xy);
					                        u_xlat7.x = u_xlat10_5.x;
					                        u_xlat7.y = u_xlat10_1.y;
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					                u_xlat3.x = (-u_xlat3.x) * 0.5 + 1.0;
					                u_xlat7.w = u_xlat10_1.w;
					                u_xlat3 = u_xlat3.xxxx * u_xlat7;
					            } else {
					                u_xlat3 = u_xlat10_1;
					            //ENDIF
					            }
					            u_xlatb4.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleGlitchChromatic);
					            if(u_xlatb4.x){
					                u_xlat15.xy = vec2(_GlitchRGBSpeed, _GlitchRGB) * _Time.ww;
					                u_xlat15.xy = sin(u_xlat15.xy);
					                u_xlat37 = u_xlat15.x * _GlitchRGBStrength;
					                u_xlatb5 = u_xlat15.y>=0.0;
					                u_xlatb16 = 0.5>=u_xlat15.y;
					                u_xlatb5 = u_xlatb16 && u_xlatb5;
					                if(u_xlatb5){
					                    u_xlat5.x = u_xlat15.x * _GlitchRGBStrength + vs_TEXCOORD0.x;
					                    u_xlat5.yw = vs_TEXCOORD0.yy;
					                    u_xlat5.xy = u_xlat5.xy / vs_TEXCOORD0.ww;
					                    u_xlat10_6 = texture(_LukaRGBPass, u_xlat5.xy);
					                    u_xlat5.z = (-u_xlat15.x) * _GlitchRGBStrength + vs_TEXCOORD0.x;
					                    u_xlat5.xy = u_xlat5.zw / vs_TEXCOORD0.ww;
					                    u_xlat5 = texture(_LukaRGBPass, u_xlat5.xy);
					                    u_xlat17 = (-u_xlat37) * 0.5 + 1.0;
					                    u_xlat5.x = u_xlat10_6.x;
					                    u_xlat5.yw = u_xlat10_1.yw;
					                    u_xlat5 = vec4(u_xlat17) * u_xlat5;
					                } else {
					                    u_xlatb26 = u_xlat15.y>=0.5;
					                    if(u_xlatb26){
					                        u_xlat6.y = u_xlat15.x * _GlitchRGBStrength + vs_TEXCOORD0.y;
					                        u_xlat6.xz = vs_TEXCOORD0.xx;
					                        u_xlat6.xy = u_xlat6.xy / vs_TEXCOORD0.ww;
					                        u_xlat10_7 = texture(_LukaRGBPass, u_xlat6.xy);
					                        u_xlat6.w = (-u_xlat15.x) * _GlitchRGBStrength + vs_TEXCOORD0.y;
					                        u_xlat15.xy = u_xlat6.zw / vs_TEXCOORD0.ww;
					                        u_xlat6 = texture(_LukaRGBPass, u_xlat15.xy);
					                        u_xlat15.x = (-u_xlat37) * 0.5 + 1.0;
					                        u_xlat6.x = u_xlat10_7.x;
					                        u_xlat6.yw = u_xlat10_1.yw;
					                        u_xlat5 = u_xlat15.xxxx * u_xlat6;
					                    } else {
					                        u_xlat5 = u_xlat10_1;
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					                u_xlat6 = u_xlat3 + u_xlat5;
					                u_xlat6 = u_xlat6 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb35)) ? u_xlat6 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_ToggleBlockyGlitch, _ToggleBlockyRGB, _ToggleBlockyGlitch, _ToggleBlockyGlitch)).xy;
					            u_xlatb15.x = u_xlatb15.y && u_xlatb15.x;
					            if(u_xlatb15.x){
					                u_xlatb26 = _AllowBGColors==0.0;
					                u_xlat26.xy = (bool(u_xlatb26)) ? vec2(0.0, 0.0) : vec2(_BGOverlayIntensity, _BGBrokenColorIntensity);
					                u_xlat5.x = _BlockyGlitchSpeed * _Time.y;
					                u_xlat5.x = sin(u_xlat5.x);
					                u_xlat16.x = u_xlat5.x * u_xlat5.x;
					                u_xlat16.x = u_xlat16.x * u_xlat16.x;
					                u_xlat5.x = u_xlat16.x * u_xlat5.x;
					                u_xlat5.x = u_xlat5.x * _BlockyGlitchStrength;
					                u_xlat16.x = _Time.y * 11.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + _Time.y;
					                u_xlat27.x = sin(_Time.y);
					                u_xlat16.x = u_xlat27.x + u_xlat16.x;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat38 = u_xlat0.w / _BDepthX;
					                u_xlat38 = u_xlat16.x * 0.769999981 + u_xlat38;
					                u_xlat10_6 = texture(_BlockGlitchMap, vec2(u_xlat38));
					                u_xlat38 = u_xlat10_6.x * 20.0;
					                u_xlat38 = floor(u_xlat38);
					                u_xlat38 = u_xlat38 + 66.5999985;
					                u_xlat38 = floor(u_xlat38);
					                u_xlat6.x = sin(u_xlat38);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat38 = u_xlat38 + 1.0;
					                u_xlat16.z = sin(u_xlat38);
					                u_xlat27.xy = u_xlat16.xz * vec2(0.769999981, 43758.5469);
					                u_xlat38 = fract(u_xlat27.y);
					                u_xlat38 = (-u_xlat6.x) + u_xlat38;
					                u_xlat38 = u_xlat38 * 0.599998474 + u_xlat6.x;
					                u_xlat38 = u_xlat38 + -0.5;
					                u_xlatb6 = u_xlat5.x<abs(u_xlat38);
					                u_xlat38 = (u_xlatb6) ? 0.0 : u_xlat38;
					                u_xlat6.x = u_xlat0.z + u_xlat0.z;
					                u_xlat6.x = u_xlat6.x / _BDepthY;
					                u_xlat16.x = u_xlat16.x * 0.769999981 + u_xlat6.x;
					                u_xlat10_6 = texture(_BlockGlitchMap, u_xlat16.xx);
					                u_xlat16.x = u_xlat10_6.x * 20.0;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + 13.6999998;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat6.x = sin(u_xlat16.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat16.x = u_xlat16.x + 1.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * 43758.5469;
					                u_xlat16.x = fract(u_xlat16.x);
					                u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
					                u_xlat16.x = u_xlat16.x * 0.699999809 + u_xlat6.x;
					                u_xlat16.x = u_xlat16.x + -0.5;
					                u_xlatb5 = u_xlat5.x<abs(u_xlat16.x);
					                u_xlat5.x = (u_xlatb5) ? 0.0 : u_xlat16.x;
					                u_xlat5.x = u_xlat5.x * u_xlat38;
					                u_xlat16.x = _BlockyRGBSpeed * _Time.y;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * _BlockyRGBPush;
					                u_xlat6 = u_xlat0.wwwz * vec4(0.0153846154, 0.0111111114, 0.0909090936, 0.0111111114) + u_xlat27.xxxx;
					                u_xlat10_7 = texture(_BlockGlitchMap, u_xlat6.xx);
					                u_xlat27.x = u_xlat10_7.x * 20.0;
					                u_xlat27.x = floor(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x + 341.0;
					                u_xlat27.x = sin(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x * 43758.5469;
					                u_xlat27.x = fract(u_xlat27.x);
					                u_xlat27.x = u_xlat27.x + -0.5;
					                u_xlatb16 = u_xlat16.x<abs(u_xlat27.x);
					                u_xlat16.x = (u_xlatb16) ? 0.0 : u_xlat27.x;
					                u_xlat7.x = u_xlat16.x * 0.100000001;
					                u_xlat7.y = 0.0;
					                u_xlat16.xy = u_xlat0.zw + (-u_xlat7.xy);
					                u_xlat10_8 = texture(_LukaRGBPass, u_xlat16.xy);
					                u_xlat16.xy = u_xlat0.zw + u_xlat7.xy;
					                u_xlat9 = texture(_LukaRGBPass, u_xlat16.xy);
					                u_xlat10_10 = texture(_BlockGlitchMap, u_xlat6.yy);
					                u_xlat16.x = u_xlat10_10.x * 20.0;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x + _Time.y;
					                u_xlat16.x = floor(u_xlat16.x);
					                u_xlat27.x = fract(_Time.y);
					                u_xlat38 = sin(u_xlat16.x);
					                u_xlat16.z = u_xlat38 * 43758.5469;
					                u_xlat16.x = u_xlat16.x + 1.0;
					                u_xlat16.x = sin(u_xlat16.x);
					                u_xlat16.x = u_xlat16.x * 43758.5469;
					                u_xlat16.xz = fract(u_xlat16.xz);
					                u_xlat16.x = (-u_xlat16.z) + u_xlat16.x;
					                u_xlat16.x = u_xlat27.x * u_xlat16.x + u_xlat16.z;
					                u_xlat16.x = u_xlat16.x + -0.5;
					                u_xlatb26 = u_xlat26.x<abs(u_xlat16.x);
					                u_xlat26.x = (u_xlatb26) ? 0.0 : u_xlat16.x;
					                u_xlat5.x = max(u_xlat5.x, u_xlat7.x);
					                u_xlat26.x = (-u_xlat26.x) * u_xlat5.x + 1.0;
					                u_xlatb26 = u_xlat26.x==1.0;
					                u_xlat5.xyw = (bool(u_xlatb26)) ? vec3(1.0, 1.0, 1.0) : _BGOverlayColor.xyz;
					                u_xlat10_7 = texture(_BlockGlitchMap, u_xlat6.zz);
					                u_xlat26.x = u_xlat10_7.x * 20.0;
					                u_xlat26.x = floor(u_xlat26.x);
					                u_xlat26.x = u_xlat26.x + _Time.y;
					                u_xlat26.x = floor(u_xlat26.x);
					                u_xlat6.x = sin(u_xlat26.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.x = fract(u_xlat6.x);
					                u_xlat26.x = u_xlat26.x + 1.0;
					                u_xlat26.x = sin(u_xlat26.x);
					                u_xlat26.x = u_xlat26.x * 43758.5469;
					                u_xlat26.x = fract(u_xlat26.x);
					                u_xlat26.x = (-u_xlat6.x) + u_xlat26.x;
					                u_xlat26.x = u_xlat27.x * u_xlat26.x + u_xlat6.x;
					                u_xlat26.x = u_xlat26.x + -0.5;
					                u_xlatb6 = u_xlat26.y<abs(u_xlat26.x);
					                u_xlat26.x = (u_xlatb6) ? 0.0 : u_xlat26.x;
					                u_xlat10_6 = texture(_BlockGlitchMap, u_xlat6.ww);
					                u_xlat6.x = u_xlat10_6.x * 20.0;
					                u_xlat6.x = floor(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x + _Time.y;
					                u_xlat6.x = floor(u_xlat6.x);
					                u_xlat17 = sin(u_xlat6.x);
					                u_xlat6.y = u_xlat17 * 43758.5469;
					                u_xlat6.x = u_xlat6.x + 1.0;
					                u_xlat6.x = sin(u_xlat6.x);
					                u_xlat6.x = u_xlat6.x * 43758.5469;
					                u_xlat6.xy = fract(u_xlat6.xy);
					                u_xlat6.x = (-u_xlat6.y) + u_xlat6.x;
					                u_xlat27.x = u_xlat27.x * u_xlat6.x + u_xlat6.y;
					                u_xlat27.x = u_xlat27.x + -0.5;
					                u_xlatb37 = u_xlat26.y<abs(u_xlat27.x);
					                u_xlat37 = (u_xlatb37) ? 0.0 : u_xlat27.x;
					                u_xlat26.x = u_xlat37 * u_xlat26.x;
					                u_xlat26.x = (-u_xlat26.x) * 5.0 + 1.0;
					                u_xlat5.xyz = u_xlat26.xxx * u_xlat5.xyw;
					                u_xlat9.x = u_xlat10_8.x;
					                u_xlat9.y = u_xlat10_1.y;
					                u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
					                u_xlatb26 = u_xlatb35 || u_xlatb4.x;
					                u_xlat5.w = u_xlat10_1.w;
					                u_xlat6 = u_xlat3 + u_xlat5;
					                u_xlat6 = u_xlat6 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb26)) ? u_xlat6 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb26 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleRGBHide);
					            if(u_xlatb26){
					                u_xlat0.y = u_xlat0.z + _RGBHideOffset;
					                u_xlat10_5 = texture(_LukaRGBPass, u_xlat0.yw);
					                u_xlat0.x = u_xlat0.z + (-_RGBHideOffset);
					                u_xlat10_0 = texture(_LukaRGBPass, u_xlat0.xw);
					                u_xlat5.x = u_xlat10_5.x * _HideRedTrans;
					                u_xlat5.y = u_xlat10_1.y * _HideGreenTrans;
					                u_xlat5.z = u_xlat10_0.z * _HideBlueTrans;
					                u_xlatb0 = u_xlatb35 || u_xlatb4.x;
					                u_xlatb0 = u_xlatb15.x || u_xlatb0;
					                u_xlat5.w = u_xlat10_1.w;
					                u_xlat4 = u_xlat3 + u_xlat5;
					                u_xlat4 = u_xlat4 * vec4(0.5, 0.5, 0.5, 0.5);
					                u_xlat3 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat5;
					            //ENDIF
					            }
					            u_xlatb0 = u_xlatb13.y && u_xlatb13.x;
					            if(u_xlatb0){
					                u_xlat0 = (-u_xlat10_1) + u_xlat3;
					                SV_Target0 = u_xlat2.xxxx * u_xlat0 + u_xlat10_1;
					                return;
					            } else {
					                SV_Target0 = u_xlat3;
					                return;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        SV_Target0 = u_xlat10_1;
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
		GrabPass {
			"_LukaOverlayPass"
		}
		Pass {
			Name "LSONGPASSOVERLAYS"
			Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "ALWAYS" "QUEUE" = "Transparent+2000" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			Cull Off
			GpuProgramID 274604
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[22];
						float _ToggleZoom;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat7;
					bool u_xlatb7;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat7 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat7 = sqrt(u_xlat7);
					    u_xlatb7 = u_xlat7>=_FalloffRange;
					    if(u_xlatb7){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb7 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb10 = _ToggleZoom==1.0;
					        u_xlatb7 = u_xlatb10 || u_xlatb7;
					        if(u_xlatb7){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            vs_TEXCOORD0.xy = u_xlat2.xx + u_xlat2.yz;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_SINGLE_PASS_STEREO" }
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _ToggleRenderLookAtMe;
						vec4 unused_0_3[22];
						float _ToggleZoom;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[6];
					};
					layout(std140) uniform UnityStereoGlobals {
						vec4 unused_2_0[24];
						mat4x4 unity_StereoMatrixVP[2];
						vec4 unused_2_2[36];
						vec3 unity_StereoWorldSpaceCameraPos[2];
						vec4 unused_2_4;
						vec4 unity_StereoScaleOffset[2];
						vec4 unused_2_6;
					};
					layout(std140) uniform UnityStereoEyeIndex {
						int unity_StereoEyeIndex;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD1;
					out vec4 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec3 u_xlat1;
					int u_xlati1;
					vec4 u_xlat2;
					bool u_xlatb2;
					int u_xlati7;
					vec2 u_xlat8;
					float u_xlat10;
					bool u_xlatb10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD3 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlati1 = unity_StereoEyeIndex << 2;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat2 = u_xlat0.yyyy * unity_StereoMatrixVP[(u_xlati1 + 1) / 4][(u_xlati1 + 1) % 4];
					    u_xlat2 = unity_StereoMatrixVP[u_xlati1 / 4][u_xlati1 % 4] * u_xlat0.xxxx + u_xlat2;
					    u_xlat2 = unity_StereoMatrixVP[(u_xlati1 + 2) / 4][(u_xlati1 + 2) % 4] * u_xlat0.zzzz + u_xlat2;
					    u_xlat0 = unity_StereoMatrixVP[(u_xlati1 + 3) / 4][(u_xlati1 + 3) % 4] * u_xlat0.wwww + u_xlat2;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    u_xlat1.xy = u_xlat1.yy + u_xlat1.xz;
					    u_xlati7 = unity_StereoEyeIndex;
					    u_xlat2.xy = u_xlat0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					    u_xlat1.xy = u_xlat1.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat2.xy;
					    u_xlat2.xyz = (-unity_ObjectToWorld[3].xyz) + unity_StereoWorldSpaceCameraPos[u_xlati7].xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = sqrt(u_xlat10);
					    u_xlatb10 = u_xlat10>=_FalloffRange;
					    if(u_xlatb10){
					        vs_TEXCOORD0.xy = u_xlat1.xy;
					        vs_TEXCOORD0.zw = u_xlat0.zw;
					        gl_Position = u_xlat0;
					    } else {
					        u_xlatb10 = _ToggleRenderLookAtMe==1.0;
					        u_xlatb2 = _ToggleZoom==1.0;
					        u_xlatb10 = u_xlatb10 || u_xlatb2;
					        if(u_xlatb10){
					            u_xlat2.xyz = in_POSITION0.wxy * vec3(0.5, 1.0, -1.0);
					            u_xlat2.xy = u_xlat2.xx + u_xlat2.yz;
					            u_xlat8.xy = in_POSITION0.ww * unity_StereoScaleOffset[u_xlati7].zw;
					            vs_TEXCOORD0.xy = u_xlat2.xy * unity_StereoScaleOffset[u_xlati7].xy + u_xlat8.xy;
					            vs_TEXCOORD0.zw = in_POSITION0.zw;
					            gl_Position = in_POSITION0 * vec4(2.0, 2.0, 1.0, 1.0);
					        } else {
					            vs_TEXCOORD0.zw = u_xlat0.zw;
					            vs_TEXCOORD0.xy = u_xlat1.xy;
					            gl_Position = u_xlat0;
					        //ENDIF
					        }
					    //ENDIF
					    }
					    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[5];
						float _FalloffRange;
						float _AllowSmartFalloff;
						float _SmartFalloffMin;
						float _SmartFalloffMax;
						float _AllowFadingFalloff;
						float _ToggleOverlay;
						float _OverlayTransparency;
						float _OverlayXAdjust;
						float _OverlayYAdjust;
						float _OverlayTiling;
						float _OverlayXShift;
						float _OverlayYShift;
						vec4 unused_0_13[2];
						float _ToggleOverlayTwo;
						float _OverlayTransparencyTwo;
						float _OverlayXAdjustTwo;
						float _OverlayYAdjustTwo;
						float _OverlayTilingTwo;
						float _OverlayXShiftTwo;
						float _OverlayYShiftTwo;
						vec4 unused_0_21;
						float _ToggleOverlayThree;
						float _OverlayTransparencyThree;
						float _OverlayXAdjustThree;
						float _OverlayYAdjustThree;
						float _OverlayTilingThree;
						float _OverlayXShiftThree;
						float _OverlayYShiftThree;
						float _OverlayTrans;
						float _OverlayTransX;
						float _OverlayTransY;
						float _OverlayTransTwo;
						float _OverlayTransXTwo;
						float _OverlayTransYTwo;
						float _OverlayTransThree;
						float _OverlayTransXThree;
						float _OverlayTransYThree;
						vec4 unused_0_38;
						float _ToggleGifOverlay;
						float _OSSRows;
						float _OSSColumns;
						float _OSSSpeed;
						float _GifTransparency;
						float _GifXAdjust;
						float _GifYAdjust;
						float _GifTiling;
						float _GifXShift;
						float _GifYShift;
						float _ToggleTransparentGif;
						float _GifBackgroundTolerance;
						vec4 _OverlaySpritesheet_ST;
						vec4 unused_0_52;
						vec4 _GifColorToCut;
						float _runPassFiveToggle;
						float _TransX;
						float _TransY;
						float _ToggleTransistion;
						float _ToggleDiagTrans;
						float _TransDL;
						float _TransDR;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[3];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_3;
						vec4 _ScreenParams;
						vec4 unused_1_5[2];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[6];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[9];
						mat4x4 unity_MatrixV;
						vec4 unused_3_2[10];
					};
					uniform  sampler2D _LukaOverlayPass;
					uniform  sampler2D _OverlayTexture;
					uniform  sampler2D _OverlayTextureTwo;
					uniform  sampler2D _OverlayTextureThree;
					uniform  sampler2D _OverlaySpritesheet;
					uniform  sampler2D _LukaFirstPass;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					bvec3 u_xlatb4;
					vec4 u_xlat5;
					bvec3 u_xlatb5;
					vec4 u_xlat6;
					bool u_xlatb7;
					float u_xlat14;
					bool u_xlatb14;
					vec2 u_xlat16;
					bvec2 u_xlatb16;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat23;
					bool u_xlatb23;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat10_1 = texture(_LukaOverlayPass, u_xlat0.xy);
					    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + (-unity_ObjectToWorld[3].xyz);
					    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat14 = sqrt(u_xlat14);
					    u_xlatb21 = u_xlat14>=_FalloffRange;
					    if(u_xlatb21){
					        SV_Target0 = u_xlat10_1;
					        return;
					    } else {
					        u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_runPassFiveToggle);
					        if(u_xlatb21){
					            u_xlat2.xyz = vs_TEXCOORD3.xyz + (-_WorldSpaceCameraPos.xyz);
					            u_xlat3.xyz = u_xlat2.yyy * unity_MatrixV[1].xyz;
					            u_xlat2.xyw = unity_MatrixV[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					            u_xlat2.xyz = unity_MatrixV[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
					            u_xlat2.xy = u_xlat2.xy / u_xlat2.zz;
					            u_xlat21 = _ScreenParams.z / _ScreenParams.w;
					            u_xlat21 = u_xlat2.x * u_xlat21;
					            u_xlatb2 = _ToggleOverlay==1.0;
					            if(u_xlatb2){
					                u_xlat3.x = u_xlat21 * _OverlayXAdjust + _OverlayYShift;
					                u_xlat3.y = u_xlat2.y * _OverlayYAdjust + _OverlayXShift;
					                u_xlat16.xy = u_xlat3.xy * vec2(vec2(_OverlayTiling, _OverlayTiling)) + vec2(0.5, 0.5);
					                u_xlat3 = texture(_OverlayTexture, u_xlat16.xy);
					                u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_OverlayTrans);
					                u_xlatb4.xy = greaterThanEqual(u_xlat0.yxyy, vec4(_OverlayTransY, _OverlayTransX, _OverlayTransY, _OverlayTransY)).xy;
					                u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
					                u_xlat5 = (-u_xlat10_1) + u_xlat3;
					                u_xlat5 = u_xlat4.xxxx * u_xlat5;
					                u_xlat4 = u_xlat4.yyyy * u_xlat5 + u_xlat10_1;
					                u_xlat3 = (u_xlatb16.x) ? u_xlat4 : u_xlat3;
					                u_xlat3 = (-u_xlat10_1) + u_xlat3;
					                u_xlat3 = vec4(vec4(_OverlayTransparency, _OverlayTransparency, _OverlayTransparency, _OverlayTransparency)) * u_xlat3 + u_xlat10_1;
					            } else {
					                u_xlat3 = u_xlat10_1;
					            //ENDIF
					            }
					            u_xlatb16.x = _ToggleOverlayTwo==1.0;
					            u_xlatb16.x = u_xlatb16.x && u_xlatb2;
					            if(u_xlatb16.x){
					                u_xlat4.x = u_xlat21 * _OverlayXAdjustTwo + _OverlayYShiftTwo;
					                u_xlat4.y = u_xlat2.y * _OverlayYAdjustTwo + _OverlayXShiftTwo;
					                u_xlat16.xy = u_xlat4.xy * vec2(_OverlayTilingTwo) + vec2(0.5, 0.5);
					                u_xlat4 = texture(_OverlayTextureTwo, u_xlat16.xy);
					                u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_OverlayTransTwo);
					                u_xlatb23 = u_xlat0.y>=_OverlayTransYTwo;
					                u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
					                u_xlat5 = (-u_xlat3) + u_xlat4;
					                u_xlat5 = vec4(u_xlat23) * u_xlat5;
					                u_xlatb23 = u_xlat0.x>=_OverlayTransXTwo;
					                u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
					                u_xlat5 = vec4(u_xlat23) * u_xlat5 + u_xlat3;
					                u_xlat4 = (u_xlatb16.x) ? u_xlat5 : u_xlat4;
					                u_xlat4 = (-u_xlat3) + u_xlat4;
					                u_xlat4 = vec4(vec4(_OverlayTransparencyTwo, _OverlayTransparencyTwo, _OverlayTransparencyTwo, _OverlayTransparencyTwo)) * u_xlat4 + u_xlat3;
					                u_xlat3 = max(u_xlat3, u_xlat4);
					            //ENDIF
					            }
					            u_xlatb16.x = _ToggleOverlayThree==1.0;
					            u_xlatb2 = u_xlatb16.x && u_xlatb2;
					            if(u_xlatb2){
					                u_xlat4.x = u_xlat21 * _OverlayXAdjustThree + _OverlayYShiftThree;
					                u_xlat4.y = u_xlat2.y * _OverlayYAdjustThree + _OverlayXShiftThree;
					                u_xlat2.xz = u_xlat4.xy * vec2(_OverlayTilingThree) + vec2(0.5, 0.5);
					                u_xlat4 = texture(_OverlayTextureThree, u_xlat2.xz);
					                u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_OverlayTransThree);
					                u_xlatb16.xy = greaterThanEqual(u_xlat0.yxyx, vec4(_OverlayTransYThree, _OverlayTransXThree, _OverlayTransYThree, _OverlayTransXThree)).xy;
					                u_xlat16.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb16.xy));
					                u_xlat5 = (-u_xlat3) + u_xlat4;
					                u_xlat5 = u_xlat16.xxxx * u_xlat5;
					                u_xlat5 = u_xlat16.yyyy * u_xlat5 + u_xlat3;
					                u_xlat4 = (bool(u_xlatb2)) ? u_xlat5 : u_xlat4;
					                u_xlat4 = (-u_xlat3) + u_xlat4;
					                u_xlat4 = vec4(vec4(_OverlayTransparencyThree, _OverlayTransparencyThree, _OverlayTransparencyThree, _OverlayTransparencyThree)) * u_xlat4 + u_xlat3;
					                u_xlat3 = max(u_xlat3, u_xlat4);
					            //ENDIF
					            }
					            u_xlatb2 = _ToggleGifOverlay==1.0;
					            if(u_xlatb2){
					                u_xlat4.x = u_xlat21 * _GifXAdjust + _GifYShift;
					                u_xlat4.y = u_xlat2.y * _GifYAdjust + _GifXShift;
					                u_xlat2.xy = u_xlat4.xy * vec2(_GifTiling) + vec2(0.5, 0.5);
					                u_xlat21 = _OSSColumns * _OSSRows;
					                u_xlat16.x = _OSSSpeed * _Time.y;
					                u_xlat16.x = fract(u_xlat16.x);
					                u_xlat21 = u_xlat21 * u_xlat16.x;
					                u_xlat21 = roundEven(u_xlat21);
					                u_xlat2.xy = u_xlat2.xy / vec2(_OSSRows, _OSSColumns);
					                u_xlat2.xy = u_xlat2.xy + vec2(_OSSRows, _OSSColumns);
					                u_xlat21 = u_xlat21 / _OSSRows;
					                u_xlatb23 = u_xlat21>=(-u_xlat21);
					                u_xlat4.x = fract(abs(u_xlat21));
					                u_xlat23 = (u_xlatb23) ? u_xlat4.x : (-u_xlat4.x);
					                u_xlat23 = u_xlat23 * _OSSRows;
					                u_xlat4.x = u_xlat23 / _OSSRows;
					                u_xlat21 = floor(u_xlat21);
					                u_xlat21 = u_xlat21 / _OSSColumns;
					                u_xlat4.y = (-u_xlat21) + u_xlat2.y;
					                u_xlat2.z = 1.0;
					                u_xlat2.xy = u_xlat2.xz + u_xlat4.xy;
					                u_xlat2.xy = u_xlat2.xy * _OverlaySpritesheet_ST.xy + _OverlaySpritesheet_ST.zw;
					                u_xlat10_2 = texture(_OverlaySpritesheet, u_xlat2.xy);
					                u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleTransparentGif);
					                u_xlat4.xyz = (-vec3(_GifBackgroundTolerance)) + _GifColorToCut.xyz;
					                u_xlatb4.xyz = greaterThanEqual(u_xlat10_2.xyzx, u_xlat4.xyzx).xyz;
					                u_xlat5.xyz = vec3(_GifBackgroundTolerance) + _GifColorToCut.xyz;
					                u_xlatb5.xyz = greaterThanEqual(u_xlat5.xyzx, u_xlat10_2.xyzx).xyz;
					                u_xlatb4.x = u_xlatb4.x && u_xlatb5.x;
					                u_xlatb4.y = u_xlatb4.y && u_xlatb5.y;
					                u_xlatb4.z = u_xlatb4.z && u_xlatb5.z;
					                u_xlatb21 = u_xlatb21 && u_xlatb4.x;
					                u_xlatb21 = u_xlatb4.y && u_xlatb21;
					                u_xlatb21 = u_xlatb4.z && u_xlatb21;
					                if(u_xlatb21){
					                    SV_Target0 = u_xlat10_1;
					                    return;
					                //ENDIF
					                }
					                u_xlat2 = (-u_xlat3) + u_xlat10_2;
					                u_xlat3 = vec4(vec4(_GifTransparency, _GifTransparency, _GifTransparency, _GifTransparency)) * u_xlat2 + u_xlat3;
					            //ENDIF
					            }
					            u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleTransistion);
					            if(u_xlatb21){
					                u_xlat10_2 = texture(_LukaFirstPass, u_xlat0.xy);
					                u_xlatb4.xy = greaterThanEqual(u_xlat0.xyxx, vec4(_TransX, _TransY, _TransX, _TransX)).xy;
					                u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
					                u_xlat5 = (-u_xlat10_2) + u_xlat3;
					                u_xlat5 = u_xlat4.xxxx * u_xlat5;
					                u_xlat6 = u_xlat4.yyyy * u_xlat5;
					                u_xlat4 = u_xlat4.yyyy * u_xlat5 + u_xlat10_2;
					                u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ToggleDiagTrans);
					                u_xlat5.x = (-u_xlat0.y) + _TransDR;
					                u_xlatb5.x = u_xlat0.x>=u_xlat5.x;
					                u_xlat5.x = u_xlatb5.x ? 1.0 : float(0.0);
					                u_xlat5 = u_xlat6 * u_xlat5.xxxx;
					                u_xlat0.x = u_xlat0.x + _TransDL;
					                u_xlatb0.x = u_xlat0.y>=u_xlat0.x;
					                u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
					                u_xlat2 = u_xlat0.xxxx * u_xlat5 + u_xlat10_2;
					                u_xlat3 = (bool(u_xlatb21)) ? u_xlat2 : u_xlat4;
					            //ENDIF
					            }
					            u_xlatb0.xy = equal(vec4(_AllowSmartFalloff, _AllowFadingFalloff, _AllowSmartFalloff, _AllowSmartFalloff), vec4(1.0, 1.0, 0.0, 0.0)).xy;
					            u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
					            if(u_xlatb0.x){
					                u_xlat0.x = max(u_xlat14, _SmartFalloffMin);
					                u_xlat0.x = min(u_xlat0.x, _SmartFalloffMax);
					                u_xlat0.x = u_xlat0.x + (-_SmartFalloffMin);
					                u_xlat0.x = u_xlat0.x / _SmartFalloffMin;
					                u_xlat0.x = (-u_xlat0.x) + 1.0;
					                u_xlatb7 = u_xlat0.x<0.0;
					                u_xlatb14 = 1.0<u_xlat0.x;
					                u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
					                u_xlat0.x = (u_xlatb7) ? 0.0 : u_xlat0.x;
					                u_xlat2 = (-u_xlat10_1) + u_xlat3;
					                SV_Target0 = u_xlat0.xxxx * u_xlat2 + u_xlat10_1;
					                return;
					            } else {
					                SV_Target0 = u_xlat3;
					                return;
					            //ENDIF
					            }
					        //ENDIF
					        }
					        SV_Target0 = u_xlat10_1;
					        return;
					    //ENDIF
					    }
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "LukaShaderEditorAE9"
}