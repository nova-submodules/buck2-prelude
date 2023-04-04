# Copyright (c) Meta Platforms, Inc. and affiliates.
#
# This source code is licensed under both the MIT license found in the
# LICENSE-MIT file in the root directory of this source tree and the Apache
# License, Version 2.0 found in the LICENSE-APACHE file in the root directory
# of this source tree.

# TODO(cjhopman): This was generated by scripts/hacks/rules_shim_with_docs.py,
# but should be manually editted going forward. There may be some errors in
# the generated docs, and so those should be verified to be accurate and
# well-formatted (and then delete this TODO)

load(":common.bzl", "CxxSourceType", "IncludeType")

def _srcs_arg():
    return {
        "srcs": attrs.list(attrs.one_of(attrs.source(), attrs.tuple(attrs.source(), attrs.list(attrs.arg()))), default = [], doc = """
    The set of C, C++, Objective-C, Objective-C++, or assembly source files
     to be preprocessed, compiled, and assembled by this
     rule. We determine which stages to run on each input source based on its file extension. See the
     [GCC documentation](https://gcc.gnu.org/onlinedocs/gcc/Overall-Options.html) for more detail on how file extensions are interpreted. Each element can be either a string
     specifying a source file (e.g. `''`) or a tuple of
     a string specifying a source file and a list of compilation flags
     (e.g. `('', ['-Wall', '-Werror'])` ). In the latter case the specified flags will be used in addition to the rule's other
     flags when preprocessing and compiling that file (if applicable).
"""),
    }

def _deps_arg():
    return {
        "deps": attrs.list(attrs.dep(), default = [], doc = """
    Other rules that list `srcs` from which this rule imports.
"""),
    }

def _platform_srcs_arg():
    return {
        "platform_srcs": attrs.list(attrs.tuple(attrs.regex(), attrs.set(attrs.one_of(attrs.source(), attrs.tuple(attrs.source(), attrs.list(attrs.arg()))), sorted = True)), default = [], doc = """
    Platform specific source files. These should be specified as a list of pairs where the first
     element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the platform
     name is matched, and the second element is either a list of source files or a list of tuples of
     source files and a list of compilation flags to be preprocessed, compiled and assembled if the
     platform matches the regex. See `srcs` for more information.
"""),
    }

def _supported_platforms_regex_arg():
    return {
        "supported_platforms_regex": attrs.option(attrs.regex(), default = None, doc = """
    If present, an un-anchored regex (in java.util.regex.Pattern syntax) that matches all platforms
     that this library supports. It will not be built for other platforms.
"""),
    }

def _headers_arg():
    return {
        "headers": attrs.named_set(attrs.source(), sorted = True, default = [], doc = """
    The set of header files that are made available for inclusion to the source files in this
     target. These should be specified as either a list
     of header files or a dictionary of header names to header files. The header name can contain
     forward slashes (`/`). The headers can be included with `#include
     "$HEADER_NAMESPACE/$HEADER_NAME"` or `#include <$HEADER_NAMESPACE/$HEADER_NAME>` , where `$HEADER_NAMESPACE` is the value of the target's `header_namespace`  attribute, and `$HEADER_NAME` is the header name if specified, and the filename
     of the header file otherwise. See `header_namespace` for more information.
"""),
    }

def _platform_headers_arg():
    return {
        "platform_headers": attrs.list(attrs.tuple(attrs.regex(), attrs.named_set(attrs.source(), sorted = True)), default = [], doc = """
    Platform specific header files. These should be specified as a list of pairs where the first
     element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the platform
     name is matched, and the second element is either a list of header files or a dictionary of
     header names to header files that will be made available for inclusion to the source files in the
     target if the platform matches the regex. See `headers` for more information.
"""),
    }

def _exported_headers_arg():
    return {
        "exported_headers": attrs.named_set(attrs.source(), sorted = True, default = [], doc = """
    The set of header files that are made available for inclusion to the source files in the
     target and all targets that transitively depend on it. These should be specified as either a list
     of header files or a dictionary of header names to header files. The headers can be included
     with `#include "$HEADER_NAMESPACE/$HEADER_NAME"` or `#include
     <$HEADER_NAMESPACE/$HEADER_NAME>`, where `$HEADER_NAMESPACE` is the value
     of the target's `header_namespace` attribute, and `$HEADER_NAME` is the
     header name if specified, and the filename of the header file otherwise. Note that the header name
     can contain forward slashes (`/`). See `header_namespace` for more
     information.
"""),
    }

def _exported_header_style_arg():
    return {
        "exported_header_style": attrs.enum(IncludeType, default = "local", doc = """
    How dependents should include exported headers from this rule. Can be either `local`
     (e.g. `-I`) or `system` (e.g. `-isystem`).
"""),
    }

