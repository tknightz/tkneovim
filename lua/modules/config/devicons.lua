require "nvim-web-devicons".setup {
  override = {
    html = {
      icon = "",
      color = "#DE8C92",
      name = "html"
    },
    css = {
      icon = "",
      color = "#61afef",
      name = "css"
    },
    js = {
      icon = "",
      color = "#EBCB8B",
      name = "js"
    },
    ts = {
      icon = "",
      color = "#519ABA",
      name = "ts"
    },
    kt = {
      icon = "󱈙",
      color = "#ffcb91",
      name = "kt"
    },
    png = {
      icon = "",
      color = "#BD77DC",
      name = "png"
    },
    jpg = {
      icon = "",
      color = "#BD77DC",
      name = "jpg"
    },
    jpeg = {
      icon = "",
      color = "#BD77DC",
      name = "jpeg"
    },
    mp3 = {
      icon = "",
      color = "#C8CCD4",
      name = "mp3"
    },
    mp4 = {
      icon = "",
      color = "#C8CCD4",
      name = "mp4"
    },
    out = {
      icon = "",
      color = "#C8CCD4",
      name = "out"
    },
    rb = {
      icon = "",
      color = "#ff75a0",
      name = "rb"
    },
    vue = {
      icon = "﵂",
      color = "#7eca9c",
      name = "vue"
    },
    py = {
      icon = "",
      color = "#a7c5eb",
      name = "py"
    },
    toml = {
      icon = "",
      color = "#61afef",
      name = "toml"
    },
    lock = {
      icon = "",
      color = "#DE6B74",
      name = "lock"
    },
    zip = {
      icon = "",
      color = "#EBCB8B",
      name = "zip"
    },
    xz = {
      icon = "",
      color = "#EBCB8B",
      name = "xz"
    },
    org = {
      icon = "",
      color = "#EBCB8B",
      name = "org"
    },
    default_icon = {
      icon = "",
      color = "#6d8086",
      name = "Default",
    }
  },

  override_by_filename = {
    ["Dockerfile.dev"] = {
      icon = " ",
      color = "#b8b5ff",
      name = "Dockerfile"
    },
    ["Dockerfile.proc"] = {
      icon = "",
      color = "#b8b5ff",
      name = "Dockerfile"
    },
    Dockerfile = {
      icon = "",
      color = "#b8b5ff",
      name = "Dockerfile"
    },
    dockerfile = {
      icon = "",
      color = "#b8b5ff",
      name = "Dockerfile"
    },
  },

  default = true
}
