return {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  root_markers = { "package.json", ".git" },
  single_file_support = true,
  settings = {
    Svelte = {
      compilerOptions = {
        -- Optional: customize svelte compilation
      },
    },
  },
}