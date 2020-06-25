# bmusicfonts

This is a setup for high quality typesetting using the Bravura design in current versions of LilyPond.

To use the fonts, follow the following instructions:

1. Put the fonts from `music-fonts` in LilyPond's music font directory. The location of this directory will vary depending on your installation. For me, it is `/usr/local/lilypond/usr/share/lilypond/current/fonts/otf/`.

2. Put the font from `text-font` in your directory for text fonts. For me, that's `~/.fonts/`.

3. Download the latest release of [Bravura](https://github.com/steinbergmedia/bravura) and place it in LilyPond's music font directory.

4. Download [profondo-brace](https://github.com/OpenLilyPondFonts/profondo/blob/master/otf/profondo-brace.otf) and place it in Lilypond's music font directory.

5. Place `bmusicdefinitions.ily` and `smufldata.ily` in a directory accessible to LilyPond (so, either in an include directory, or in the local directory with your music file).

6. Optionally, download the [Academico fonts](https://github.com/dbenjaminmiller/academico-mirror) and place them in your directory for text fonts, if you wish to closely match the default Dorico output appearance.

7. In your `paper` block, define the music fonts (and optionally the Roman font as well):

```
\paper{
  #(define fonts
    (set-global-fonts
      #:music "BMusicFont"
      #:brace "profondo"
      #:roman "Academico"
  ))
}
```

8. In your preamble, add `\include "bmusicdefinitions.ily"`.

9. In your `layout` block, add `\context {\Score \bravuraOn}`.

You can see the included minimal example as well.

These fonts will probably be mostly obsoleted by the support for SMuFL which is to arrive in a future version of LilyPond. In the meanwhile, for those who want to use Bravura particularly, these fonts help to ensure consistently high-quality scores. Once native SMuFL support is present in LilyPond, it'll likely be best to just use that.
