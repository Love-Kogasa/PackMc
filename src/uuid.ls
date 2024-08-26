module.exports = uuid = ->
    retc = ""
    for char in "66c6e9a8-3093-462a-9c36-dbb052165822"
        retc += if char isnt "-" then Math.floor( Math.random! * 16 ).toString 16
            else "-"
    retc