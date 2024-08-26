export class Item
    ( basic, format, id, name, icon ) ->
        @json = basic
        @json.format_version = "1.13.20"
        @json["minecraft:item"].description.identifier = id
        @json["minecraft:item"].components["minecraft:display_name"] ?= value : name
        @json["minecraft:item"].components["minecraft:icon"] ?= icon
        