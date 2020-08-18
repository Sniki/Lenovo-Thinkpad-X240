// Adapter Power Resources for Wake

DefinitionBlock ("", "SSDT", 2, "X240", "ADPT", 0)
{
    External (\_SB.PCI0.LPC.EC.AC, DeviceObj)

    Scope (\_SB.PCI0.LPC.EC.AC)
    {
        If (_OSI ("Darwin"))
        {
            Name (_PRW, Package() { 0x18, 0x03 })
        }
    }
}
