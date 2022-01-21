This repository provides Ghostscript module for awesome Gotenberg

With power of Ghostscript Gotenberg can convert PDFs to PDF/A-1b, PDF/A-2b, PDF/A-3b without messing up fonts, as unoconv sometimes can when convering to PDF/A-1a.

Support for merging PDFs with Ghostscript added too.

Documentation and examples are available in [original Gotenberg repo](https://github.com/gotenberg/gotenberg)

## Quick Start

Open a terminal and run the following command:

```
docker run --rm -p 3000:3000 vrex141/gotenberg:7.4.2-ghostscript-v1.0.0
```
## Versions
- [Gotenberg](https://github.com/gotenberg/gotenberg): 7.4.2
- [Ghostscript](https://www.ghostscript.com/): 9.55.0

## Credits
Thanks to [@gulien](https://github.com/gulien) for awesome [Gotenberg](https://github.com/gotenberg/gotenberg) 

[Ghostscript](https://www.ghostscript.com/) is owned by [Artifex Software, Inc](https://artifex.com/)

Ghostscript is distributed for open source projects under AGPL([more](https://www.ghostscript.com/licensing/index.html#open-source)). 

This repository is using compiled binary from Ghostscript website.
Ghostscript binary located inside Docker container and download occurs during build. Gotenberb module interacts with it using CLI.

Gotenberg can be built and started without ghostscript module. 

Consider contacting [Artifex](https://artifex.com/), if you want to use it your own project.
