return {
  'j-hui/fidget.nvim',
  opts = {
    notification = {
      -- i think there is some issue with this check back later after issues are
      -- fixed by fidget.nvim
      configs = {
        default = {
          name = 'notify',
          icon = '  ',
          icon_on_left = true,
        },
      },
    },
  },
}
