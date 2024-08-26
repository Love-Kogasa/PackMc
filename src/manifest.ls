require! "./uuid"
require! "./json"
export function manifest-json then json.read it
export function manifest( info )
    table =
        format : 2
        name : "pack.name"
        description : "pack.description"
        type : "data"
        version : [ 0, 0, 1 ]
        min_version : [ 1, 13, 20 ]
    table = table with info
    do
        format_version : table.format
        header :
            name : table.name
            description : table.description
            uuid : uuid!
            version : table.version
            min_engine_version : table.min_version
        modules : new Array do
            do
                type : table.type
                uuid : uuid!
                version : table.version
manifest.type = ( type, name, description, version=[ 0, 0, 1 ], min_version=[ 1, 13, 20 ] )->
    @ do
        do
            format = if min_version.1 > 12 then 2 else 1
            name : name
            description : description
            version : version
            min_version : min_version
            type : type
manifest.res = (  name, description, version, min_version ) -> @type "resources", name, description, version, min_version
manifest.beh = (  name, description, version, min_version ) -> @type "data", name, description, version, min_version