def _exported_platform_headers_arg():
    return {
        "exported_platform_headers": attrs.list(attrs.tuple(attrs.regex(), attrs.named_set(attrs.source(), sorted = True)), default = [], doc = """
    Platform specific header files. These should be specified as a list of pairs where the first
     element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the platform
     name is matched, and the second element is either a list of header files or a dictionary of
     header names to header files that will be made available for inclusion to the source files in the
     target and all targets that transitively depend on it if the platform matches the regex.
     See `headers` for more information.
"""),
    }

def _header_namespace_arg():
    return {
        "header_namespace": attrs.option(attrs.string(), default = None, doc = """
    A path prefix when including headers of this target. Defaults to the path from the root of the
     repository to the directory where this target is defined. Can
     contain forward slashes (`/`), but cannot start with one. See `headers` for
     more information.
"""),
    }

def _preprocessor_flags_arg():
    return {
        "preprocessor_flags": attrs.list(attrs.arg(), default = [], doc = """
    Flags to use when preprocessing any of the above sources (which require preprocessing).
"""),
    }

def _lang_preprocessor_flags_arg():
    return {
        "lang_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.arg()), sorted = False, default = {}, doc = """
    Language-specific preprocessor flags. These should be specified as a map of C-family language short
     names to lists of flags and is used to target flags to sources files for a specific language in the
     C-family (C, C++, assembler, etc.). The keys in the map can be:
     * `c` for C
    * `c++` for C++
    * `objective-c` for Objective-C
    * `objective-c++` for Objective-C++
    * `cuda` for Cuda
    * `assembler-with-cpp` for Assembly
    * `asm-with-cpp` for ASM
"""),
    }

def _exported_lang_preprocessor_flags_arg():
    return {
        "exported_lang_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.arg()), sorted = False, default = {}, doc = """
    Just as `lang_preprocessor_flags`, but these flags also apply to
     rules that transitively depend on this rule.
"""),
    }

def _lang_platform_preprocessor_flags_arg():
    return {
        "lang_platform_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg()))), sorted = False, default = {}, doc = """
    Language- and platform-specific preprocessor flags. These should be specified as a map of C-family language short
     names, as described in `lang_preprocessor_flags`, to lists of pairs, as described in `platform_preprocessor_flags`.
"""),
    }

def _exported_lang_platform_preprocessor_flags_arg():
    return {
        "exported_lang_platform_preprocessor_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg()))), sorted = False, default = {}, doc = """
    Just as `lang_platform_preprocessor_flags`, but these flags also apply to
     rules that transitively depend on this rule.
"""),
    }

def _platform_preprocessor_flags_arg():
    return {
        "platform_preprocessor_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform specific preprocessor flags. These should be specified as a list of pairs where the first
     element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the platform
     name is matched, and the second element is a list of flags to use when preprocessing the target's
     sources. See `preprocessor_flags` for more information.
"""),
    }

def _exported_preprocessor_flags_arg(exported_preprocessor_flags_type):
    return {
        "exported_preprocessor_flags": exported_preprocessor_flags_type,
    }

def _exported_platform_preprocessor_flags_arg():
    return {
        "exported_platform_preprocessor_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform specific exported preprocessor flags. These should be specified as a list of pairs where
     the first element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the
     platform name is matched, and the second element is a list of flags to use when preprocessing the
     source files in the target and all targets that transitively depend on it if the platform matches
     the regex. See `exported_preprocessor_flags` for more information.
"""),
    }

def _compiler_flags_arg():
    return {
        "compiler_flags": attrs.list(attrs.arg(), default = [], doc = """
    Flags to use when compiling any of the above sources (which require compilation).
"""),
    }

def _platform_compiler_flags_arg():
    return {
        "platform_compiler_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform specific compiler flags. These should be specified as a list of pairs where the first
     element is an un-anchored regex (in java.util.regex.Pattern syntax) against which the platform
     name is matched, and the second element is a list of flags to use when compiling the target's
     sources. See `compiler_flags` for more information.
"""),
    }

