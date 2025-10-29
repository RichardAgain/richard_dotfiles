return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local function lsp_attached_names()
      local bufnr = vim.api.nvim_get_current_buf()
      local get = vim.lsp.get_clients
      local clients = get({ bufnr = bufnr })
      if not clients or #clients == 0 then
        return ""
      end
      local names, seen = {}, {}
      local ignore = { ["null-ls"] = true, ["none-ls"] = true, ["copilot"] = true }
      for _, c in ipairs(clients) do
        if c.name and not ignore[c.name] and not seen[c.name] then
          names[#names + 1] = c.name
          seen[c.name] = true
        end
      end
      return (#names > 0) and (" " .. table.concat(names, ", ")) or ""
    end

    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}
    table.insert(opts.sections.lualine_x, 2, lsp_attached_names) -- position it early in lualine_x
  end,
}
