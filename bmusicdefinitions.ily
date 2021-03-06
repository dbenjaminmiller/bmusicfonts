\version "2.17.27"
#(ly:set-option 'relative-includes #t)
\include "smufldata.ily"

% PUBLIC DOMAIN

\header {
  snippet-title = "Support for Bravura font"
  snippet-author = "Nathan Ho, Joram Berger, Daniel Benjamin Miller"
  % The original author is Nathan Ho who agreed to put this into
  % openlilylib/snippets under public domain/MIT licence (cf. LICENSE)
  % DBM makes the source available under the same terms.

  % add comma-separated tags to make searching more effective:
  tags = "font, bravura"

}


#(define smufl-font "Bravura")

#(define (smufl-duration-name log)
   (list-ref
    '("Maxima" "Longa" "DoubleWhole" "Whole" "Half" "Quarter" "8th" "16th" "32nd" "64th" "128th" "256th" "512th" "1024th")
    (+ log 3)))

#(define smufl-alteration-glyph-name-alist
   '((0 . "accidentalNatural")
     (-1/2 . "accidentalFlat")
     (1/2 . "accidentalSharp")
     (1 . "accidentalDoubleSharp")
     (-1 . "accidentalDoubleFlat")
     (-1/4 . "accidentalQuarterToneFlatStein")
     (1/4 . "accidentalQuarterToneSharpStein")
     (-3/4 . "accidentalThreeQuarterTonesFlatCouper")
     (3/4 . "accidentalThreeQuarterTonesSharpStein")))

#(define smufl-clef-map
   '(("clefs.C" . "cClef")
     ("clefs.F" . "fClef")
     ("clefs.G" . "gClef")
     ("clefs.percussion" . "unpitchedPercussionClef1")
     ("clefs.tab" . "6stringTabClef")))

#(define smufl-dynamic-map
   '(("p" . "dynamicPiano")
     ("m" . "dynamicMezzo")
     ("f" . "dynamicForte")
     ("r" . "dynamicRinforzando")
     ("s" . "dynamicSforzando")
     ("z" . "dynamicZ")
     ("n" . "dynamicNiente")
     ("pppppp" . "dynamicPPPPPP")
     ("ppppp" . "dynamicPPPPP")
     ("pppp" . "dynamicPPPP")
     ("ppp" . "dynamicPPP")
     ("pp" . "dynamicPP")
     ("mp" . "dynamicMP")
     ("mf" . "dynamicMF")
     ("pf" . "dynamicPF")
     ("ff" . "dynamicFF")
     ("fff" . "dynamicFFF")
     ("ffff" . "dynamicFFFF")
     ("fffff" . "dynamicFFFFF")
     ("ffffff" . "dynamicFFFFFF")
     ("fp" . "dynamicFortePiano")
     ("fz" . "dynamicForzando")
     ("sf" . "dynamicSforzando1")
     ("sfp" . "dynamicSforzandoPiano")
     ("sfpp" . "dynamicSforzandoPianissimo")
     ("sfz" . "dynamicSforzato")
     ("sffz" . "dynamicSforzatoFF")
     ("rf" . "dynamicRinforzando1")
     ("rfz" . "dynamicRinforzando2")))

