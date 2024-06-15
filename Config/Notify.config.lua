Notify = {}

Notify.UseChanged = function(type, name)
   local text = ('เปลี่ยนชุดเป็นชุด %s แล้ว!!'):format(name)
   pcall(function()
        exports.nc_notify:PushNotification({
            title = 'ระบบ',
            description = text,
            icon = 'default',
            type = type,
            duration = 4000
        })
   end)
end

Notify.TextUI = function(message)
    pcall(function()
        exports["replayx.textui"]:ShowHelpNotification("กด ~INPUT_CONTEXT~ เพื่อเปิดตู้เสื้อผ้า")
    end)
end