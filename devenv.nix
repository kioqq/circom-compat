{ pkgs, lib, config, inputs, ... }:

{

  # https://devenv.sh/packages/
  packages = [ 
    pkgs.git 
    pkgs.just
    pkgs.tree
    pkgs.lld_20

    pkgs.cargo-outdated
  ];

  languages.nix.enable = true;
  languages.rust = {
    enable = true;
    rustflags = "-C target-cpu=native -C codegen-units=16 -C debuginfo=0 -C opt-level=0 -C link-arg=-fuse-ld=lld";
  };

  env.RUSTC_WRAPPER = "${pkgs.sccache}/bin/sccache";
  env.SCCACHE_CACHE_SIZE = "4G";

  dotenv.enable = true;
}