#(define smufl-script-map
   ; Mapped by hand.
   ; Commented pairs are ones where I couldn't find a suitable SMuFL equivalent.
   '(("scripts.ufermata" . "fermataAbove")
     ("scripts.dfermata" . "fermataBelow")
     ("scripts.ushortfermata" . "fermataShortAbove")
     ("scripts.dshortfermata" . "fermataShortBelow")
     ("scripts.ulongfermata" . "fermataLongAbove")
     ("scripts.dlongfermata" . "fermataLongBelow")
     ("scripts.uverylongfermata" . "fermataVeryLongAbove")
     ("scripts.dverylongfermata" . "fermataVeryLongBelow")
     ("scripts.thumb" . "stringsThumbPosition")
     ("scripts.sforzato" . ("articAccentAbove" . "articAccentBelow"))
     ("scripts.espr" . "dynamicMessaDiVoce")
     ("scripts.staccato" . ("articStaccatoAbove" . "articStaccatoBelow"))
     ("scripts.ustaccatissimo" . "articStaccatissimoAbove")
     ("scripts.dstaccatissimo" . "articStaccatissimoBelow")
     ("scripts.tenuto" . ("articTenutoAbove" . "articTenutoBelow"))
     ("scripts.uportato" . "articTenutoSlurAbove")
     ("scripts.dportato" . "articTenutoSlurBelow")
     ("scripts.umarcato" . "articMarcatoAbove")
     ("scripts.dmarcato" . "articMarcatoBelow")
     ("scripts.open" . "pictOpen")
     ("scripts.halfopen" . "pictOpen1")
     ("scripts.halfopenvertical" . "pictOpen2")
     ("scripts.stopped" . "pictOpenRimShot")
     ("scripts.upbow" . "stringsUpBow")
     ("scripts.downbow" . "stringsDownBow")
     ("scripts.reverseturn" . "ornamentTurnInverted")
     ("scripts.turn" . "ornamentTurn")
     ("scripts.trill" . "ornamentTrill")
     ("scripts.upedalheel" . "keyboardPedalHeel1")
     ("scripts.dpedalheel" . "keyboardPedalHeel2")
     ("scripts.upedaltoe" . "keyboardPedalToe1")
     ("scripts.dpedaltoe" . "keyboardPedalToe2")
     ("scripts.flageolet" . "stringsHarmonic")
     ("scripts.segno" . "segno")
     ("scripts.varsegno" . "segnoSerpent1")
     ("scripts.coda" . "coda")
     ("scripts.varcoda" . "codaSquare")
     ("scripts.rcomma" . "breathMark")
     ;("scripts.lcomma" . "")
     ;("scripts.arpeggio" . "")
     ("scripts.trill_element" . "wiggleTrill")
     ;("scripts.arpeggio.arrow.1" . "")
     ("scripts.trilelement" . "wiggleTrillFaster")
     ("scripts.prall" . "ornamentMordent")
     ("scripts.mordent" . "ornamentMordentInverted")
     ("scripts.prallprall" . "ornamentTremblement")
     ("scripts.upprall" . "ornamentPrecompSlideTrillDAnglebert")
     ("scripts.upmordent" . "ornamentPrecompSlideTrillBach")
     ;("scripts.pralldown" . "")
     ;("scripts.downprall" . "")
     ;("scripts.downmordent" . "")
     ("scripts.prallup" . "ornamentPrecompTrillSuffixDandrieu")
     ("scripts.lineprall" . "ornamentPrecompAppoggTrill")
     ("scripts.caesura.curved" . "caesuraCurved")
     ("scripts.caesura.straight" . "caesura")
     ("scripts.tickmark" . "breathMarkTick")
     ("scripts.snappizzicato" . "pluckedSnapPizzicatoAbove")
     ("scripts.ictus" . "chantIctusAbove")
     ("scripts.uaccentus" . "chantAccentusAbove")
     ("scripts.daccentus" . "chantAccentusBelow")
     ("scripts.usemicirculus" . "chantSemiCirculusAbove")
     ("scripts.dsemicirculus" . "chantSemiCirculusBelow")
     ("scripts.circulus" . "chantAugmentum")
     ("scripts.usignumcongruentiae" . "mensuralSignumUp")
     ("scripts.dsignumcongruentiae" . "mensuralSignumDown")
     ))

#(define smufl-tuplet-map
   '(("0" . "tuplet0")
     ("1" . "tuplet1")
     ("2" . "tuplet2")
     ("3" . "tuplet3")
     ("4" . "tuplet4")
     ("5" . "tuplet5")
     ("6" . "tuplet6")
     ("7" . "tuplet7")
     ("8" . "tuplet8")
     ("9" . "tuplet9")
     (":" . "tupletColon")
     ))

#(define (smufl-has-glyph? glyphname)
   (pair? (assoc glyphname smufl-map)))

