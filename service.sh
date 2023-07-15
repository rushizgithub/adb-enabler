#!/system/bin/sh

# sleep 33 secs needed for "settings" commands to become effective
# and make the adaptive battery manager, adaptive connectivity and wifi suspend optimizations to be off

function waitBootCompletion()
{
    # wait for system boot completion
    local i
    for i in `seq 1 30` ; do
        if [ "`getprop sys.boot_completed`" = "1" ]; then
            break
        fi
        sleep 1.07
    done
}

function enableadb()
{
    settings put global adb_enabled 1
    settings put secure adb_wifi_enabled 1
    settings put secure adb_allowed_connection_time 1
    settings put global usb_mass_storage_enabled 1
}

(((sleep 33; waitBootCompletion; enableadb)  0<&- &>"/dev/null" &) &)
