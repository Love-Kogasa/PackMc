require! fs
export function read then JSON.parse  fs.readFileSync( it ).toString "utf-8"
export function write( name, data ) then fs.writeFileSync name, JSON.stringify( data )
export function copy( ...jsons )
    ret-v = {}
    for json in jsons
        objdo = ( obj ) ->
            retv = {}
            for key in Object.keys obj
                retv[ key ] ?= obj[ key ]
                retv[ key ] = if typeof key is "object" then objdo key
                  else retv[ key ] with obj[ key ]
            retv
        ret-v = retv with objdo json
    ret-v