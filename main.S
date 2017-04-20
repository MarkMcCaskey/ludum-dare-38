SECTION "rom", ROM0

        ;; $0000 - $003F: RST handlers
        ret
        REPT 7
            nop
        ENDR
        ;; $0008
        ret
        REPT 7
            nop
        ENDR
        ;; $0010
        ret
        REPT 7
            nop
        ENDR
        ;; $0018
        ret
        REPT 7
            nop
        ENDR
        ;; $0020
        ret
        REPT 7
            nop
        ENDR
        ;; $0028
        ret
        REPT 7
            nop
        ENDR
        ;; $0030
        ret
        REPT 7
            nop
        ENDR
        ;; $0038
        ret
        REPT 7
            nop
        ENDR

;;; hardware interrupts

        ;; $0040 - $0067
        jp draw
        REPT 5
            nop
        ENDR

        ;; $0048
        jp stat
        REPT 5
            nop
        ENDR

        ;; $0050
        jp timer
        REPT 5
            nop
        ENDR

        ;; $0058
        jp serial
        REPT 5
            nop
        ENDR

        ;; $0060
        jp joypad
        REPT 5
            nop
        ENDR

;;; $0068-$00FF: free space
        DS $98
        

;;; $0100 - $0103: startup handler
        nop
        jp main

        ;; $0104-$0133 nintendo logo
        DB $CE, $ED, $66, $66, $CC, $0D, $00, $0B
        DB $03, $73, $00, $83, $00, $0C, $00, $0D
        DB $00, $08, $11, $1F, $88, $89, $00, $0E
        DB $DC, $CC, $6E, $E6, $DD, $DD, $D9, $99
        DB $BB, $BB, $67, $63, $6E, $0E, $EC, $CC
        DB $DD, $DC, $99, $9F, $BB, $B9, $33, $3E

        ;; title
        DB "HELLO"
        DS 6

        ;; manufacturer code
        DS 4

        ;; GBC flag
        DB $00

        ;; licensee code
        DB "MM"

        ;; SGB flag
        DB $00

        ;; cart type
        DB $00

        ;; ROM size
        DB $00

        ;; RAM size
        DB $00

        ;; Destination code
        DB $01

        ;; old license code
        DB $33

        ;; ROM version number
        DB $00

        ;; HEADER checksum
        DB $FF
        DW $FACE

main:
        ld a, $AA
        ld [$8000], a
        ld [$8001], a
        ld [$8002], a
        ld a, $66
        ld [$8003], a
        ld [$8004], a
        ld [$8005], a

mainloop:       
        halt
        nop

        ld a, [$FF40]
        or a
        jr z, mainloop

        xor a
        ld [$FF40], a

        jr mainloop

draw:
stat:
timer:
serial:
joypad:
        reti
