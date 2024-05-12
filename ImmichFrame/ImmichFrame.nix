{ fetchFromGitHub
, buildDotnetModule
, dotnetCorePackages
}:

buildDotnetModule rec {
    pname = "ImmichFrame";
    version = "1.0.1.0";

    src = fetchFromGitHub {
        owner = "3rob3";
        repo = pname;
        rev = "v${version}";
        sha256 = "bYZYfwntp0pbLyYbZQ7G5gF8gUT4c2ctbIgv7xWlCq4=";
    };

    projectFile = "ImmichFrame.Desktop/ImmichFrame.Desktop.csproj";
    dotnet-sdk = dotnetCorePackages.sdk_7_0;
    dotnet-runtime = dotnetCorePackages.runtime_7_0;
    nugetDeps = ./deps.nix;
}