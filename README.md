# bmusicfonts

# New recommended method for using Bravura (and other SMUFL fonts)

I recommend using [esmuflily](https://github.com/tr-igem/esmuflily) and [ekmelily](https://github.com/tr-igem/ekmelily) instead, which can load any SMUFL font (including Bravura). Since Bravura expects different notehead sizes, you will need to adjust some properties to get Bravura defaults.

1. Install Bravura as a regular font.
2. Place the files from `esmuflily` and `ekmelily` wherever you'd like.
3. Add the following to the beginning of your LilyPond file.

```
ekmFont = "Bravura"
\include "/path/to/ekmel-12.ily"
\include "/path/to/esmufl.ily"
\ekmelicStyle std

bravuraDef = {
%%Bravura defaults
\override Staff.StaffSymbol.thickness = #1.25
\override Hairpin.thickness = #1.25
\override Staff.Beam.beam-thickness = #0.5
\override Staff.Slur.thickness = #1.2
\override Staff.NoteHead.font-size = #1.115 %comment out if not using Bravura
\override Staff.Stem.thickness=#1.25
}

ekmSet = {
\bravuraDef
\ekmSmuflOn #'all
}
```
4. In your `layout` block, add `\context {\Score \ekmSet}`.

If you're using a SMUFL font other than Bravura, can comment out `\bravuraDef` from `ekmSet` entirely, or adjust the properties as you wish. (Most non-Bravura SMUFL fonts do not use small noteheads by default, so you may want to comment out `\override Staff.NoteHead.font-size = #1.115`.)

# Old method

This is a setup for high quality typesetting using the Bravura design in current versions of LilyPond.

To use the fonts, follow the following instructions:

1. Put the fonts from `music-fonts` in LilyPond's music font directory. The location of this directory will vary depending on your installation. For me, it is `/usr/local/lilypond/usr/share/lilypond/current/fonts/otf/`.

2. Put the font from `text-font` in your directory for text fonts. For me, that's `~/.fonts/`.

3. Download the latest release of [Bravura](https://github.com/steinbergmedia/bravura) and place it in LilyPond's music font directory.

4. Place `bmusicdefinitions.ily` and `smufldata.ily` in a directory accessible to LilyPond (so, either in an include directory, or in the local directory with your music file).

5. Optionally, download the [Academico fonts](https://github.com/dbenjaminmiller/academico-mirror) and place them in your directory for text fonts, if you wish to closely match the default Dorico output appearance.

6. In your `paper` block, define the music fonts (and optionally the Roman font as well):

For LilyPond versions before 2.25:

```
\paper{
  #(define fonts
    (set-global-fonts
      #:music "BMusicFont"
      #:brace "BMusicFont"
      #:roman "Academico"
  ))
}
```

For LilyPond 2.25 and later:

```
\paper{
	property-defaults.fonts.serif = "Academico"
	property-defaults.fonts.music = "BMusicFont"
}
```

8. In your preamble, add `\include "bmusicdefinitions.ily"`.

9. In your `layout` block, add `\context {\Score \bravuraOn}`.

You can see the included minimal example as well.

These fonts will probably be mostly obsoleted by the support for SMuFL which is to arrive in a future version of LilyPond. In the meanwhile, for those who want to use Bravura particularly, these fonts help to ensure consistently high-quality scores. Once native SMuFL support is present in LilyPond, it'll likely be best to just use that.
