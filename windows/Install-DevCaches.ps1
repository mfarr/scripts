$caches = @{
    "NUGET_PACKAGES" = "D:\Packages\nuget"
    "npm_config_cache" = "D:\Packages\npm"
    "PIP_CACHE_DIR" = "D:\Packages\pip"
    "POETRY_CACHE_DIR" = "D:\Packages\poetry"
    "CARGO_HOME" = "D:\Packages\cargo"
    "VCPKG_DEFAULT_BINARY_CACHE" = "D:\Packages\vcpkg"
}

foreach ($key in $caches.Keys) {
    New-Item -Path $caches[$key] -ItemType Directory -ErrorAction SilentlyContinue
    setx /M $key $caches[$key] 
}