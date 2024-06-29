-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Modify this with whatever input dialog system you want

---@param heading string
---@param rows string[] | table
---@return table | nil
function WSB.inputDialog(heading, rows, color)
    -- heading = input title
    -- rows = rows of inputs/data
    --
    -- example row usage simple:
    -- { 'First Name', 'Last Name', 'Age' }
    --
    -- example row usage with options:
    -- {
    --     type = 'input', -- Example of type input
    --     label = 'SIMPLE INPUT EXAMPLE', -- Label of input
    --     placeholder = 'PLACE HOLDER EXAMPLE' -- Placeholder of input (optional)
    -- },
    -- {
    --    type = 'select', -- Example of type select
    --    label = 'SELECT EXAMPLE LABEL, -- Label of select
    --    options = { -- Options of select
    --        { value = 'value_that_sends', label = 'Label of drop option 1' }, -- Value and label of drop option 1
    --        { value = 'value_that_sends2',  label = 'Label of drop option 2' } -- Value and label of drop option 2
    --
    --   }
    -- },
    -- {
    --    type = 'checkbox', -- Example of type checkbox
    --    label = 'NUMBER CHECKBOX LABEL, -- Label of checkbox
    --    checked = false -- Checked or not checked by default
    -- },
    -- {
    --    type = 'slider', -- Example of type slider
    --    label = 'SLIDER EXAMPLE LABEL, -- Label of slider
    --    default = 2, -- Default value of slider
    --    min = 1, -- Min value of slider
    --    max = 10, -- Max value of slider
    -- },
    --
    -- (Basically follow the same as ox_lib menu system and transfer the options to your own input system)]

    -- Remove under this to use your own input dialog OR the ox_lib input dialog --
    Wait(300)
    SendNUIMessage({
        component = "inputDialog",
        label = heading,
        data = rows,
        color = color or false
    })
    SetNuiFocus(true, true)

    local result = nil
    CreateThread(function()
        while result == nil do
            Wait(5)
            if InputDialogCallback then
                result = InputDialogCallback
                InputDialogCallback = nil
            end
        end
    end)

    while result == nil do
        Wait(0)
    end

    if result and result ~= 'nil' then
        result = NormalizeTable(result)
        for i=1, #result do
            if result[i] == '' then
                result[i] = false
            end
        end
        InputDialogCallback = nil
        return result
    else
        return nil
    end

    -- Remove above this to use your own input dialog or ox_lib

    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.inputDialog or use default!^0')
        return
    end
    return exports.ox_lib:inputDialog(heading, rows)
end
