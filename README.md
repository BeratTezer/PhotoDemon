## Download

| Stable (8.4) | Nightly (9.0-a) | Source code |
| :----------: | :-------------: | :---------: |
| [Download (.zip, 13 MB)](https://github.com/tannerhelland/PhotoDemon/releases/download/v8.4/PhotoDemon-8.4.zip) | [Download (.zip, 13 MB)](https://github.com/tannerhelland/PhotoDemon/releases/download/PhotoDemon-nightly/PhotoDemon-nightly.zip) | [Download (.zip, 17 MB)](https://github.com/tannerhelland/PhotoDemon/archive/master.zip) |

## About PhotoDemon 8.4

**PhotoDemon** is a portable photo editor.  It is 100% free and [100% open-source](https://github.com/tannerhelland/PhotoDemon/blob/master/README.md#licensing).  

1. [Overview](#overview)
2. [What makes PhotoDemon unique?](#what-makes-photodemon-unique)
3. [What's new in nightly builds](#whats-new-in-nightly-builds)
4. [Contributing](#contributing)
5. [Licensing](#licensing)

## Overview

![Screenshot](https://photodemon.org/media/PD_screenshot_master.jpg)

PhotoDemon provides a comprehensive photo editor in a 13 MB download.  It runs on any Windows PC (XP through Win 10) and it *does not* require installation.  It runs just fine from a USB stick, SD card, or portable drive.

PhotoDemon is open-source and available under a permissive [BSD license](#licensing).  Contributors have translated the program into more than a dozen languages.

You can support PhotoDemon's ongoing development [through Patreon](https://www.patreon.com/photodemon) or [with a one-time donation](https://photodemon.org/donate/).

New contributions from coders, designers, translators, and enthusiasts are always welcome.

* For information on the latest stable release, visit https://photodemon.org
* To download the program's source code, visit https://github.com/tannerhelland/PhotoDemon
* To download a nightly build of the latest source code, visit https://photodemon.org/download/

## What makes PhotoDemon unique?

### Lightweight and completely portable
No installer is provided or required.  Aside from a temporary folder – which you can specify from the Tools > Options menu – PhotoDemon leaves no trace on your hard drive.  Many users run PhotoDemon from a USB stick or portable drive.

### Integrated macro recording and batch processing
Complex editing actions can be recorded as macros (similar to Office software).  A built-in batch processor lets you apply macros to entire folders of images.

### Usability is paramount
Many open-source photo editors are usability nightmares.  PhotoDemon tries not to be.  Small touches like real-time effect previews, save/load presets on all tools, unlimited Undo/Redo, "Fade last action", keyboard accelerators, mouse wheel and X-button support, and descriptive icons make it fast and easy to use.

### Pro-grade features and tools
* Extensive file format support, including Adobe Photoshop (PSD) images and all major camera RAW formats
* Color-managed workflow, including full support for embedded ICC profiles
* Advanced multi-layer support, including editable text layers and non-destructive layer modifications 
* On-canvas tools: digital paintbrushes, clone and pattern brushes, interactive gradients, and more
* Adjustment tools: levels, curves, HDR, shadow/highlight recovery, white balance, Wratten filters, and many more
* Filters and effects: perspective correction, edge detection, noise removal, real-time content-aware blur, unsharp masking, green screen, lens diffraction, vignetting, and many more
* More than 200 tools are provided in the current build.

### Limitations

* PhotoDemon isn't designed for operating systems other than Microsoft Windows.  A compatibility layer like [Wine](http://www.winehq.org/) may allow it to work on OSX, Linux, or BSD systems, but program stability and performance may suffer.

## What's new in nightly builds

![Azure DevOps builds](https://img.shields.io/azure-devops/build/tannerhelland/d01b37a6-6b5c-4fc6-a143-fe82901da8dc/1?style=flat-square) ![GitHub last commit](https://img.shields.io/github/last-commit/tannerhelland/PhotoDemon?style=flat-square)  ![GitHub commits since latest release](https://img.shields.io/github/commits-since/tannerhelland/PhotoDemon/latest?style=flat-square&color=light-green)

[Current nightly builds](https://photodemon.org/download/) offer the following improvements over the [last stable release](https://photodemon.org/2020/09/22/photodemon-8-4.html).

### File formats

- Comprehensive import and export support for [Corel Paintshop Pro (psp, pspimage) images](https://en.wikipedia.org/wiki/PaintShop_Pro), including many text and vector layer features.
- Comprehensive import and export support for [animated WebP images](https://developers.google.com/speed/webp), including direct export to animated WebP from PhotoDemon's built-in screen recorder tool (`Tools > Animated screen capture`)
- Comprehensive import and export support for the brand-new [AVIF file format](https://en.wikipedia.org/wiki/AV1#AV1_Image_File_Format_(AVIF)), c/o the [open-source libavif library](https://github.com/AOMediaCodec/libavif).  AVIF file support is incredibly complex (the stock encoder+decoder apps are almost 3x larger than PhotoDemon!) and they are only available for 64-bit systems, so PhotoDemon does not ship these libraries by default.  If you attempt to open or save an AVIF file, PhotoDemon will offer to download a local copy of libavif for you.  (This is done in a fully portable manner, and simply involves downloading the latest avifenc.exe and avifdec.exe files from GitHub, which PhotoDemon will do for you if you allow it.)  
- Comprehensive import support for [lossless JPEG (JPEG-LS) images](https://en.wikipedia.org/wiki/Lossless_JPEG), c/o the [open-source CharLS library](https://github.com/team-charls/charls)
- Comprehensive import support for [Comic Book Archive (CBZ) images](https://en.wikipedia.org/wiki/Comic_book_archive).
- Comprehensive import support for [Symbian (mbm, aif) images](https://en.wikipedia.org/wiki/MBM_(file_format))
- New [neural-network color quantizer](https://github.com/tannerhelland/PhotoDemon/commit/fc27cfc6a5ce7ab42a7d929e80e220281c818bb6) for maximum-quality results when saving to 256-color image formats, like GIF or web-optimized PNGs.  (The new quantizer is also directly accessible from the `Effects > Stylize > Palettize` tool.)

### Effects

- New support for [Photoshop effect plugins](https://en.wikipedia.org/wiki/Photoshop_plugin) ("8bf", 32-bit only), with thanks to [spetric's Photoshop-Plugin-Host library](https://github.com/spetric/Photoshop-Plugin-Host).
- New [Effects > Distort > Droste](https://github.com/tannerhelland/PhotoDemon/pull/364) tool, so you can channel your inner [M.C. Escher](https://en.wikipedia.org/wiki/Print_Gallery_(M._C._Escher))
- New [Effects > Render > Truchet Tiles tool](https://github.com/tannerhelland/PhotoDemon/pull/358)
- New `Effects > Animation menu`, including new [Foreground and Background effects](https://github.com/tannerhelland/PhotoDemon/commit/06a4f1df3a5231eb0cac17dd7f426a049e44f7e7) (for automatically applying a background or foreground to an animated image)
- New [Effects > Edge > Gradient flow](https://github.com/tannerhelland/PhotoDemon/commit/f7e28487c087f1483dac435290ab3c30f7c18ac0) tool
- Greatly improved and accelerated [Effects > Artistic > Stained Glass](https://github.com/tannerhelland/PhotoDemon/commit/02f60a5c6807cec763fcfb7628332b9b6de897f2) and [Effects > Pixelate > Crystallize](https://github.com/tannerhelland/PhotoDemon/commit/ac2772d145a30b5e1a4bccd334c642062f63708c) tools

### Adjustments

- New [Adjustments > Color > Color lookup](https://github.com/tannerhelland/PhotoDemon/commit/5739253c850fbeb86af85f2ba4020da0ce1262d7) tool, with built-in support for [all 3D LUT formats that ship with Photoshop](https://helpx.adobe.com/photoshop/how-to/edit-photo-color-lookup-adjustment.html) (cube, look, 3dl) and [high-performance tetrahedral interpolation](https://www.nvidia.com/content/GTC/posters/2010/V01-Real-Time-Color-Space-Conversion-for-High-Resolution-Video.pdf) for best-in-class quality  
- New [Adjustments > Lighting > Dehaze tool](https://github.com/tannerhelland/PhotoDemon/commit/dde19d0c6e45b41f9c0d88d6d7c62a4651595836)
- Overhauled [Adjustments > Curves tool](https://github.com/tannerhelland/PhotoDemon/commit/989f861d8cf4b32e5a49c10cc87c094cc7f38b33), with improved performance and a new UI
- Completely redesigned [Adjustments > Color > Photo filter](https://github.com/tannerhelland/PhotoDemon/commit/f142633977c1eed9f627f6ab6ab84053960914a1) tool, to better match the identical tool in Photoshop 
- [Otsu's method](https://en.wikipedia.org/wiki/Otsu%27s_method) is now used by [the `Adjustments > Monochrome` tool](https://github.com/tannerhelland/PhotoDemon/commit/4286395b520ec84b4c047eb37092a91532e7d500), for improved contrast when reducing an image to two colors.

### Image and Layer tools

- Completely redesigned [Image > Resize tool](https://github.com/tannerhelland/PhotoDemon/pull/361), with real-time interactive previews, 12 different resampling filters, memory size estimations, a user-resizable dialog, progress bar updates, and more.  The new tool was custom-built for PhotoDemon, and it has very low memory requirements, excellent performance, and zero 3rd-party dependencies.  (The `Layer > Resize` tool also receives all of these new features!)
- New [Layer > Replace tools](https://github.com/tannerhelland/PhotoDemon/commit/24f50821c1fd665494d72fd4e4e75fc29e8c3a0e), for quickly replacing an existing layer with data from the clipboard or any arbitrary image file.
- Overhauled [`Image > Crop` tool](https://github.com/tannerhelland/PhotoDemon/commit/6bfe841f282ae9ec9d75b4cd29065eee11c7e9f2), including new support for retaining editable text layers after cropping (instead of rasterizing them).
- New [lock aspect ratio](https://github.com/tannerhelland/PhotoDemon/commit/3b74576eb425c5ff80a4b05615f94a86faabf261) toggle on the Move/Size tool

### User interface 

- Adjustment and Effect dialogs are no longer fixed-size - [you can resize every last one of them at run-time](https://github.com/tannerhelland/PhotoDemon/commit/ab5363a885aec5529a81c28255defe77a516b285)!
- Adjustment and Effect tools now have [built-in Undo/Redo on each dialog](https://github.com/tannerhelland/PhotoDemon/commit/9d7adda0ab158f00d2f0ac393bc19ef800b31b30)
- [Faster app startup time](https://github.com/tannerhelland/PhotoDemon/commit/a56af482d262f6dab1ff016f111a0e909d9bfb98), particularly on Windows 10
- [Improved clipboard support](https://github.com/tannerhelland/PhotoDemon/commit/84f84be77b7a1f52cb1151eeef8e5df1bbec5fad) when copy/pasting to/from Google Chrome
- New [run-time resource minimizer](https://github.com/tannerhelland/PhotoDemon/commit/f00f0a81bf9f8fbff0a2c125b774884111de82e3) makes PhotoDemon - already among the lightest photo editors - even lighter on system resources.
- PhotoDemon's `Window` menu now displays a [list of open images](https://github.com/tannerhelland/PhotoDemon/commit/009721ddc60246c803ee32ffe4c4376937a09bb4) for immediate access to any open image (even if you've disabled the image tabstrip).
- [Expanded "convenience" buttons in the Layer Toolbox](https://github.com/tannerhelland/PhotoDemon/commit/a421afaaddfee746e1769768503f300cf4849616), including new Shift+Click behavior (see button tooltips)
- [Additional hotkeys have been implemented](https://github.com/tannerhelland/PhotoDemon/commit/08b2ad83e2e1fc89e2aa69f219a1da9d036098ce) to better match other photo editing software

### Other

For a full list of recent changes, [check the project's commit log](https://github.com/tannerhelland/PhotoDemon/commits/master).

## Contributing

Ongoing PhotoDemon development is made possible by donations from users like you!

My [Patreon campaign](https://www.patreon.com/photodemon) is one way to donate. Donating through Patreon comes with extra benefits, like in-depth updates on new PhotoDemon features. To learn more, visit [PhotoDemon’s Patreon page](https://www.patreon.com/photodemon).

I am also extremely grateful for one-time donations.  A secure donation page is available at [photodemon.org/donate](https://photodemon.org/donate/).  **Thank you!**

If you can contribute in other ways (language translations, bug reports, pull requests, etc), please [create a new issue at GitHub](https://github.com/tannerhelland/PhotoDemon/issues).  A full list of (wonderful!) contributors is available in [AUTHORS.md](https://github.com/tannerhelland/PhotoDemon/blob/master/AUTHORS.md).

## Licensing

PhotoDemon is BSD-licensed.  This allows you to use its source code in any application, commercial or otherwise, if you supply proper attribution.  Proper attribution includes a **notice of copyright** and **disclaimer of warranty**.

PhotoDemon uses some 3rd-party open-source libraries.  These libraries are found in the /App/PhotoDemon/Plugins folder.  These libraries have their own licenses, separate from PhotoDemon.

Full licensing details are available in [LICENSE.md](https://github.com/tannerhelland/PhotoDemon/blob/master/LICENSE.md).
