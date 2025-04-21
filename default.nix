{ lib
, runCommand
, typst

, ubuntu_font_family
, font-awesome_6
, fira-mono

, inputs ? {}
, timestamp
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
  typst c ${./.}/resume.typ --creation-timestamp ${toString(timestamp)} $out ${with builtins; concatStringsSep " " (map (name: "--input ${name}=${inputs.${name}}") (attrNames inputs))}
''
