# buildifier: disable=load-on-top

workspace(name = "org_tensorflow")

# buildifier: disable=load-on-top

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

tf_http_archive(
    name = "rules_shell",
    sha256 = "bc61ef94facc78e20a645726f64756e5e285a045037c7a61f65af2941f4c25e1",
    strip_prefix = "rules_shell-0.4.1",
    urls = tf_mirror_urls(
        "https://github.com/bazelbuild/rules_shell/releases/download/v0.4.1/rules_shell-v0.4.1.tar.gz",
    ),
)

# Initialize toolchains for ML projects.
#
# A hermetic build system is designed to produce completely reproducible builds for C++.
# Details: https://github.com/google-ml-infra/rules_ml_toolchain
tf_http_archive(
    name = "rules_ml_toolchain",
    sha256 = "54c1a357f71f611efdb4891ebd4bcbe4aeb6dfa7e473f14fd7ecad5062096616",
    strip_prefix = "rules_ml_toolchain-d8cb9c2c168cd64000eaa6eda0781a9615a26ffe",
    urls = tf_mirror_urls(
        "https://github.com/google-ml-infra/rules_ml_toolchain/archive/d8cb9c2c168cd64000eaa6eda0781a9615a26ffe.tar.gz",
    ),
)

# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//cc/deps:cc_toolchain_deps.bzl",
# PPC64LE:     "cc_toolchain_deps",
# PPC64LE: )

# PPC64LE: cc_toolchain_deps()

# PPC64LE: register_toolchains("@rules_ml_toolchain//cc:linux_x86_64_linux_x86_64")

# PPC64LE: register_toolchains("@rules_ml_toolchain//cc:linux_x86_64_linux_x86_64_cuda")

# PPC64LE: register_toolchains("@rules_ml_toolchain//cc:linux_aarch64_linux_aarch64")

# PPC64LE: register_toolchains("@rules_ml_toolchain//cc:linux_aarch64_linux_aarch64_cuda")

# Initialize the TensorFlow repository and all dependencies.
#
# The cascade of load() statements and tf_workspace?() calls works around the
# restriction that load() statements need to be at the top of .bzl files.
# E.g. we can not retrieve a new repository with http_archive and then load()
# a macro from that repository in the same file.
load("@//tensorflow:workspace3.bzl", "tf_workspace3")

tf_workspace3()

load("@rules_shell//shell:repositories.bzl", "rules_shell_dependencies", "rules_shell_toolchains")

rules_shell_dependencies()

rules_shell_toolchains()

# Initialize hermetic Python
load("@xla//third_party/py:python_init_rules.bzl", "python_init_rules")

python_init_rules()

load("@xla//third_party/py:python_init_repositories.bzl", "python_init_repositories")

python_init_repositories(
    default_python_version = "system",
    local_wheel_dist_folder = "dist",
    local_wheel_inclusion_list = [
        "tensorflow*",
        "tf_nightly*",
    ],
    local_wheel_workspaces = ["//:WORKSPACE"],
    requirements = {
        "3.10": "//:requirements_lock_3_10.txt",
        "3.11": "//:requirements_lock_3_11.txt",
        "3.12": "//:requirements_lock_3_12.txt",
        "3.13": "//:requirements_lock_3_13.txt",
    },
)

load("@xla//third_party/py:python_init_toolchains.bzl", "python_init_toolchains")

python_init_toolchains()

load("@xla//third_party/py:python_init_pip.bzl", "python_init_pip")

python_init_pip()

load("@pypi//:requirements.bzl", "install_deps")

install_deps()
# End hermetic Python initialization

load("@//tensorflow:workspace2.bzl", "tf_workspace2")

tf_workspace2()

load("@//tensorflow:workspace1.bzl", "tf_workspace1")

tf_workspace1()

load("@//tensorflow:workspace0.bzl", "tf_workspace0")

tf_workspace0()

