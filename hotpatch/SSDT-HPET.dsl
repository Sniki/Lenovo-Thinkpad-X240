// Patched HPET with IRQNoFlags for Lenovo ThinkPad T440S/T440/X240

DefinitionBlock ("", "SSDT", 2, "X240", "HPET", 0)
{
    External (\_SB.PCI0.LPC, DeviceObj)
    
    Scope (\_SB.PCI0.LPC)
    {
        Device (HPE0)
        {
            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (BUF0, ResourceTemplate ()
            {
                IRQNoFlags ()
                    {0}
                IRQNoFlags ()
                    {8}
                Memory32Fixed (ReadWrite,
                    0xFED00000,         // Address Base
                    0x00000400,         // Address Length
                    _Y24)
            })

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}