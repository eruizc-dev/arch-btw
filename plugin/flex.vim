command! Flex call flex#flex()

function! flex#flex()
    let height = 20
    let width = 75
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)
    let opts = {
    \   'relative': 'editor',
    \   'row': row,
    \   'col': col,
    \   'width': width,
    \   'height': height,
    \   'style': 'minimal'
    \ }
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(buf, v:true, opts)
    call termopen('(neofetch | grep .) && read')
    startinsert
    autocmd TermClose * ++once :q
endfunction
