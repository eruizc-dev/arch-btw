function health#flex#check() abort

    if health#flex#file_reachable('neofetch')
        call health#report_ok('Neofetch found')
    else
        call health#report_warn(
        \   'Neofetch could not be found', [
        \       'make sure it is installed and in PATH'
        \])
    endif

endfunction

function health#flex#file_reachable(file)
        if filereadable(expand(a:file))
            return v:true
        else
            return health#flex#exist_in_path(a:file)
        endif
endfunction

function health#flex#exist_in_path(file)
    let path = expand('$PATH')
    let dirs = split(path, ':')

    for dir in dirs
        if filereadable(dir.'/'.a:file)
            return v:true
        endif
    endfor
    return v:false
endfunction
