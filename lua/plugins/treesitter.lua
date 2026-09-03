return {
	'nvim-treesitter/nvim-treesitter',
	branch='main',
	version='7caec274fd19c12b55902a5b795100d21531391f',
	build=':TSUpdate',
	opts={
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"diff",
			"html",
			"lua",
			"go",
			"gomod",
			"gosum",
			"json",
			"toml",
			"python",
			"yaml",
			"dockerfile",
			"make",
			"cmake",
		}
	}
}
