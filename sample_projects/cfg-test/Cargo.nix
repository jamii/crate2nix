
# Generated by crate2nix 0.7.0-alpha.1 with the command:
#   "generate" "-f" "sample_projects/cfg-test/Cargo.toml" "-o" "sample_projects/cfg-test/Cargo.nix"
# See https://github.com/kolloch/crate2nix for more info.

{ pkgs? import <nixpkgs> { config = {}; },
  lib? pkgs.lib,
  callPackage? pkgs.callPackage,
  stdenv? pkgs.stdenv,
  buildRustCrate? pkgs.buildRustCrate,
  fetchurl? pkgs.fetchurl,
  fetchCrate? pkgs.fetchCrate,
  defaultCrateOverrides? pkgs.defaultCrateOverrides,
  # The features to enable for the root_crate or the workspace_members.
  rootFeatures? ["default"]}:

rec {
  #
  # "public" attributes that we attempt to keep stable with new versions of crate2nix.
  #

  rootCrate = {
    packageId = "cfg-test 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/cfg-test)";

    # Use this attribute to refer to the derivation building your root crate package.
    # You can override the features with rootCrate.build.override { features = [ "default" "feature1" ... ]; }.
    build = buildRustCrateWithFeatures {
      packageId = "cfg-test 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/cfg-test)";
      features = rootFeatures;
    };
  };
  root_crate =
    builtins.trace "root_crate is deprecated since crate2nix 0.4. Please use rootCrate instead." rootCrate.build;
  # Refer your crate build derivation by name here.
  # You can override the features with
  # workspaceMembers."${crateName}".build.override { features = [ "default" "feature1" ... ]; }.
  workspaceMembers = {
    "cfg-test" = {
      packageId = "cfg-test 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/cfg-test)";
      build = buildRustCrateWithFeatures {
        packageId = "cfg-test 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/cfg-test)";
        features = rootFeatures;
      };
    };
  };
  workspace_members =
    builtins.trace
      "workspace_members is deprecated in crate2nix 0.4. Please use workspaceMembers instead."
      lib.mapAttrs (n: v: v.build) workspaceMembers;

  #
  # "private" attributes that may change in every new version of crate2nix.
  #

  # Build and dependency information for crates.
  # Many of the fields are passed one-to-one to buildRustCrate.
  #
  # Noteworthy:
  # * `crateBin = [{name = ","; path = ",";}];`: a hack to disable building the binary.
  # * `dependencies`/`buildDependencies`: similar to the corresponding fields for buildRustCrate.
  #   but with additional information which is used during dependency/feature resolution.
  # * `resolvedDependencies`: the selected default features reported by cargo - only included for debugging.

  crates = {
    "cfg-if 0.1.10 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "cfg-if";
        version = "0.1.10";
        edition = "2018";
        sha256 = "0x52qzpbyl2f2jqs7kkqzgfki2cpq99gpfjjigdp8pwwfqk01007";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        features = {
          "rustc-dep-of-std" = [ "core" "compiler_builtins" ];
        };
      };
    "cfg-test 0.1.0 (path+file:///home/peter/projects/crate2nix/sample_projects/cfg-test)"
      = rec {
        crateName = "cfg-test";
        version = "0.1.0";
        edition = "2018";
        crateBin = [
          { name = "cfg-test"; path = "src/main.rs"; }
        ];
        src = (builtins.filterSource sourceFilter ./.);
        authors = [
          "Andreas Rammhold <andreas@rammhold.de>"
        ];
        dependencies = [
          {
            name = "tracing";
            packageId = "tracing 0.1.10 (registry+https://github.com/rust-lang/crates.io-index)";
            target = features: target."test";
            features = [ "log" ];
          }
        ];
        features = {
        };
      };
    "lazy_static 1.4.0 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "lazy_static";
        version = "1.4.0";
        edition = "2015";
        sha256 = "13h6sdghdcy7vcqsm2gasfw3qg7ssa0fl3sw7lq6pdkbk52wbyfr";
        authors = [
          "Marvin Löbel <loebel.marvin@gmail.com>"
        ];
        dependencies = [
          {
            name = "spin";
            packageId = "spin 0.5.2 (registry+https://github.com/rust-lang/crates.io-index)";
            optional = true;
          }
        ];
        features = {
          "spin_no_std" = [ "spin" ];
        };
        resolvedDefaultFeatures = [ "spin" "spin_no_std" ];
      };
    "log 0.4.8 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "log";
        version = "0.4.8";
        edition = "2015";
        sha256 = "0wvzzzcn89dai172rrqcyz06pzldyyy0lf0w71csmn206rdpnb15";
        authors = [
          "The Rust Project Developers"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if 0.1.10 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "kv_unstable_sval" = [ "kv_unstable" "sval/fmt" ];
        };
      };
    "proc-macro2 1.0.6 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "proc-macro2";
        version = "1.0.6";
        edition = "2018";
        sha256 = "1l56ss9ip8cg6764cpi9y8dv7nsyqf2i4hb7sn29zx61n03jr81z";
        authors = [
          "Alex Crichton <alex@alexcrichton.com>"
        ];
        dependencies = [
          {
            name = "unicode-xid";
            packageId = "unicode-xid 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "proc-macro" ];
        };
        resolvedDefaultFeatures = [ "proc-macro" ];
      };
    "quote 1.0.2 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "quote";
        version = "1.0.2";
        edition = "2018";
        sha256 = "0r7030w7dymarn92gjgm02hsm04fwsfs6f1l20wdqiyrm9z8rs5q";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro2";
            packageId = "proc-macro2 1.0.6 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "proc-macro" ];
          "proc-macro" = [ "proc-macro2/proc-macro" ];
        };
        resolvedDefaultFeatures = [ "default" "proc-macro" ];
      };
    "spin 0.5.2 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "spin";
        version = "0.5.2";
        edition = "2015";
        sha256 = "1x0mfk6jfxknrp833xq97kzqxidlryndn0v3xkwf4pd7l9hr5k4h";
        authors = [
          "Mathijs van de Nes <git@mathijs.vd-nes.nl>"
          "John Ericson <git@JohnEricson.me>"
        ];
        features = {
        };
      };
    "syn 1.0.7 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "syn";
        version = "1.0.7";
        edition = "2018";
        sha256 = "1y68sh9hpcrc8cbc3kkffj7gr7ay2b1dh6cl0b3ma5qv3x6bahk2";
        authors = [
          "David Tolnay <dtolnay@gmail.com>"
        ];
        dependencies = [
          {
            name = "proc-macro2";
            packageId = "proc-macro2 1.0.6 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
          {
            name = "quote";
            packageId = "quote 1.0.2 (registry+https://github.com/rust-lang/crates.io-index)";
            optional = true;
            usesDefaultFeatures = false;
          }
          {
            name = "unicode-xid";
            packageId = "unicode-xid 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)";
          }
        ];
        features = {
          "default" = [ "derive" "parsing" "printing" "clone-impls" "proc-macro" ];
          "printing" = [ "quote" ];
          "proc-macro" = [ "proc-macro2/proc-macro" "quote/proc-macro" ];
        };
        resolvedDefaultFeatures = [ "clone-impls" "default" "derive" "extra-traits" "full" "parsing" "printing" "proc-macro" "quote" ];
      };
    "tracing 0.1.10 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "tracing";
        version = "0.1.10";
        edition = "2018";
        sha256 = "1l77jvk04jdgrjg5yqnqyaqr2l7kg3lh1w03b1h03mr6ymz8q4l0";
        authors = [
          "Tokio Contributors <team@tokio.rs>"
        ];
        dependencies = [
          {
            name = "cfg-if";
            packageId = "cfg-if 0.1.10 (registry+https://github.com/rust-lang/crates.io-index)";
          }
          {
            name = "log";
            packageId = "log 0.4.8 (registry+https://github.com/rust-lang/crates.io-index)";
            optional = true;
          }
          {
            name = "spin";
            packageId = "spin 0.5.2 (registry+https://github.com/rust-lang/crates.io-index)";
            target = features: (!(builtins.elem "std" features));
          }
          {
            name = "tracing-attributes";
            packageId = "tracing-attributes 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)";
          }
          {
            name = "tracing-core";
            packageId = "tracing-core 0.1.7 (registry+https://github.com/rust-lang/crates.io-index)";
            usesDefaultFeatures = false;
          }
        ];
        features = {
          "default" = [ "std" ];
          "log-always" = [ "log" ];
          "std" = [ "tracing-core/std" ];
        };
        resolvedDefaultFeatures = [ "default" "log" "std" ];
      };
    "tracing-attributes 0.1.5 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "tracing-attributes";
        version = "0.1.5";
        edition = "2018";
        sha256 = "05yjirn85vwvamgiw85pkl1c7rwl3p90jh2x2fv6l3xf9spidkd6";
        procMacro = true;
        authors = [
          "Tokio Contributors <team@tokio.rs>"
          "Eliza Weisman <eliza@buoyant.io>"
          "David Barsky <dbarsky@amazon.com>"
        ];
        dependencies = [
          {
            name = "quote";
            packageId = "quote 1.0.2 (registry+https://github.com/rust-lang/crates.io-index)";
          }
          {
            name = "syn";
            packageId = "syn 1.0.7 (registry+https://github.com/rust-lang/crates.io-index)";
            features = [ "full" "extra-traits" ];
          }
        ];
        features = {
        };
      };
    "tracing-core 0.1.7 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "tracing-core";
        version = "0.1.7";
        edition = "2018";
        sha256 = "02h62n1bv8y8xmq7r6qw9srrj48w9947333jj2d200ri1l43hp5d";
        authors = [
          "Tokio Contributors <team@tokio.rs>"
        ];
        dependencies = [
          {
            name = "lazy_static";
            packageId = "lazy_static 1.4.0 (registry+https://github.com/rust-lang/crates.io-index)";
          }
          {
            name = "lazy_static";
            packageId = "lazy_static 1.4.0 (registry+https://github.com/rust-lang/crates.io-index)";
            target = features: (!(builtins.elem "std" features));
            features = [ "spin_no_std" ];
          }
          {
            name = "spin";
            packageId = "spin 0.5.2 (registry+https://github.com/rust-lang/crates.io-index)";
            target = features: (!(builtins.elem "std" features));
          }
        ];
        features = {
          "default" = [ "std" ];
        };
        resolvedDefaultFeatures = [ "std" ];
      };
    "unicode-xid 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)"
      = rec {
        crateName = "unicode-xid";
        version = "0.2.0";
        edition = "2015";
        sha256 = "1c85gb3p3qhbjvfyjb31m06la4f024jx319k10ig7n47dz2fk8v7";
        authors = [
          "erick.tryzelaar <erick.tryzelaar@gmail.com>"
          "kwantam <kwantam@gmail.com>"
        ];
        features = {
        };
        resolvedDefaultFeatures = [ "default" ];
      };
  };

  #
  # crate2nix/default.nix (excerpt start)
  # 

  # Target (platform) data for conditional dependencies.
  # This corresponds roughly to what buildRustCrate is setting.
  target = {
      unix = true;
      windows = false;
      # We don't support tests yet, so this is true for now.
      test = false;

      # This doesn't appear to be officially documented anywhere yet.
      # See https://github.com/rust-lang-nursery/rust-forge/issues/101.
      os = if stdenv.hostPlatform.isDarwin
        then "macos"
        else stdenv.hostPlatform.parsed.kernel.name;
      arch = stdenv.hostPlatform.parsed.cpu.name;
      family = "unix";
      env = "gnu";
      endian = if stdenv.hostPlatform.parsed.cpu.significantByte.name == "littleEndian" then "little" else "big";
      pointer_width = toString stdenv.hostPlatform.parsed.cpu.bits;
      vendor = stdenv.hostPlatform.parsed.vendor.name;
      debug_assertions = false;
  };

  /* Filters common temp files and build files */
  # TODO(pkolloch): Substitute with gitignore filter
  sourceFilter = name: type:
    let baseName = builtins.baseNameOf (builtins.toString name);
    in ! (
      # Filter out git
      baseName == ".gitignore" ||
      (type == "directory" && baseName == ".git" ) ||

      # Filter out build results
      (type == "directory" && (
        baseName == "target" ||
        baseName == "_site" ||
        baseName == ".sass-cache" ||
        baseName == ".jekyll-metadata" ||
        baseName == "build-artifacts"
        )) ||

      # Filter out nix-build result symlinks
      (type == "symlink" && lib.hasPrefix "result" baseName) ||

      # Filter out IDE config
      (type == "directory" && (
        baseName == ".idea" ||
        baseName == ".vscode"
        )) ||
      lib.hasSuffix ".iml" baseName ||

      # Filter out nix build files
      # lib.hasSuffix ".nix" baseName ||

      # Filter out editor backup / swap files.
      lib.hasSuffix "~" baseName ||
      builtins.match "^\\.sw[a-z]$$" baseName != null ||
      builtins.match "^\\..*\\.sw[a-z]$$" baseName != null ||
      lib.hasSuffix ".tmp" baseName ||
      lib.hasSuffix ".bak" baseName ||
      baseName == "tests.nix"
    );

  /* A restricted overridable version of  buildRustCrateWithFeaturesImpl. */
  buildRustCrateWithFeatures = {packageId, features, crateOverrides ? defaultCrateOverrides}:
    lib.makeOverridable
      ({features, crateOverrides}: buildRustCrateWithFeaturesImpl {inherit packageId features crateOverrides;})
      { inherit features crateOverrides; };

  /* Returns a buildRustCrate derivation for the given packageId and features. */
  buildRustCrateWithFeaturesImpl = { crateConfigs? crates, packageId, features, crateOverrides } @ args:
    assert (builtins.isAttrs crateConfigs);
    assert (builtins.isString packageId);
    assert (builtins.isList features);

    let mergedFeatures = mergePackageFeatures args;
        buildByPackageId = packageId:
          let features = mergedFeatures."${packageId}" or [];
              crateConfig = lib.filterAttrs (n: v: n != "resolvedDefaultFeatures") crateConfigs."${packageId}";
              dependencies =
                dependencyDerivations buildByPackageId features (crateConfig.dependencies or []);
              buildDependencies =
                dependencyDerivations buildByPackageId features (crateConfig.buildDependencies or []);
              dependenciesWithRenames =
                lib.filter (d: d ? "rename")
                  (crateConfig.buildDependencies or [] ++ crateConfig.dependencies or []);
              crateRenames =
                builtins.listToAttrs (map (d: { name = d.name; value = d.rename; }) dependenciesWithRenames);
          in buildRustCrate (crateConfig // { inherit features dependencies buildDependencies crateRenames; });
    in buildByPackageId packageId;

  /* Returns the actual derivations for the given dependencies. */
  dependencyDerivations = buildByPackageId: features: dependencies:
    assert (builtins.isFunction buildByPackageId);
    assert (builtins.isList features);
    assert (builtins.isList dependencies);

    let enabledDependencies = filterEnabledDependencies dependencies features;
        depDerivation = dependency:
        buildByPackageId (dependencyPackageId dependency);
    in map depDerivation enabledDependencies;

  /* Returns differences between cargo default features and crate2nix default features.
   *
   * This is useful for verifying the feature resolution in crate2nix.
   */
  diffDefaultPackageFeatures = {crateConfigs ? crates, packageId}:
    assert (builtins.isAttrs crateConfigs);

    let prefixValues = prefix: lib.mapAttrs (n: v: { "${prefix}" = v; });
        mergedFeatures =
          prefixValues
            "crate2nix"
            (mergePackageFeatures {inherit crateConfigs packageId; features = ["default"]; });
        configs = prefixValues "cargo" crateConfigs;
        combined = lib.foldAttrs (a: b: a // b) {} [ mergedFeatures configs ];
        onlyInCargo = builtins.attrNames (lib.filterAttrs (n: v: !(v ? "crate2nix" ) && (v ? "cargo")) combined);
        onlyInCrate2Nix = builtins.attrNames (lib.filterAttrs (n: v: (v ? "crate2nix" ) && !(v ? "cargo")) combined);
        differentFeatures = lib.filterAttrs
          (n: v:
          (v ? "crate2nix" )
          && (v ? "cargo")
          && (v.crate2nix.features or []) != (v."cargo".resolved_default_features or []))
          combined;
    in builtins.toJSON { inherit onlyInCargo onlyInCrate2Nix differentFeatures; };

  /* Returns the feature configuration by package id for the given input crate. */
  mergePackageFeatures = {
      crateConfigs ? crates, 
      packageId, 
      features, ...} @ args:
    assert (builtins.isAttrs crateConfigs);
    assert (builtins.isString packageId);
    assert (builtins.isList features);

    let packageFeatures = listOfPackageFeatures args;
        grouped = lib.groupBy (x: x.packageId) packageFeatures;
    in lib.mapAttrs (n: v: sortedUnique (builtins.concatLists (builtins.map (v: v.features) v))) grouped;

  /* Returns a { packageId, features } attribute set for every package needed for building the
     package for the given packageId with the given features.

     Returns multiple, potentially conflicting attribute sets for dependencies that are reachable
     by multiple paths in the dependency tree.
  */
  listOfPackageFeatures = {crateConfigs ? crates, packageId, features, dependencyPath? [packageId], ...} @ args:
    assert (builtins.isAttrs crateConfigs);
    assert (builtins.isString packageId);
    assert (builtins.isList features);

    let
        crateConfig = crateConfigs."${packageId}" or (builtins.throw "Package not found: ${packageId}");
        expandedFeatures = expandFeatures (crateConfig.features or {}) features;

        depWithResolvedFeatures = dependency:
          let packageId = dependencyPackageId dependency;
              features = dependencyFeatures expandedFeatures dependency.name dependency;
          in { inherit packageId features; };

        resolveDependencies = path: dependencies:
          assert (builtins.isList dependencies);

          let enabledDependencies = filterEnabledDependencies dependencies expandedFeatures;
              directDependencies = map depWithResolvedFeatures enabledDependencies;
          in builtins.concatMap
            ({packageId, features}: listOfPackageFeatures {
              # This is purely for debugging.
              dependencyPath = dependencyPath ++ [path packageId];
              inherit crateConfigs packageId features;
            })
             directDependencies;

        resolvedDependencies = builtins.concatLists
          [
            (resolveDependencies "dependencies" (crateConfig.dependencies or []))
            (resolveDependencies "buildDependencies" (crateConfig.buildDependencies or []))
          ];

    in [{inherit packageId; features = expandedFeatures;}] ++ resolvedDependencies;

  /* Returns the enabled dependencies given the enabled features. */
  filterEnabledDependencies = dependencies: features:
    assert (builtins.isList dependencies);
    assert (builtins.isList features);

    lib.filter
      (dep:
        let targetFunc = dep.target or (features: true);
            target = targetFunc features;
        in builtins.isString dep
        || target
        && (!(dep.optional or false) || builtins.any (doesFeatureEnableDependency dep.name) features))
      dependencies;

  /* Returns whether the given feature should enable the given dependency. */
  doesFeatureEnableDependency = depName: feature:
    let prefix = "${depName}/";
        len = builtins.stringLength prefix;
        startsWithPrefix = builtins.substring 0 len feature == prefix;
    in feature == depName || startsWithPrefix;

  /* Returns the expanded features for the given inputFeatures by applying the rules in featureMap.

     featureMap is an attribute set which maps feature names to lists of further feature names to enable in case this
     feature is selected.
  */
  expandFeatures = featureMap: inputFeatures:
    assert (builtins.isAttrs featureMap);
    assert (builtins.isList inputFeatures);

    let expandFeature = feature:
          assert (builtins.isString feature);
          [feature] ++ (expandFeatures featureMap (featureMap."${feature}" or []));
        outFeatures = builtins.concatMap expandFeature inputFeatures;
    in sortedUnique outFeatures;

  /* The package ID of the given dependency. */
  dependencyPackageId = dependency: if builtins.isString dependency then dependency else dependency.packageId;

  /* Returns the actual dependencies for the given dependency. */
  dependencyFeatures = features: dependencyName: dependency:
    assert (builtins.isList features);
    assert (builtins.isString dependencyName);
    assert (builtins.isAttrs dependency || builtins.isString dependency);

    let defaultOrNil = if builtins.isString dependency || dependency.usesDefaultFeatures or true
                       then ["default"]
                       else [];
        explicitFeatures = if builtins.isString dependency then [] else dependency.features or [];
        additionalDependencyFeatures =

          let dependencyPrefix = dependencyName+"/";
              dependencyFeatures =
                builtins.filter (f: lib.hasPrefix dependencyPrefix f) features;
          in builtins.map (lib.removePrefix dependencyPrefix) dependencyFeatures;
    in
      defaultOrNil ++ explicitFeatures ++ additionalDependencyFeatures;

  /* Sorts and removes duplicates from a list of strings. */
  sortedUnique = features:
    assert (builtins.isList features);
    assert (builtins.all builtins.isString features);

    let outFeaturesSet = lib.foldl (set: feature: set // {"${feature}" = 1;} ) {} features;
        outFeaturesUnique = builtins.attrNames outFeaturesSet;
    in builtins.sort (a: b: a < b) outFeaturesUnique;

  #
  # crate2nix/default.nix (excerpt end)
  # 

}
