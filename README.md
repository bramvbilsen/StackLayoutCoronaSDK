# StackLayoutCoronaSDK
Stacklayout for Corona SDK

## Usage
### First: Require the module
`local stackLayoutLib = require("Stacklayout")`
### Second: Create a stacklyout
- `local stackLayout = stackLayoutLib.create(params)`
- params is a table and can include:
  - y (e.g. params = {y=0});
  
### Third: use provided functions
#### Functions include:
- `stackLayout:add(obj, params)`
  - obj is the object to add to the bottom of the stacklayout
  - params is a table and can include:
    - `padding` (e.g. `params = {padding=20}`)
    - `group` (e.g. `params = {group=true}`) !! NOTE THAT THIS IS NECESSARY IF YOU ADD A GROUP. This does not include widgets like buttons !!
- `stackLayout:remove(obj)`
- `stackLayout:refresh()`
- `stackLayout:destroy()`

-------This project is licensed under the terms of the MIT license-------
