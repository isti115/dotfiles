final: prev:
let
  vscode-insider = prev.vscode.override {
    isInsiders = true;
  };
in
{
  vscode-insider = vscode-insider.overrideAttrs (oldAttrs: rec {
    src = (builtins.fetchTarball {
      url = "https://update.code.visualstudio.com/latest/linux-x64/insider";
      sha256 = "1dh8yjxnicw39icmqdgwnnfaimpvr14c5jczqag594hn5xazgw6k";
    });
    version = "latest";
  });
}
