// Haswell and Broadwell PNLF device for Brightness Control

DefinitionBlock("", "SSDT", 2, "X240", "PNLF", 0)
{
    External (_SB.PCI0.VID, DeviceObj)

    Device (_SB.PCI0.VID.PNLF)
    {
        Name(_ADR, Zero)
        Name(_HID, EisaId ("APP0002"))
        Name(_CID, "backlight")
        //Haswell/Broadwell
        Name(_UID, 15)
        Method (_STA, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0B)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}
