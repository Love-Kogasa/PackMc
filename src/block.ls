export class Block
    ( basic, id, name, icon ) ->
        @json = basic
        @json["minecraft:block"].description.identifier = id
        @json["minecraft:block"].components["minecraft:display_name"] = name
        @json["minecraft:block"].components["minecraft:material_instances"] = if typeof icon is "string"
            "*" :
                texture : icon
                render_method : "blend"
        else icon
        @icon = icon
        @name = name
    texture : ( path ) ->
        textures : path
    description : ( pos, data ) ->
        @json["minecraft:block"].description[ pos ] = data
        @
    setData : ( pos, data ) ->
        @json["minecraft:block"].components[ pos ] = data
        @
    block : ->
        @json
    getJson : ->
        @json
    on : ( event, cb ) ->
        @json["minecraft:block"].events ?= {}
        cb ->
            @json["minecraft:block"].events[ event ] = {}
            @json["minecraft:block"].events[ event ].run_command = command : if Array.isArray it then it else [ it ]
    create : ( id, name, icon ) ->
        new Block( @json, id, name, icon )
export block = new Block do
    do
        format_version : "1.17.100"
        "minecraft:block" :
            description : {}
            components : {}
    "block.id"
    "block.name"
    "block.icon"