export class Item
    ( basic, id, name, icon ) ->
        @json = basic
        @json["minecraft:item"].description.identifier = id
        @json["minecraft:item"].components["minecraft:display_name"] = value : name
        @json["minecraft:item"].components["minecraft:icon"] = texture : icon
        @icon = icon
        @name = name
    texture : ( path ) ->
        textures : path
    description : ( pos, data ) ->
        @json["minecraft:item"].description[ pos ] = data
        @
    setData : ( pos, data ) ->
        @json["minecraft:item"].components[ pos ] = data
        @
    item : ->
        @json
    getJson : ->
        @json
    on : ( event, cb ) ->
        @json["minecraft:item"].events ?= {}
        cb ->
            @json["minecraft:item"].events[ event ] = {}
            @json["minecraft:item"].events[ event ].run_command = command : if Array.isArray it then it else [ it ]
    create : ( id, name, icon ) ->
        new Item( @json, id, name, icon )
export item = new Item do
    do
        format_version : "1.17.100"
        "minecraft:item" :
            description : {}
            components : {}
    "item.id"
    "item.name"
    "item.icon"