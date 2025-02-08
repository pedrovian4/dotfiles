((text) @injection.content
 (#lua-match? @injection.content "^%s*@php")
 (#offset! @injection.content 0 5 0 0)
 (#set! injection.language "php"))

((text) @injection.content
 (#lua-match? @injection.content "^%s*@endphp")
 (#offset! @injection.content 0 0 0 -8)
 (#set! injection.language "php"))
