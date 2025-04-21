{
  inputs = {  };
  outputs = {nixpkgs, self, ...} : let
    call = (import nixpkgs { system = "x86_64-linux"; }).callPackage ./.; in
  {
    packages.x86_64-linux.default = call { timestamp = self.lastModified; };
    packages.x86_64-linux.serious = call { timestamp = self.lastModified; inputs = { serious = "1"; }; };
  };
}
