{
  inputs = {  };
  outputs = {nixpkgs, ...} : let
    call = (import nixpkgs { system = "x86_64-linux"; }).callPackage ./.; in
  {
    packages.x86_64-linux.default = call {};
    packages.x86_64-linux.serious = call { inputs = { serious = "1"; }; };
  };
}