def _lang_compiler_flags_arg():
    return {
        "lang_compiler_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.arg()), sorted = False, default = {}, doc = """
    Language-specific compiler flags. These should be specified as a map of C-family language short
     names to lists of flags and is used to target flags to sources files for a specific language in the
     C-family (C, C++, assembler, etc.). The keys in the map can be:
     * `cpp-output` for C
    * `c++-cpp-output` for C++
    * `objective-c-cpp-output` for Objective-C
    * `objective-c++-cpp-output` for Objective-C++
    * `cuda-cpp-output` for Cuda
    * `assembler` for Assembly
    * `asm` for ASM
"""),
    }

def _lang_platform_compiler_flags_arg():
    return {
        "lang_platform_compiler_flags": attrs.dict(key = attrs.enum(CxxSourceType), value = attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg()))), sorted = False, default = {}, doc = """
    Language- and platform-specific compiler flags. These should be specified as a map of C-family language short
     names, as described in `lang_compiler_flags`, to lists of pairs, as described in `platform_compiler_flags`.
"""),
    }

def _linker_extra_outputs_arg():
    return {
        "linker_extra_outputs": attrs.list(attrs.string(), default = [], doc = """
    Declares extra outputs that the linker emits. These identifiers can be used in
     `$(output ...)` macros in `linker_flags` to interpolate the output path
     into the linker command line. Useful for custom linkers that emit extra output files.
"""),
    }

def _linker_flags_arg():
    return {
        "linker_flags": attrs.list(attrs.arg(), default = [], doc = """
    Flags to add to the linker command line whenever the output from this
     rule is used in a link operation, such as linked into an executable
     or a shared library.
"""),
    }

def _platform_linker_flags_arg():
    return {
        "platform_linker_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform-specific linker flags. This argument is specified as a list of pairs where the first
     element in each pair is an un-anchored regex against which the platform name is matched.
     The regex should use `java.util.regex.Pattern` syntax.
     The second element in each pair is a list of linker flags. If the regex matches the
     platform, these flags are added to the linker command line when the
     output from this rule is used in a link operation.
"""),
    }

def _exported_linker_flags_arg():
    return {
        "exported_linker_flags": attrs.list(attrs.arg(), default = [], doc = """
    Flags to add to the linker command line when the output from this
     rule, or the output from any rule that transitively depends on this
     rule, is used in a link operation.
"""),
    }

def _exported_post_linker_flags_arg():
    return {
        "exported_post_linker_flags": attrs.list(attrs.arg(), default = [], doc = """
    Flags to add to the linker command line when the output from this
     rule, or the output from any rule that transitively depends on this
     rule, is used in a link operation—with the additional feature
     that these flags are guaranteed to be placed *after* the compiled
     object (`.o`) files on the linker command line.
"""),
    }

