// Lenovo ThinkPad T440S Keyboard Map.
// Lenovo ThinkPad T440S ClickPad Configuration.

DefinitionBlock("", "SSDT", 2, "X240", "KBD", 0)
{
    External (\_SB.PCI0.LPC.EC, DeviceObj)
    External (\_SB.PCI0.LPC.KBD, DeviceObj)
    External (\_SB.PCI0.LPC.EC.XQ14, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ15, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ6A, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ16, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ64, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ66, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ67, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ68, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ69, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ1F, MethodObj)
    External (\_SB.PCI0.LPC.EC.XQ74, MethodObj)
    External (\_SB.PCI0.LPC.EC.HKEY.MMTS, MethodObj)
    External (\_SB.PCI0.LPC.EC.HKEY.MLCS, MethodObj)
    External (\_SB.PCI0.LPC.EC.HKEY.MHKQ, MethodObj)
    
    Scope (\_SB.PCI0.LPC.EC)
    {
        Name (MICL, Zero)
        Name (KEYL, Zero)
        Name (FUNL, Zero)
        
        Method(_Q6A, 0, NotSerialized) // (F4) Microphone Mute Toggle
        {
            If (!_OSI("Darwin")) 
            {
                XQ6A()
                Return()    
            }
            
            MICL = (MICL + 1) % 2
            
            Switch (MICL)
            {
                Case (One) 
                {
                    // Right Shift + F20
                    Notify (\_SB.PCI0.LPC.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036B)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01b6)
                    
                    // Enable LED
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (0x02)
                }
                Case (Zero) 
                {
                    // Left Shift + F20
                    Notify (\_SB.PCI0.LPC.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036B)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01aa)
                    
                    // Disable LED
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (Zero)
                }
            }
        }
        Method (_Q15, 0, NotSerialized)  // (F6) Brightness Down
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0405)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ15 ()
            }
        }
        Method (_Q14, 0, NotSerialized)  // (F5) Brightness Up
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0406)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ14 ()
            }
        }
        Method (_Q16, 0, NotSerialized)  // (F7) Projector
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0367)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ16 ()
            }
        }
        Method (_Q64, 0, NotSerialized)  // (F8) Wireless On/Off
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0368)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ64 ()
            }
        }
        Method (_Q66, 0, NotSerialized)  // (F9) Settings
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0369)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ66 ()
            }
        }
        Method (_Q67, 0, NotSerialized)  // (F10) Search
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x0138)
                Notify (\_SB.PCI0.LPC.KBD, 0x0339)
                Notify (\_SB.PCI0.LPC.KBD, 0x01b8)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ67 ()
            }
        }
        Method (_Q68, 0, NotSerialized)  // (F11) App Switcher
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x011d)
                Notify (\_SB.PCI0.LPC.KBD, 0x0448)
                Notify (\_SB.PCI0.LPC.KBD, 0x019d)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ68 ()
            }
        }
        Method (_Q69, 0, NotSerialized)  // (F12) Start Menu
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x036a)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ69 ()
            }
        }
        Method (_Q1F, 0, NotSerialized) // (Fn+Spacebar) Keyboard Backlight
        {
            If (!_OSI("Darwin")) 
            {
                XQ1F()
                Return()    
            }
            
            KEYL = (KEYL + 1) % 3
            
            Switch (KEYL)
          	{
                Case (Zero)
                {
                    // Left Shift + F16.
                    Notify (\_SB.PCI0.LPC.KBD, 0x012a)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01aa)
                    
                    // bright to off
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (Zero)
                }
                Case (One)
                {
                    // Right Shift + F16.
                    Notify (\_SB.PCI0.LPC.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01b6)
                    
                    //  Off to dim
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (One)
                }
                Case (0x02)
                {
                    // Left Shift + F19.
                    Notify (\_SB.PCI0.LPC.KBD, 0x012a)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036a)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01aa)
                    
                    //  dim to bright
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (0x02)
                }
            }
        }
        Method (_Q74, 0, NotSerialized) // FnLock (Fn + Esc)
        {
            If (!_OSI("Darwin")) 
            {
                XQ74()
                Return()
            }

            FUNL = (FUNL + 1) % 2
            Switch (FUNL)
            {
                Case (One) 
                {
                    // Right Shift + F18
                    Notify (\_SB.PCI0.LPC.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0369)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01aa)

                    // Enable LED
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x02)
                }
                Case (Zero)
                {
                    // Left Shift + F18
                    Notify (\_SB.PCI0.LPC.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0369)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01b6)

                    // Disable LED
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (Zero)
                }
            }
        }
    }
    
    Scope (_SB.PCI0.LPC.KBD)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_Clickpad",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 800,
                "BogusDeltaThreshY", 800,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                //"ForcePassThrough", ">y",
                //"SkipPassThrough", ">y",
                "PalmNoAction When Typing", ">y",
                "ScrollResolution", 800,
                "SmoothInput", ">y",
                "UnsmoothInput", ">y",
                "Thinkpad", ">y",
                "EdgeBottom", 0,
                "FingerZ", 30,
                "MaxTapTime", 100000000,
                "MouseMultiplierX", 2,
                "MouseMultiplierY", 2,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                //"TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                //"TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            },
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package() { },
                    "e037=64", // PrtSc=F13
                },
            },
        })
    }
}
