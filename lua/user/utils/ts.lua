local utils = require("doom.utils")
local tsq = require("vim.treesitter.query")
local api = vim.api
local cmd = api.nvim_command

local user_ts_utils = {}

-- create helper functions that can be nice and useful.
-- ALSO ANNOTATE IF THE FUNCTION ALREADY EXISTS IN A PLUGIN
-- such as nvim-treesitter.ts_utils.
--

-- ts.remove_unused_locals(bufnr)

-- ts.get_parsed_query()
-- ts.return_captures_from_parsed_query(qp, { list of capture names you want to return })
-- ts.prepend_line_of_node_with(node,"-- ",offset)
-- ts.append_line_of_node_with(node,"-- ",offset)
-- ts.insert_text_before_node(node,"-- ", offset)
-- ts.insert_text_after_node(node,"-- ", offset)
-- ts.surround_node_with_text(node,"-- ", offset)

user_ts_utils.get_query = function(query_str, bufnr)
  if bufnr == nil then
    bufnr = api.nvim_get_current_buf()
  end
  local language_tree = vim.treesitter.get_parser(bufnr)
  local syntax_tree = language_tree:parse()
  local root = syntax_tree[1]:root()
  local q = vim.treesitter.parse_query("lua", query_str)
  return bufnr, root, q
end

user_ts_utils.get_captures = function(root, bufnr, q, capture_name)
  local capture_name_matches = {}
  if q ~= nil then
    for id, node, metadata in q:iter_captures(root, bufnr, root:start(), root:end_()) do
      local name = q.captures[id] -- name of the capture in the query

      -- refactor into function get_capture from query
      if name == capture_name then
        table.insert(capture_name_matches, node)
      end
    end
  end
  return capture_name_matches
end

user_ts_utils.ts_single_node_prepend_text = function(node, bufnr, prepend_text)
  local type = node:type() -- type of the captured node
  local nt = tsq.get_node_text(node, bufnr)
  local sr, sc, er, ec = node:range()
  print(string.format("type: %s, text: %s, [%s %s, %s %s]", type, nt, sr + 1, sc, er + 1, ec))
  api.nvim_buf_set_text(bufnr, sr, sc, sr, sc, { prepend_text })
end

user_ts_utils.ts_single_node_append_text = function(node, bufnr, prepend_text)
  local type = node:type() -- type of the captured node
  local nt = tsq.get_node_text(node, bufnr)
  local sr, sc, er, ec = node:range()
  print(string.format("type: %s, text: %s, [%s %s, %s %s]", type, nt, sr + 1, sc, er + 1, ec))
  api.nvim_buf_set_text(bufnr, er, ec, er, ec, { prepend_text })
end


-- @param table
-- loop and apply
user_ts_utils.ts_nodes_prepend_text = function(nodes, bufnr, prepend_text)
  for i, v in ipairs(nodes) do
    user_ts_utils.ts_single_node_prepend_text(v, bufnr, prepend_text)
  end
end

user_ts_utils.ts_nodes_append_text = function(nodes, bufnr, prepend_text)
  for i, v in ipairs(nodes) do
    user_ts_utils.ts_single_node_append_text(v, bufnr, prepend_text)
  end
end
-- user_ts_utils.ts_node_append_text = function(node) end
-- user_ts_utils.ts_node_surround_text = function(node) end

return user_ts_utils
