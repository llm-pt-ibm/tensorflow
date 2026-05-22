"""Hermetic Python initialization. Consult the WORKSPACE on how to use it."""

load(
    "@python_version_repo//:py_version.bzl",
    "HERMETIC_PYTHON_PREFIX",
    "HERMETIC_PYTHON_SHA256",
    "HERMETIC_PYTHON_URL",
    "HERMETIC_PYTHON_VERSION",
    "HERMETIC_PYTHON_VERSION_KIND",
)
load("@rules_python//python:repositories.bzl", "python_register_toolchains")
load("@rules_python//python:versions.bzl", "MINOR_MAPPING", "PLATFORMS")

def get_toolchain_name_per_python_version(name):
    return "{name}_{version}".format(
        name = name,
        version = HERMETIC_PYTHON_VERSION.replace(".", "_"),
    )

def python_init_toolchains(name = "python", python_version = None, **kwargs):
    """Disabled for ppc64le: no prebuilt hermetic Python available."""
    pass

