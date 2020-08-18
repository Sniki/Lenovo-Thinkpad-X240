// _TTS Method (TransitionToState) to fix LED issues like:
// Power Button LED and Red LED blinking after Wake from Sleep
// Save Microphone Mute F4 toggle LED State after Wake from Sleep
// Credits: @junaedahmed (Mic Mute LED) @Sniki (Power LED)

DefinitionBlock ("", "SSDT", 1, "X240", "LED", 0)
{
    External (\_SB.PCI0.LPC.EC.HKEY.MMTS, MethodObj)
    External (\_SB.PCI0.LPC.EC.MICL, IntObj)
    External (\_SI._SST, MethodObj)
    
    Method (_TTS, 1, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            // Arg0 contains the system state of transition
            // for wake state it is Zero.
            If (CondRefOf (\_SB.PCI0.LPC.EC.MICL))
            {
                If (Arg0 == Zero & \_SB.PCI0.LPC.EC.MICL == One)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (0x02)
                }
            }
            
            If (Arg0 == Zero)
            {
                \_SI._SST (One)
            }
        }
    }
}