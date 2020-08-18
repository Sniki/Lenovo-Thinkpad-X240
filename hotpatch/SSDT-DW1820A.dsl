// Generic SSDT to fix various issues with DW1820A Wireless Cards in macOS
// Note: Adjust the Device path according to your ACPI, (_SB.PCI0.EXP2.ARPT) is just an example
// "brcmfx-country" and "brcmfx-driver" are optional, uncomment if you need it

DefinitionBlock ("", "SSDT", 2, "X240", "DW1820A", 0)
{
    External (\_SB.PCI0.EXP2.ARPT, DeviceObj)

    Device (\_SB.PCI0.EXP2.ARPT)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                    0x03                                           
                })
            }
            
            Return (Package ()
            {
                //"brcmfx-country",      // changes the country code
                //Buffer ()
                //{
                    //"#a"               // examples (US, CN, #a, ...)
                //},
                //"brcmfx-driver",       // // brcmfx-driver=0|1|2|3 enables only one kext for loading
                //Buffer ()
                //{
                    //"0x01"             // 0-AirPortBrcmNIC-MFG, 1-AirPortBrcm4360, 2-AirPortBrcmNIC, 3-AirPortBrcm4331
                //},
                "pci-aspm-default",    // Mandatory for most cards (fixes freezes and KPs on DW1820A)
                Buffer (One)
                {
                    0x00               // Disables ASPM for PCIe device
                }
            })
        }
    }
}