def _exported_platform_linker_flags_arg():
    return {
        "exported_platform_linker_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform-specific linker flags for this rule and for all rules that
     transitively depend on this rule. This argument is specified
     as a list of pairs where the first element in each pair is an un-anchored regex
     against which the platform name is matched.
     The regex should use `java.util.regex.Pattern` syntax.
     The second element in each pair is a list of linker flags. If the regex matches the
     platform, these flags are added to the linker command line when the output from
     this rule, or the output from any rule that transitively depends on
     this rule, is used in a link operation.
"""),
    }

def _exported_post_platform_linker_flags_arg():
    return {
        "exported_post_platform_linker_flags": attrs.list(attrs.tuple(attrs.regex(), attrs.list(attrs.arg())), default = [], doc = """
    Platform-specific linker flags for this rule and for all
     rules that transitively depend on this rule—and that
     are guaranteed to be placed *after* the compiled object
     (`.o`) files on the linker command line. In other respects,
     the syntax and semantics of this argument are the same as
     for the `exported_platform_linker_flags` argument.
"""),
    }

def _precompiled_header_arg():
    return {
        "precompiled_header": attrs.option(attrs.source(), default = None, doc = """
    Path to a `cxx_precompiled_header` to use when compiling this rule's sources. The precompiled header (PCH) is built on-demand, using
     compiler flags matching those used in this rule's compile jobs. This is to ensure
     compatibility between this rule and the PCH. Also, this rule will inherit additional
     `deps` from the PCH rule, and as a result, additional include paths as well
     (e.g. `-I`, `-isystem`, `-iquote` path lists,
     and framework paths specified with `-F`).
"""),
    }

def _force_static(force_static_type):
    return {
        "force_static": force_static_type,
    }

def _reexport_all_header_dependencies_arg():
    return {
        "reexport_all_header_dependencies": attrs.option(attrs.bool(), default = None, doc = """
    Whether to automatically re-export the exported headers of all dependencies.
 
     When this is set to false, only exported headers from
     `exported_deps` are re-exported.
"""),
    }

def _exported_deps_arg():
    return {
        "exported_deps": attrs.list(attrs.dep(), default = [], doc = """
    Dependencies that will also appear to belong to any rules that depend on this
     one. This has two effects:
     * Exported dependencies will also be included in the link line of
     dependents of this rules, but normal dependencies will not.
    * When `reexport_all_header_dependencies = False`, only exported
     headers of the rules specified here are re-exported.
"""),
    }

def _exported_platform_deps_arg():
    return {
        "exported_platform_deps": attrs.list(attrs.tuple(attrs.regex(), attrs.set(attrs.dep(), sorted = True)), default = [], doc = """
    Platform specific dependencies that will also appear to belong to any rules
     that depend on this one.
     These should be specified as a list of pairs where the first element is an
     un-anchored regex (in java.util.regex.Pattern syntax) against which the
     platform name is matched, and the second element is a list of external
     dependencies (same format as `exported_deps`) that are exported
     if the platform matches the regex.
     See `exported_deps` for more information.
"""),
    }

def _supports_merged_linking():
    return {
        "supports_merged_linking": attrs.option(attrs.bool(), default = None, doc = """
    Whether this rule supports building with the merged linking strategy when building for non-native
     binaries (e.g. when using `.buckconfig`
    s `merged` setting).
"""),
    }

def _raw_headers_arg():
    return {
        "raw_headers": attrs.set(attrs.source(), sorted = True, default = [], doc = """
    The set of header files that can be used for inclusion to the source files in the target and all
     targets that transitively depend on it. Buck doesn't add raw headers to the search path of a
     compiler/preprocessor automatically.
     `include_directories` and `public_include_directories` are the recommended
     way to add raw headers to the search path (they will be added via `-I`).
     `compiler_flags`, `preprocessor_flags` and `exported_preprocessor_flags`
     can also be used to add such raw headers to the search path if inclusion via `-isystem` or
     `-iquote` is needed.
     `raw_headers` cannot be used together with `headers` or `exported_headers` in the same target.
"""),
    }

def _include_directories_arg():
    return {
        "include_directories": attrs.set(attrs.string(), sorted = True, default = [], doc = """
    A list of include directories (with `raw_headers`) to be added to the compile command for compiling this target
     (via `-I`).
     An include directory is relative to the current package.
"""),
    }

def _public_include_directories_arg():
    return {
        "public_include_directories": attrs.set(attrs.string(), sorted = True, default = [], doc = """
    A list of include directories (with `raw_headers`) to be added to the compile command for compiling this target
     and every target that depends on it (via `-I`). An include directory is relative to the current package.
"""),
    }

def _public_system_include_directories_arg():
    return {
        "public_system_include_directories": attrs.set(attrs.string(), sorted = True, default = [], doc = """
    A list of include directories (with `raw_headers`) to be added to the compile command for compiling this target
     and every target that depends on it (via `-isystem` if the compiler supports it of via `-I` otherwise).
     An include directory is relative to the current package.
"""),
    }

cxx_common = struct(
    srcs_arg = _srcs_arg,
    deps_arg = _deps_arg,
    platform_srcs_arg = _platform_srcs_arg,
    supported_platforms_regex_arg = _supported_platforms_regex_arg,
    headers_arg = _headers_arg,
    platform_headers_arg = _platform_headers_arg,
    exported_headers_arg = _exported_headers_arg,
    exported_header_style_arg = _exported_header_style_arg,
    exported_platform_headers_arg = _exported_platform_headers_arg,
    header_namespace_arg = _header_namespace_arg,
    preprocessor_flags_arg = _preprocessor_flags_arg,
    lang_preprocessor_flags_arg = _lang_preprocessor_flags_arg,
    exported_lang_preprocessor_flags_arg = _exported_lang_preprocessor_flags_arg,
    lang_platform_preprocessor_flags_arg = _lang_platform_preprocessor_flags_arg,
    exported_lang_platform_preprocessor_flags_arg = _exported_lang_platform_preprocessor_flags_arg,
    platform_preprocessor_flags_arg = _platform_preprocessor_flags_arg,
    exported_preprocessor_flags_arg = _exported_preprocessor_flags_arg,
    exported_platform_preprocessor_flags_arg = _exported_platform_preprocessor_flags_arg,
    compiler_flags_arg = _compiler_flags_arg,
    platform_compiler_flags_arg = _platform_compiler_flags_arg,
    lang_compiler_flags_arg = _lang_compiler_flags_arg,
    lang_platform_compiler_flags_arg = _lang_platform_compiler_flags_arg,
    linker_extra_outputs_arg = _linker_extra_outputs_arg,
    linker_flags_arg = _linker_flags_arg,
    platform_linker_flags_arg = _platform_linker_flags_arg,
    exported_linker_flags_arg = _exported_linker_flags_arg,
    exported_post_linker_flags_arg = _exported_post_linker_flags_arg,
    exported_platform_linker_flags_arg = _exported_platform_linker_flags_arg,
    exported_post_platform_linker_flags_arg = _exported_post_platform_linker_flags_arg,
    precompiled_header_arg = _precompiled_header_arg,
    force_static = _force_static,
    reexport_all_header_dependencies_arg = _reexport_all_header_dependencies_arg,
    exported_deps_arg = _exported_deps_arg,
    exported_platform_deps_arg = _exported_platform_deps_arg,
    supports_merged_linking = _supports_merged_linking,
    raw_headers_arg = _raw_headers_arg,
    include_directories_arg = _include_directories_arg,
    public_include_directories_arg = _public_include_directories_arg,
    public_system_include_directories_arg = _public_system_include_directories_arg,
)
