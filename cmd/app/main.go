package main

import (
	gotenbergcmd "github.com/gotenberg/gotenberg/v7/cmd"

	// Gotenberg modules. You may also cherry-pick the standard modules.
	_ "github.com/gotenberg/gotenberg/v7/pkg/standard"
	// Custom modules.
	_ "github.com/Vrex123/gotenberg-ghostscript/pkg/modules/ghostscript"

)

func main() {
	gotenbergcmd.Run()
}