# PPC64LE: load(
# PPC64LE:     "@xla//third_party/py:python_wheel.bzl",
# PPC64LE:     "nvidia_wheel_versions_repository",
# PPC64LE:     "python_wheel_version_suffix_repository",
# PPC64LE: )

# PPC64LE: nvidia_wheel_versions_repository(
# PPC64LE:     name = "nvidia_wheel_versions",
# PPC64LE:     versions_source = "//ci/official/requirements_updater:nvidia-requirements.txt",
# PPC64LE: )

# PPC64LE: python_wheel_version_suffix_repository(name = "tf_wheel_version_suffix")

# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/cuda:cuda_json_init_repository.bzl",
# PPC64LE:     "cuda_json_init_repository",
# PPC64LE: )

# PPC64LE: cuda_json_init_repository()

# PPC64LE: load(
# PPC64LE:     "@cuda_redist_json//:distributions.bzl",
# PPC64LE:     "CUDA_REDISTRIBUTIONS",
# PPC64LE:     "CUDNN_REDISTRIBUTIONS",
# PPC64LE: )
# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/cuda:cuda_redist_init_repositories.bzl",
# PPC64LE:     "cuda_redist_init_repositories",
# PPC64LE:     "cudnn_redist_init_repository",
# PPC64LE: )
# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/cuda:cuda_redist_versions.bzl",
# PPC64LE:     "REDIST_VERSIONS_TO_BUILD_TEMPLATES",
# PPC64LE: )
load("@xla//third_party/cccl:workspace.bzl", "CCCL_DIST_DICT", "CCCL_GITHUB_VERSIONS_TO_BUILD_TEMPLATES")

# PPC64LE: cuda_redist_init_repositories(
# PPC64LE:     cuda_redistributions = CUDA_REDISTRIBUTIONS | CCCL_DIST_DICT,
# PPC64LE:     redist_versions_to_build_templates = REDIST_VERSIONS_TO_BUILD_TEMPLATES | CCCL_GITHUB_VERSIONS_TO_BUILD_TEMPLATES,
# PPC64LE: )

# PPC64LE: cudnn_redist_init_repository(
# PPC64LE:     cudnn_redistributions = CUDNN_REDISTRIBUTIONS,
# PPC64LE: )

load(
    "@rules_ml_toolchain//gpu/cuda:cuda_configure.bzl",
    "cuda_configure",
)

cuda_configure(name = "local_config_cuda")

# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/nccl:nccl_redist_init_repository.bzl",
# PPC64LE:     "nccl_redist_init_repository",
# PPC64LE: )

# PPC64LE: nccl_redist_init_repository()

load(
    "@rules_ml_toolchain//gpu/nccl:nccl_configure.bzl",
    "nccl_configure",
)

nccl_configure(name = "local_config_nccl")

# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/nvshmem:nvshmem_json_init_repository.bzl",
# PPC64LE:     "nvshmem_json_init_repository",
# PPC64LE: )

# PPC64LE: nvshmem_json_init_repository()

# PPC64LE: load(
# PPC64LE:     "@nvshmem_redist_json//:distributions.bzl",
# PPC64LE:     "NVSHMEM_REDISTRIBUTIONS",
# PPC64LE: )
# PPC64LE: load(
# PPC64LE:     "@rules_ml_toolchain//gpu/nvshmem:nvshmem_redist_init_repository.bzl",
# PPC64LE:     "nvshmem_redist_init_repository",
# PPC64LE: )

# PPC64LE: nvshmem_redist_init_repository(
# PPC64LE:     nvshmem_redistributions = NVSHMEM_REDISTRIBUTIONS,
# PPC64LE: )

# PPC64LE: inject tf_wheel_version_suffix (python_wheel_version_suffix_repository commented out)
local_repository(
    name = "tf_wheel_version_suffix",
    path = "/root/tf_wheel_version_suffix_stub",
)