#(define-markup-command (smuflglyph layout props glyphname) (string?)
   (let* ((glyph-assoc (assoc glyphname smufl-map)))
     (if (pair? glyph-assoc)
         (interpret-markup layout props
           (markup (#:fontsize 5 #:override `(font-name . ,smufl-font) #:char (cdr glyph-assoc))))
         (begin (ly:warning (string-append "SMuFL glyph `" glyphname "' not found")) point-stencil))))

#(define-markup-command (smuflglyph-compat layout props glyphname) (string?)
   ; Allows Feta names if no appropriate SMuFL char is found.
   (interpret-markup layout props
     (if (smufl-has-glyph? glyphname)
         (markup (#:fontsize 5 #:override `(font-name . ,smufl-font) #:char (cdr (assoc glyphname smufl-map))))
         (markup #:musicglyph glyphname))))

#(define-markup-command (smuflchar layout props charnum) (integer?)
   (interpret-markup layout props
     (markup (#:fontsize 5 #:override `(font-name . ,smufl-font) #:char charnum))))

#(define-markup-command (smufllig layout props glyphs) (list?)
   (interpret-markup layout props
     (markup (#:fontsize 5 #:override `(font-name . ,smufl-font)
               (apply string-append
                 (map
                   (lambda (glyphname) (ly:wide-char->utf-8 (cdr (assoc glyphname smufl-map))))
                   glyphs))))))

% TODO: Support for ottavation
#(define (smufl-clef grob)
   (let* ((glyphname (ly:grob-property grob 'glyph-name))
          (glyphname-without-suffix (string-drop-right glyphname 7))
          (glyphname-assoc (assoc glyphname smufl-clef-map))
          (glyphname-without-suffix-assoc (assoc glyphname-without-suffix smufl-clef-map)))
     (if (smufl-has-glyph? glyphname)
         ; Is this already a SMuFL glyph?
         (grob-interpret-markup grob (markup #:smuflglyph glyphname))
         ; If not, can it be converted into a SMuFL glyph?
         (if (pair? glyphname-assoc)
             (grob-interpret-markup grob (markup #:smuflglyph (cdr glyphname-assoc)))
             (if (and (string-suffix? "_change" glyphname) (pair? glyphname-without-suffix-assoc))
                 (grob-interpret-markup grob (markup #:fontsize -2 #:smuflglyph (cdr glyphname-without-suffix-assoc)))
                 ; Last resort
                 (ly:clef::print grob))))))

#(define (smufl-number n)
   (map
    (lambda (digit)
      (make-smuflglyph-markup
       (string-append "timeSig" (make-string 1 digit))))
    (string->list (number->string n))))

#(define (smufl-numeric-time-signature grob num denom)
   (grob-interpret-markup
    grob
    (markup
     #:vcenter
     #:override '(baseline-skip . 0)
     (make-center-column-markup
      (list
       (make-concat-markup (smufl-number num))
       (make-concat-markup (smufl-number denom)))))))

#(define (smufl-time-signature grob)
   (let* ((style (ly:grob-property grob 'style))
          (fraction (ly:grob-property grob 'fraction))
          (num (if (pair? fraction) (car fraction) 4))
          (denom (if (pair? fraction) (cdr fraction) 4))
          (glyphname
           (cond
            ((equal? fraction '(4 . 4)) "timeSigCommon")
            ((equal? fraction '(2 . 2)) "timeSigCutCommon")
            (else ""))))
     (if (and (equal? style 'C) (not (equal? glyphname "")))
         (grob-interpret-markup
          grob
          (markup #:vcenter #:smuflglyph glyphname))
         (smufl-numeric-time-signature grob num denom))))

#(define (smufl-notehead grob)
   (let* ((log (ly:grob-property grob 'duration-log))
          (style (ly:grob-property grob 'style)))
     (grob-interpret-markup grob
       (cond
        ((<= log -1) (markup #:smuflglyph "noteheadDoubleWhole"))
        ((<= log 0) (markup #:smuflglyph "noteheadWhole"))
        ((<= log 1) (markup #:smuflglyph "noteheadHalf"))
        (else  (markup #:smuflglyph "noteheadBlack"))))))


#(define (smufl-flag grob)
   (let* ((stem-grob (ly:grob-parent grob X))
          (log (ly:grob-property stem-grob 'duration-log))
          (dir (ly:grob-property stem-grob 'direction))
          (stem-width (* (ly:staff-symbol-line-thickness grob) (ly:grob-property stem-grob 'thickness)))
          (glyphname (string-append "flag" (smufl-duration-name log) (if (> dir 0) "Up" "Down")))
          ;(glyphname "flag8thUp")
          (flag-stencil (grob-interpret-markup grob (markup #:general-align Y dir #:smuflglyph glyphname)))
          (flag-pos (cons (* stem-width -1) 0))
          (stroke-style (ly:grob-property grob 'stroke-style))
          (stroke-stencil (if (equal? stroke-style "grace")
                              (if (equal? dir UP)
                                  (make-line-stencil 0.15 -0.5 -1.6 0.75 -0.6)
                                  (make-line-stencil 0.15 -0.4 1.6 0.85 0.6))
                              ;                            (grob-interpret-markup grob (markup #:smuflglyph "flags.ugrace"))
                              ;                            (grob-interpret-markup grob (markup #:smuflglyph "flags.dgrace")))
                              empty-stencil)))
     (ly:stencil-translate (ly:stencil-add flag-stencil stroke-stencil) flag-pos)))

#(define (smufl-accidental grob)
   (let* ((alt (ly:grob-property grob 'alteration))
          (show (if (null? (ly:grob-property grob 'forced)) (if (null? (ly:grob-object grob 'tie)) #t #f ) #t )))
     (if (equal? show #t)
         (grob-interpret-markup grob (markup #:smuflglyph (assoc-get alt smufl-alteration-glyph-name-alist "")))
         (ly:accidental-interface::print grob))))

#(define (smufl-key-signature grob)
   (let* ((altlist (ly:grob-property grob 'alteration-alist))
          (c0pos (ly:grob-property grob 'c0-position))
          (keysig-stencil '()))
     (for-each (lambda (alt)
                 (let* ((alteration (if (grob::has-interface grob 'key-cancellation-interface) 0 (cdr alt)))
                        (glyphname (assoc-get alteration smufl-alteration-glyph-name-alist ""))
                        (padding (cond
                                   ((< alteration 0) 0.1)
                                   ((= alteration 0) 0.3)
                                   ((< alteration 1) 0.1)
                                   (else -0.4)))
                        (ypos (key-signature-interface::alteration-positions alt c0pos grob))
                        (acc-stencil (fold (lambda (y s)
                                             (ly:stencil-add
                                              (grob-interpret-markup grob
                                                (markup #:raise (/ y 2) #:smuflglyph glyphname))
                                              s))
                                       empty-stencil
                                       ypos)))
                   (set! keysig-stencil (ly:stencil-combine-at-edge acc-stencil X RIGHT keysig-stencil padding)))) altlist)
     keysig-stencil))

#(define (smufl-rest grob)
   (let* ((duration (ly:grob-property grob 'duration-log))
          (glyphname (string-append "rest" (smufl-duration-name duration))))
     (grob-interpret-markup grob (markup #:smuflglyph glyphname))))


#(define (smufl-script grob)
   (let* ((dir (ly:grob-property grob 'direction))
          (var (ly:grob-property grob 'script-stencil))
          (glyphname (string-append "scripts." (if (= dir DOWN) (car (cdr var)) (cdr (cdr var)))))
          (glyphname-assoc (assoc glyphname smufl-script-map)))
     (if (smufl-has-glyph? glyphname)
         ; Is this already a SMuFL glyph?
         (grob-interpret-markup grob (markup #:vcenter #:center-align #:smuflglyph glyphname))
         ; If not, can it be converted into a SMuFL glyph?
         (if (pair? glyphname-assoc)
             (let* ((smufl-glyph (cdr glyphname-assoc)))
               (grob-interpret-markup
                 grob
                 (markup #:vcenter #:center-align #:smuflglyph
                   (if (pair? smufl-glyph)
                     (if (= dir DOWN) (cdr smufl-glyph) (car smufl-glyph))
                     smufl-glyph))))
             (ly:script-interface::print grob)))))

% Bug: long dynamics are cut off
#(define (smufl-dynamic-text grob)
   (let* ((text (ly:grob-property grob 'text)))
     (grob-interpret-markup
      grob
      (markup
        (if (pair? (assoc text smufl-dynamic-map))
            (make-smuflglyph-markup (cdr (assoc text smufl-dynamic-map)))
            (make-concat-markup
             (map
              (lambda (char)
                (if (pair? (assoc (make-string 1 char) smufl-dynamic-map))
                    (make-smuflglyph-markup (cdr (assoc (make-string 1 char) smufl-dynamic-map)))
                    (markup (make-string 1 char))))
              (string->list text))))))))

#(define (smufl-dots grob)
   (let* ((count (ly:grob-property grob 'dot-count))
          (dot (grob-interpret-markup grob (markup #:smuflglyph "augmentationDot")))
          (dot-width ((lambda (ext) (- (cdr ext) (car ext))) (ly:stencil-extent dot X)))
          (stil (make-transparent-box-stencil '(0 . 0) '(0 . 0))))
     (if (number? count)
       (let loop ((i count))
         (if (= i 0) stil
           (begin
             (set! stil (ly:stencil-combine-at-edge stil X RIGHT dot dot-width))
             (loop (- i 1))))))))

#(define (smufl-tuplet-number grob)
   (let* ((text (ly:grob-property grob 'text)))
     (grob-interpret-markup
      grob
      (markup
        #:center-align
        #:vcenter
        (if (pair? (assoc text smufl-tuplet-map))
            (make-smuflglyph-markup (cdr (assoc text smufl-tuplet-map)))
            (make-concat-markup
             (map
              (lambda (char)
                (if (pair? (assoc (make-string 1 char) smufl-tuplet-map))
                    (make-smuflglyph-markup (cdr (assoc (make-string 1 char) smufl-tuplet-map)))
                    (markup (make-string 1 char))))
              (string->list text))))))))

ffffff = #(make-dynamic-script "ffffff")
pppppp = #(make-dynamic-script "pppppp")
niente = #(make-dynamic-script "n")

#(define (white-under grob) (grob-interpret-markup grob
  (markup #:vcenter #:whiteout #:pad-x 1 (ly:grob-property grob 'text))))

smuflOn = {
  % Enable this if you just want to install a SMuFL font without the Bravura-specific overrides.
  \override Staff.Clef.stencil = #smufl-clef
  \override Staff.TimeSignature.stencil = #smufl-time-signature
  \override Staff.KeySignature.stencil = #smufl-key-signature
  \override Staff.KeyCancellation.stencil = #smufl-key-signature
  \override Staff.NoteHead.stencil = #smufl-notehead
  %\override Staff.Flag.stencil = #smufl-flag
  %\override Staff.Dots.stencil = #smufl-dots
  \override Staff.Accidental.stencil = #smufl-accidental
  %\override Staff.Rest.stencil = #smufl-rest
  \override Staff.Script.stencil = #smufl-script
  %\override Staff.DynamicText.stencil = #smufl-dynamic-text
  \override Staff.TupletNumber.stencil = #smufl-tuplet-number

}

%bravuraOn = {
%  \smuflOn
%  % Bravura is even heavier than Feta, and so needs extra support
%  \override Staff.StaffSymbol.thickness = #1.2
%  \override Staff.Beam.beam-thickness = #0.55
%  \override Staff.Slur.thickness = #1.5
%}

bravuraOn = {
  \smuflOn
  % Bravura is even heavier than Feta, and so needs extra support
  % DBM's version
  \override Staff.StaffSymbol.thickness = #1.2
  \override Staff.Beam.beam-thickness = #0.55
  \override Staff.Slur.thickness = #1.2
  \override Staff.NoteHead.font-size = #1.15
  \override Staff.Stem.thickness=#1.15
  \override Staff.ClefModifier.font-name = #"BMusicalTextFont"
  \override Staff.ClefModifier.font-size = #-4
  \override Staff.ClefModifier.padding = -0.11
  %\override DynamicText.font-name = "BMusicalTextFont" \override DynamicText.font-size = #5

}

smuflOff = {
  % This reverts all settings activated with \smuflOn
  \revert Staff.Clef.stencil
  \revert Staff.TimeSignature.stencil
  \revert Staff.KeySignature.stencil
  \revert Staff.KeyCancellation.stencil
  \revert Staff.NoteHead.stencil
  \revert Staff.Flag.stencil
  \revert Staff.Dots.stencil
  \revert Staff.Accidental.stencil
  \revert Staff.Rest.stencil
  \revert Staff.Script.stencil
  \revert Staff.DynamicText.stencil
  \revert Staff.TupletNumber.stencil
}

bravuraOff = {
  \smuflOff
  % This reverts all settings activated with \bravuraOn
  \revert Staff.StaffSymbol.thickness
  \revert Staff.Beam.beam-thickness
  \revert Staff.Slur.thickness
}


#(define-markup-command (dynamic layout props text) (markup?)
  "Draw a double box around text."
  (interpret-markup layout props
    #{\markup \override #'(font-size . 5) \override #'(font-name . "BMusicalTextFont") { #text }#}))
	


