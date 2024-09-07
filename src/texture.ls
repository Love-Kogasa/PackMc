export class Textures
    ( respname ) ->
        @json = {}
        @json.resource_pack_name ?= respname
        @json.texture_data = {}
    set : ( item, path ) ->
        @json.texture_data[ item.icon ] = item.texture( path )
        @
    setJson : ( item, json ) ->
        @json.texture_data[ item.icon ] = json
        @
    get : ( item ) ->
        @json.texture_data[ item.icon ]
    textures : ->
        @json
export function textures
    new Textures it