{ lib
, runCommand
, typst

, ubuntu_font_family
, font-awesome_6
, fira-mono
}: runCommand "resume.pdf" {
  TYPST_FONT_PATHS = lib.makeSearchPath "" [
    ./fonts
    ubuntu_font_family
    font-awesome_6
  ];
  nativeBuildInputs = [
    typst
  ];
} ''
  typst c ${./.}/resume.typ $out
''