require! "./manifest"
require! "./texture"
require! "./item"
require! "./block"
require! "./util"
require! "./json"
require! "fs"
#require! "./json"
export class PackMc
    ( manifest, dir=__dirname ) ->
        @dirtree = []
        @dir = dir
        @dirtree.push [ "#dir/manifest.json", "json", manifest ]
    add : ( fname, data ) ->
        dir = @dir
        if typeof data is "object" and typeof data.toJSON is "undefined"
            @dirtree.push [ "#dir#fname", "json", data ]
        else
            @dirtree.push [ "#dir#fname", "text", data ]
        @
    icon : ( path ) ->
        @add "/pack_icon.png", fs.readFileSync( path )
        @
    adddir : ( dir ) ->
        if not fs.existsSync( "#{@dir}#dir" ) then fs.mkdirSync "#{@dir}#dir"
        @
    pack : ->
        for file in @dirtree
            [ fname, type, data ] = file
            if type is "json"
                json.write fname, data
            else
                fs.writeFileSync fname, data
        @
export manifest.manifest
export item.item
export block.block
export texture.textures
export util