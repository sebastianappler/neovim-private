local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, ' ')
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
end

return tree 
