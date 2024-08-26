# PackMc
Write Minecraft Pack in JavaScript  
example/index.js:
```js
const { PackMc, manifest } = require( "../index" )
var packInfo = manifest.res( "Example 材质包", "made by packmc" )
var mcpack = new PackMc( packInfo, __dirname + "/respack" )
mcpack.icon( "example/icon.png" )
mcpack.pack()
```
